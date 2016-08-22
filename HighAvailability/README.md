# High Availability with Docker and JavaEE
                    ##        .
              ## ## ##       ==
           ## ## ## ##      ===
       /""""""""""""""""___/ ===
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
       \______ o          __/
        \    \        __/
          \____\______/
          
- docker build -t tomee-war --build-arg WAR_FILE=app_test.war .
- docker run --name host1 -p 8080:8080 tomee-war
- docker run --name host2 -p 8081:8080 tomee-war
- docker run --name host3 -p 8082:8080 tomee-war
	
docker run --name loadbalancer -p 80:80 --link host1:host1 --link host2:host2 --link host3:host3 --env-file ./env.list jasonwyatt/nginx-loadbalancer

docker exec -i -t loadbalancer /bin/bash

#  Exemplo conf nginx
upstream tomcat {
    server host1:8080;
    server host2:8080;
    server host3:8080;
}


server {
    listen 80;
    server_name loadbalance;
    error_log /dev/stdout error;
    access_log /dev/stdout;

    root /usr/share/nginx/html;

    location /app_test {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass http://tomcat/app_test;
        proxy_http_version 1.1;
        proxy_set_header Connection "";
        proxy_buffering off;
    }
}

[REPO Exemplo](https://github.com/eldermoraes/ha-dockerjavaee.git)