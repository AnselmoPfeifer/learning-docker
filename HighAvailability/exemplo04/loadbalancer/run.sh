#!/bin/bash

service nginx stop

rm -rf /tmp/scripts/
rm -rf /etc/nginx/nginx.conf

mkdir /etc/nginx/sites-available/
mkdir /etc/nginx/sites-enabled/
mkdir /etc/nginx/ssl/
mkdir /var/www/

cd /tmp/
unzip scripts.zip
chmod 777 -R /tmp/scripts/

cp /tmp/scripts/files/nginx/nginx.conf /etc/nginx/nginx.conf

#cp /tmp/scripts/files/nginx/default_http.conf /etc/nginx/sites-available/default_http.conf
#ln -s /etc/nginx/sites-available/default_http.conf /etc/nginx/sites-enabled/default_http.conf
#
#cp /tmp/scripts/files/nginx/default.conf /etc/nginx/sites-available/default.conf
#ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

cp /tmp/scripts/files/nginx/proxy.conf /etc/nginx/sites-available/proxy.conf
#ln -s /etc/nginx/sites-available/proxy.conf /etc/nginx/sites-enabled/proxy.conf

cp /tmp/scripts/files/nginx/perfect-forward-secrecy.conf /etc/nginx/
cp /tmp/scripts/files/nginx/dh4096.pem /etc/nginx/
cp /tmp/scripts/files/nginx/error.html /var/www/

mkdir /etc/nginx/ssl
cp -R /tmp/scripts/files/nginx/ssl/dev.portaltecsinapse.com.br /etc/nginx/ssl/
chmod 600  -R /etc/nginx/ssl/*

nginx -t
service nginx start