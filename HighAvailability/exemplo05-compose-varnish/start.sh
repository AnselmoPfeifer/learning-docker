#!/usr/bin/env bash

DIR="/Users/anselmo/Documents/Desenvolvimento/workspace/DevOps/learning-docker/HighAvailability"

cd $DIR/app/produtos/

mvn clean package

cp -r target/produtos.war $DIR/exemplo05-compose-varnish/cluster/produtos.war

cd $DIR/exemplo05-compose-varnish/

echo "Recriando os containers."

docker rm $(docker ps -qa) -f

docker-compose up -d

docker ps -a

echo "###################################"
echo "#                                 #"
echo "#     http://localhost/produtos   #"
echo "#                                 #"
echo "###################################"


#docker exec -i localhost mysql -u root -pknkA9n7YnzvrDLE -h localhost -P 3306 cobranca < cluster/cobranca.sql 2> /dev/null
#docker ps -a

