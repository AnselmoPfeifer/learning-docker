# Criando uma image para o tomcat com as conf apropriadas

docker rm tomcat1 -f
docker rm tomcat2 -f
docker rm tomcat3 -f

docker build -t anspfeifer/tomcat8:1.2 .

docker run -d --name tomcat2 --link database:database -p 8082:8080 anspfeifer/tomcat8:1.1

docker logs tomcat1

docker commit -m "Instalando mysql-client" tomcat1 anspfeifer/tomcat8:1.1

docker push anspfeifer/tomcat8:1.2