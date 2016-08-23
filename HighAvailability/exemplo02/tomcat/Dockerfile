FROM tomcat:8.5

MAINTAINER Anselmo Pfeifer: 0.1

ENV DEBIAN_FRONTEND noninteractive

RUN rm -rf /usr/local/tomcat/webapps/*
RUN rm -rf /usr/local/tomcat/work/*

#RUN apt-get update
#RUN apt-get -y install mysql-client

ADD server.xml /usr/local/tomcat/conf/server.xml

ARG WAR_FILE=ROOT.war
ADD ${WAR_FILE} /usr/local/tomcat/webapps/${WAR_FILE}

EXPOSE 8080