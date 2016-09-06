FROM tomcat

MAINTAINER Anselmo Pfeifer

ENV DEBIAN_FRONTEND noninteractive

ADD server.xml /usr/local/tomcat/conf/server.xml

ADD produtos.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
