FROM ubuntu:16.10

MAINTAINER Anselmo Pfeifer: 0.1

ENV DEBIAN_FRONTEND noninteractive
ENV PACOTES="nginx htop"

RUN apt update && apt -y install $PACOTES

RUN rm -f /etc/nginx/nginx.conf
RUN rm -f /var/www/html/index.html
RUN rm -f /etc/nginx/sites-available/default

ADD nginx.conf /etc/nginx/nginx.conf
ADD index.html /var/www/html/index.html
COPY default /etc/nginx/sites-available/default

RUN nginx -t
RUN service nginx start
RUN service nginx status

EXPOSE 80
EXPOSE 443
EXPOSE 8080