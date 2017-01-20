# Criar um container com mysql

docker rm database -f

docker build -t anspfeifer/mysql:1.3 .

docker run -d --name database -p 3106:3016 anspfeifer/mysql:1.3

docker ps -a

docker exec -it database bash
cat /tmp/dump.sql | mysql -u cobranca -pC41ZBxAmSLhRZliF cobranca
mysql -u cobranca -pC41ZBxAmSLhRZliF -h database
show databases;
use cobranca;
show tables;
select * from titulo;

mysql -u root -pknkA9n7YnzvrDLE
GRANT ALL PRIVILEGES ON cobranca.* TO cobranca@localhost IDENTIFIED BY 'C41ZBxAmSLhRZliF' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON cobranca.* TO cobranca@database IDENTIFIED BY 'C41ZBxAmSLhRZliF' WITH GRANT OPTION;

docker commit -m "Criando banco de dados" database anspfeifer/mysql:1.5
docker push anspfeifer/mysql:1.5
