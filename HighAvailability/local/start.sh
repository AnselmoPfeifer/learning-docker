#!/usr/bin/env bash

sh /Users/anselmo/Downloads/1-apache-tomcat-8.0.22/bin/shutdown.sh
sh /Users/anselmo/Downloads/2-apache-tomcat-8.0.22/bin/shutdown.sh

cp 1-server.xml /Users/anselmo/Downloads/1-apache-tomcat-8.0.22/conf/server.xml
cp 2-server.xml /Users/anselmo/Downloads/2-apache-tomcat-8.0.22/conf/server.xml

rm -rf /Users/anselmo/Downloads/1-apache-tomcat-8.0.22/webapps/*
rm -rf /Users/anselmo/Downloads/1-apache-tomcat-8.0.22/work/*

rm -rf /Users/anselmo/Downloads/2-apache-tomcat-8.0.22/webapps/*
rm -rf /Users/anselmo/Downloads/2-apache-tomcat-8.0.22/work/*

cp /Users/anselmo/Documents/Desenvolvimento/workspace/DevOps/produtos/target/ROOT.war /Users/anselmo/Downloads/1-apache-tomcat-8.0.22/webapps/
cp /Users/anselmo/Documents/Desenvolvimento/workspace/DevOps/produtos/target/ROOT.war /Users/anselmo/Downloads/2-apache-tomcat-8.0.22/webapps/

sh /Users/anselmo/Downloads/1-apache-tomcat-8.0.22/bin/startup.sh
sh /Users/anselmo/Downloads/2-apache-tomcat-8.0.22/bin/startup.sh

sudo nginx -s stop
sudo nginx

