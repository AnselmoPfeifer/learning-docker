#!/usr/bin/env bash

echo "Recriando os containers."

docker rm $(docker ps -qa) -f

docker-compose up -d

docker exec -i varnish service varnish restart

docker rm varnish -f

docker build -t ubuntu:16.10 .


docker run -it --name varnish --link tomcat1:tomcat1 --link tomcat2:tomcat2 --link tomcat3:tomcat3 -p 6180:6180 -p 6182:6182 ubuntu:16.10

service varnish restart

docker ps -a

docker run --name loadbalancer -p 80:80 -p 443:443 --link varnish:varnish nginx