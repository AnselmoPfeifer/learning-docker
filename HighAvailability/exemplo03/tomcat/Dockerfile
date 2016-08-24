FROM tomcat:8.5-jre8

MAINTAINER Anselmo Pfeifer: 0.1

ENV DEBIAN_FRONTEND noninteractive

RUN rm -rf /usr/local/tomcat/webapps/*
RUN rm -rf /usr/local/tomcat/work/*

ADD server.xml /usr/local/tomcat/conf/server.xml

ADD ROOT.war /usr/local/tomcat/webapps/ROOT.war
ADD cobranca.war /usr/local/tomcat/webapps/cobranca.war

EXPOSE 8080