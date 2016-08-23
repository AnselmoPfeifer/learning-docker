# Container com tomcat7 java8

                    ##        .
              ## ## ##       ==
           ## ## ## ##      ===
       /""""""""""""""""___/ ===
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
       \______ o          __/
        \    \        __/
          \____\______/
                 
Objetivo:
    - pull de 3 containers de tomcat:8.5
    
- Passo 1: Criar um container Linux com image tomcat:8.5
        
    - docker build -t tomcat:8.5 .    
    
    # para cada host (1,2,3)
    - docker run -d --name host1 --link localhost:mysql -p 8080:8080 tomcat:8.5
    - docker run -d --name host2 --link localhost:mysql -p 8081:8080 tomcat:8.5
    - docker run -d --name host3 --link localhost:mysql -p 8082:8080 tomcat:8.5
    
    docker run -d --name host1 -p 8081:8080 -p 45564:45564 tomcat:8.5
    docker run -d --name host2 -p 8082:8080 -p 45564:45564 tomcat:8.5
    docker run -d --name host3 -p 8083:8080 -p 45564:45564 tomcat:8.5
    
    
    - docker exec -it host1 /bin/bash -c "export TERM=xterm; exec bash"
    - cd /usr/local/tomcat/
        mysql -u cobranca -pC41ZBxAmSLhRZliF
        show databases;
        use cobranca;
        show tables;
        select * from titulo;
    