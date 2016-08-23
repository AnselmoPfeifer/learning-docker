# Container com MySQL-Server e um banco de dados

                    ##        .
              ## ## ##       ==
           ## ## ## ##      ===
       /""""""""""""""""___/ ===
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
       \______ o          __/
        \    \        __/
          \____\______/
                 
Objetivo:
    - container com mysql-server e um banco de dados
    
- Passo 1: Criar um container com base na image mysql:5.6
    - docker pull mysql:5.6
    
    - docker run -it --name mysql mysql:5.6
        
    - docker build -t mysql:5.6 .
    // add e configurar o Dockerfile
    
    - docker run -d --name localhost -p 3306:3306 mysql:5.6
    - docker exec -i localhost mysql -u root -pknkA9n7YnzvrDLE cobranca < cobranca.sql
    
    - docker exec -it host1 /bin/bash -c "export TERM=xterm; exec bash"
        mysql -u root -pknkA9n7YnzvrDLE 
        mysql -u cobranca -pC41ZBxAmSLhRZliF
        show databases;
        use cobranca;
        show tables;
        select * from titulo;
    
    
#Stop mysql-server
- /etc/init.d/mysql stop
- sudo launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist
