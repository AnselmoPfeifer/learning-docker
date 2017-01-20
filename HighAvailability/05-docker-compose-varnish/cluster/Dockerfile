FROM tomcat

MAINTAINER Anselmo Pfeifer

ENV DEBIAN_FRONTEND noninteractive

ADD server.xml /usr/local/tomcat/conf/server.xml

ADD server.xml /usr/local/tomcat/conf/tomcat-users.xml

ADD ../../../app/produtos/target/produtos.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
