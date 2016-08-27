FROM mysql:5.6
MAINTAINER Anselmo Pfeifer: 0.1

RUN apt-get update
RUN apt-get -y install htop
RUN apt-get -y install zip
RUN apt-get -y install apache2
RUN apt-get -y install tomcat7

ENV DEBIAN_FRONTEND noninteractive

ENV MYSQL_ROOT_PASSWORD=knkA9n7YnzvrDLE
ENV MYSQL_DATABASE=cobranca
ENV MYSQL_USER=cobranca
ENV MYSQL_PASSWORD=C41ZBxAmSLhRZliF

RUN chmod -R 755 /var/www/
RUN chown -R www-data:www-data /var/www/

ADD app/ /var/www/html
COPY app/ /var/www/html/app

EXPOSE 80
EXPOSE 3306
EXPOSE 8080