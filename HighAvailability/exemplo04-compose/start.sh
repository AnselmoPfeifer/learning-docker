#!/usr/bin/env bash
echo "Recriando os containers."
docker rm $(docker ps -qa) -f

docker-compose up -d

echo "###################################"
echo "#                                 #"
echo "#     ACESSE http://localhost     #"
echo "#                                 #"
echo "###################################"
