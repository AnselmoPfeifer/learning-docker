FROM reinblau/php-apache2

MAINTAINER Anselmo Pfeifer: 0.1

ENV DEBIAN_FRONTEND noninteractive

RUN rm -rf /var/www/app

COPY conf/ /

RUN chmod -R 755 /var/www/
RUN chown -R www-data:www-data /var/www/

EXPOSE 80
