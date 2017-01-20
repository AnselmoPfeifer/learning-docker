FROM anspfeifer/tomcat8:1.2

MAINTAINER Anselmo Pfeifer

ENV DEBIAN_FRONTEND noninteractive

RUN rm -rf /usr/local/tomcat/webapps/*
RUN rm -rf /usr/local/tomcat/work/*

ADD stormpath/apiKey.properties /root/.stormpath/apiKey.properties
ADD tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
ADD server.xml /usr/local/tomcat/conf/server.xml

ADD app/produtos.war /usr/local/tomcat/webapps/produtos.war
ADD app/cobranca.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
