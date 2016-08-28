#!/usr/bin/env bash
DIR="/Users/anselmo/Documents/Desenvolvimento/workspace/DevOps/learning-docker/HighAvailability"
cd $DIR/app/produtos/
mvn clean package
cp -r target/ROOT/* $DIR/exemplo04-compose/cluster/ROOT/
cd $DIR/exemplo04-compose/

echo "Recriando os containers."

docker rm $(docker ps -qa) -f

docker-compose up -d

docker ps -a

echo "###################################"
echo "#                                 #"
echo "#     ACESSE http://localhost     #"
echo "#                                 #"
echo "###################################"

#docker cp $DIR/exemplo04-compose/cluster/ROOT tomcat1:/usr/local/tomcat/webapps/ROOT

