#!/usr/bin/env bash

echo "Recriando os containers."

docker rm $(docker ps -qa) -f

docker-compose up -d

docker rm varnish -f

docker build -t anspfeifer/varnish:1.0 .

docker run -it --name varnish --link tomcat1:tomcat1 --link tomcat2:tomcat2 --link tomcat3:tomcat3 -p 6180:6180 -p 6182:6182 anspfeifer/varnish:1.0

service varnish restart