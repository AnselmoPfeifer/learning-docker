# High Availability com Docker

Melhoria comparado com exemplo 02:
   Usa banco de dados para armazenar as informacoes.

- docker rm $(docker ps -qa) -f

- docker build -t tomcat:8.5 .

- docker run -d --name host1 --link localhost:mysql -p 8080:8080 tomcat:8.5
- docker run -d --name host2 --link localhost:mysql -p 8081:8080 tomcat:8.5
- docker run -d --name host3 --link localhost:mysql -p 8082:8080 tomcat:8.5

- docker run -d --name loadbalancer -p 80:80 -p 443:443 --link host1:host1 --link host2:host2 --link host3:host3 --env-file ./env.list jasonwyatt/nginx-loadbalancer

http://localhost/