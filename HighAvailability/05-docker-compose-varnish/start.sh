#!/usr/bin/env bash

DIR="/Users/anselmo/Documents/Desenvolvimento/workspace/DevOps/learning-docker/HighAvailability"

cd $DIR/app/produtos/

mvn clean package

cp -r ../app/produtos/target/produtos.war $DIR/05-docker-compose-varnish/cluster/produtos.war

cd $DIR/05-docker-compose-varnish/

echo "Recriando os containers."

docker rm $(docker ps -qa) -f

docker-compose up -d

docker ps -a

docker rm varnish -f

docker build -t anspfeifer/varnish:1.0 .

docker run -it --name varnish --link tomcat1:tomcat1 --link tomcat2:tomcat2 --link tomcat3:tomcat3 anspfeifer/varnish:1.0

/etc/init.d/varnish restart

echo "###################################"
echo "#     service varnish restart     #"
echo "#     http://localhost/produtos   #"
echo "###################################"

docker exec -i localhost mysql -u root -pknkA9n7YnzvrDLE -h localhost -P 3306 cobranca < cluster/cobranca.sql 2> /dev/null
