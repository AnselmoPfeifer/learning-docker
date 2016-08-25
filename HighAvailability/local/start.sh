#!/usr/bin/env bash

cp 1-server.xml /Users/anselmo/Downloads/1-apache-tomcat-8.5.4/conf/server.xml
cp 2-server.xml /Users/anselmo/Downloads/2-apache-tomcat-8.5.4/conf/server.xml

sh /Users/anselmo/Downloads/1-apache-tomcat-8.5.4/bin/startup.sh
sh /Users/anselmo/Downloads/2-apache-tomcat-8.5.4/bin/startup.sh

sudo nginx -s stop
sudo nginx