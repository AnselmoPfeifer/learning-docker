FROM anspfeifer/varnish:1.0

MAINTAINER Anselmo Pfeifer

ENV DEBIAN_FRONTEND noninteractive
ENV PACOTES="varnish nano telnet"

ENV TOMCAT_1_PORT_8080_TCP_ADDR=tomcat1
ENV TOMCAT_2_PORT_8080_TCP_ADDR=tomcat2
ENV TOMCAT_3_PORT_8080_TCP_ADDR=tomcat3

RUN apt update && apt -y install $PACOTES

RUN rm -f /etc/default/varnish
RUN rm -f /etc/varnish/default.vcl

ADD cluster/varnish /etc/default/varnish
ADD cluster/default.vcl /etc/varnish/default.vcl


EXPOSE 6081
EXPOSE 6082