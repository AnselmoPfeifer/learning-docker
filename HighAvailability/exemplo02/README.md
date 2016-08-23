# High Availability com Docker

Melhoria comparado com exemplo 01:
    Aplicacao expoe o IP do container

- docker rm $(docker ps -qa) -f

- docker build -t tomcat:8.5 .

- docker run -d --name host1 -p 8081:8080 -p 45564:45564 tomcat:8.5
- docker run -d --name host2 -p 8082:8080 -p 45565:45564 tomcat:8.5
- docker run -d --name host3 -p 8083:8080 -p 45566:45564 tomcat:8.5

- docker run -d --name loadbalancer -p 80:80 -p 443:443 --link host1:host1 --link host2:host2 --link host3:host3 --env-file ./env.list jasonwyatt/nginx-loadbalancer