#!/usr/bin/env bash
echo "Recriando os 4 containers."
docker rm $(docker ps -qa) -f

echo "Criando os 3 containers com tomcat:8.5.4"
cd tomcat
cp /Users/anselmo/Documents/Desenvolvimento/workspace/DevOps/produtos/target/ROOT.war tomcat/
docker build -t tomcat:8.5 .
pwd

docker run -d --name host1 -p 8081:8080 -p 45564:45564 tomcat:8.5
docker run -d --name host2 -p 8082:8080 -p 45565:45564 tomcat:8.5
docker run -d --name host3 -p 8083:8080 -p 45566:45564 tomcat:8.5
sleep 2
echo "Criando os 1 container de loadbalancer com nginx"
cd ../loadbalancer/
pwd

docker run -d --name loadbalancer -p 80:80 -p 443:443 --link host1:host1 --link host2:host2 --link host3:host3 --env-file ./env.list jasonwyatt/nginx-loadbalancer
echo "Aguarde"

echo "###################################"
echo "#                                 #"
echo "#     ACESSE HTTP://LOCALHOST/    #"
echo "#                                 #"
echo "####################################"
