# Para teste localhost

O algoritmo padrão do Tomcat é o “all to all replication”.
Esse algoritmo é um exemplo de replicação pessimista, pois 
replica as sessões por todos os nós do cluster, de forma que 
todos os servidores permaneçam iguais durante todo o tempo. 
Esse algoritmo apresenta bom desempenho em pequenos clusters, 
mas é ineficiente em clusters maiores, devido ao alto tráfego 
de dados entre os nós ao replicarem os dados.

ClusterSessionListener é responsável pelo recebimento das 
mensagens replicadas de outros membros do cluster e 
JvmRouteSessionIDBinderListener é responsável pelo recebimento 
de alterações no SessionID.

tomcat server01
HTTP port = 8081
Server Port = 8005
AJP port="8009"

tomcat server02
HTTP port = 8082
Server Port = 8006
AJP port="8010"

sudo nginx // start do nginx:
sudo nginx -t
sudo nginx -s stop // stop do nginx

/usr/local/Cellar/nginx/1.8.1/html
/usr/local/var/log/nginx/access.log
/usr/local/var/log/nginx/error.log
/usr/local/etc/nginx/nginx.conf
/usr/local/etc/nginx/servers
/usr/local/Cellar/nginx/1.8.1/html/error.html

# Exemplo de /usr/local/etc/nginx/nginx.conf
worker_processes  auto;
worker_rlimit_nofile 1024;
error_log  /usr/local/var/log/nginx/error.log;
error_log  /usr/local/var/log/nginx/access.log  notice;
error_log  /usr/local/var/log/nginx/error.log  info;

pid        /usr/local/var/run/nginx.pid;

events {
    worker_connections  1024;
}


http {
    include       mime.types;
    default_type  application/octet-stream;

    sendfile        on;

    keepalive_timeout  65;

    gzip  on;

    include servers/*;
}


# Exemplo de /usr/local/etc/nginx/servers/proxy.conf
upstream tomcat {
  server localhost:8081;
  server localhost:8082;
}

server {
  listen 80;
  server_name localhost;

  access_log /usr/local/var/log/nginx/access.log;
  error_log /usr/local/var/log/nginx/error.log;

  error_page 404 /error.html;
  error_page 500 502 503 504 /error.html;

  location = /error.html {
    root /usr/local/Cellar/nginx/1.8.1/html;
  }

  root /usr/local/Cellar/nginx/1.8.1/html;

  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_pass http://tomcat;
      proxy_http_version 1.1;
    proxy_set_header Connection "";
    proxy_buffering off;
  }
}
