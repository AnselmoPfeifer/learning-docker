#!/usr/bin/env bash
echo "Recriando os 4 containers."
docker rm $(docker ps -qa) -f

cd mysql
pwd
echo "Criando 1 container com mysql:5.6"
docker build -t mysql:5.6 .
docker run -d --name localhost -p 3306:3306 mysql:5.6
docker exec -i localhost service mysql status

cd tomcatecho "Criando os 3 containers com tomcat:8.5-jre8"
cd ../tomcat
pwd
rm *.war
cp /Users/anselmo/Documents/Desenvolvimento/workspace/JAVA/Spring/mvc-com-spring/cobranca/target/cobranca.war .
cp /Users/anselmo/Documents/Desenvolvimento/workspace/DevOps/produtos/target/ROOT.war .

docker build -t tomcat:8.5-jre8 .
docker run -d --name host1 --link localhost:mysql -p 8081:8080 tomcat:8.5-jre8
docker run -d --name host2 --link localhost:mysql -p 8082:8080 tomcat:8.5-jre8
docker run -d --name host3 --link localhost:mysql -p 8083:8080 tomcat:8.5-jre8

echo "#################################################"
echo "Criando os 1 container de loadbalancer com nginx"
cd ../loadbalancer/
pwd
docker run -d --name loadbalancer -p 80:80 -p 443:443 --link host1:host1 --link host2:host2 --link host3:host3 --env-file ./env.list jasonwyatt/nginx-loadbalancer


pwd
cd ../mysql/
pwd

echo "Restaurando banco de dados"
docker exec -i localhost service mysql start
docker exec -i localhost service mysql status
docker exec -i localhost mysql -u root -pknkA9n7YnzvrDLE -h localhost -P 3306 cobranca < cobranca.sql 2> /dev/null

echo "###################################"
echo "#                                 #"
echo "#     ACESSE                      #"
echo "#     HTTP://LOCALHOST/           #"
echo "#     HTTP://LOCALHOST/COBRANCA   #"
echo "#                                 #"
echo "###################################"