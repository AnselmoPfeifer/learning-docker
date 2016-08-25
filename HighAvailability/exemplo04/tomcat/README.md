# Container com tomcat7 java8

Objetivo:
    - pull de 3 containers de tomcat:8.5-jre8

 01:
    HTTP_PORT= 8081
    SHUTDOWN=8005
 02:
    HTTP_PORT= 8082
    SHUTDOWN=8005
    
 03:
    HTTP_PORT= 8083
    SHUTDOWN=8005
            
- Passo 1: Criar um container Linux com image tomcat:8.5
- Passo 2: configurar os appserver para compartilhar a sessao entre eles
- Passo 3 : Gerar uma app-web:
        mvn archetype:generate -DgroupId=com.anselmo -DartifactId=app-web -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

    - docker build -t tomcat:8.5 .    
    
    # para cada host (1,2,3)
    - docker run -d --name host1 --link localhost:mysql -p 8080:8080 tomcat:8.5-jre8
    - docker run -d --name host2 --link localhost:mysql -p 8081:8080 tomcat:8.5-jre8
    - docker run -d --name host3 --link localhost:mysql -p 8082:8080 tomcat:8.5-jre8
    
docker run -d --name host1 -p 8081:8080 tomcat:8.5-jre8
docker run -d --name host2 -p 8082:8080 tomcat:8.5-jre8
docker run -d --name host3 -p 8083:8080 tomcat:8.5-jre8
  
cd ../loadbalancer
docker run -d --name loadbalancer -p 80:80 -p 443:443 --link host1:host1 --env-file ./env.list jasonwyatt/nginx-loadbalancer

docker exec -it host1 /bin/bash -c "export TERM=xterm; exec bash"
cd /usr/local/tomcat/
    