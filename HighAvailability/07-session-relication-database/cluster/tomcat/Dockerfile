FROM tomcat

MAINTAINER Anselmo Pfeifer

ENV DEBIAN_FRONTEND noninteractive

RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN rm -rf /usr/local/tomcat/webapps/docs
RUN rm -rf /usr/local/tomcat/webapps/examples
RUN rm -rf /usr/local/tomcat/webapps/host-manager

RUN rm -rf /usr/local/tomcat/work/*
RUN rm -rf /usr/local/tomcat/logs/*

ADD tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
ADD server.xml /usr/local/tomcat/conf/server.xml

EXPOSE 8080