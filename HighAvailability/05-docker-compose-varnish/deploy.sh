#!/usr/bin/env bash

set -x

DIR="/Users/anselmo/Documents/Desenvolvimento/workspace/DevOps/learning-docker/HighAvailability"

cd $DIR/app/produtos/

mvn clean package

cp target/produtos.war $DIR/05-docker-compose-varnish/cluster/produtos.war

cd $DIR/05-docker-compose-varnish/


docker ps -a

echo "   http://localhost/produtos   "


#docker exec -i localhost mysql -u root -pknkA9n7YnzvrDLE -h localhost -P 3306 cobranca < cluster/cobranca.sql 2> /dev/null
#docker ps -a

