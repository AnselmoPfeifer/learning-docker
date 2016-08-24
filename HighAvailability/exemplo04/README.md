# High Availability em Cluster com Docker

Objetivo:
    - pull de 3 containers de tomcat:8.5
    
- Passo 1: Criar um container Linux com image tomcat:8.5
- Passo 2 : configurar os appserver para compartilhar a sessao entre eles
Help:
    https://tomcat.apache.org/tomcat-7.0-doc/cluster-howto.html
        
    - docker build -t tomcat:8.5 .    
    
    - docker run -d --name host1 --link localhost:mysql -p 8080:8080 tomcat:8.5-jre8
    - docker run -d --name host2 --link localhost:mysql -p 8081:8080 tomcat:8.5-jre8
    - docker run -d --name host3 --link localhost:mysql -p 8082:8080 tomcat:8.5-jre8
    
    docker run -d --name host1 -p 8081:8080  tomcat:8.5-jre8
    docker run -d --name host2 -p 8082:8080 tomcat:8.5-jre8
    docker run -d --name host3 -p 8083:8080 tomcat:8.5-jre8
    
    
    - docker exec -it host1 /bin/bash -c "export TERM=xterm; exec bash"
    - cd /usr/local/tomcat/

- docker run -d --name loadbalancer -p 80:80 -p 443:443 --link host1:host1 --link host2:host2 --link host3:host3 --env-file ./env.list jasonwyatt/nginx-loadbalancer

http://localhost/
http://localhost/admin/


App com login:
https://github.com/bkielczewski/example-spring-boot-security.git