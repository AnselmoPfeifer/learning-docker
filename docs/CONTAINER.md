# Comandos exemplos para docker containers

docker run --help

docker ps
Lista containers ativos
  
docker ps -a
Lista todos os containers
  
docker ps --format '{{.Names}},{{.Image}}\n{{.Status}}, PORTAS:{{.Ports}}\n'
Outra forma de imprimir a lista de containers
  
docker run -it ubuntu bash
Cria um container e conecta via ssh
  
docker run -dt --name exemplo01 ubuntu:14.04
Cria um container da image ubuntu em modo demon
  
docker run -it --name exemplo02 ubuntu:14.04
Cria um container em modo interativo como root, sair sem matar o container "ctrl + pq"

docker run -d --name host1 -p 8080:8080 tomcat
Cria um container com nome host1 liberando a porta 8080 usando a image tomcat

docker run --rm -it ubuntu bash
Cria um container temporário, apos o sair ele será destruído

docker exec -it exemplo02 bash
Conecta ao container em modo interativo, para sair sem matar o container "exit"
  
docker exec exemplo02 ls -la /etc/
Executa o comando ls -ls em /etc/ do container
  
docker <stop start restart> exemplo02
Faz o stop, start ou restart no container 

docker rm <id_container / name_container>
Remove o container pelo id ou nome
  
docker rm $(docker ps -qa) -f
Remove todos os container pelo id
 
docker port <name>
Lista as portas que o container tem aberto

docker exec -it exemplo02 bash
Abre um shell do container, exemplo de comando: apt-get update && apt-get -y install apache2   
  
docker cp cluster/ROOT/ host1:/usr/local/tomcat/webapps/ROOT
Copia arquivos para dentro do container

docker cp host1:/usr/local/tomcat/confs/server.xml .
Copia arquivos para fora do container onde ( . ) eh meu local de trabalho
     
Conjunto de Containers para Wordpress
docker run --name database -e MYSQL_ROOT_PASSWORD=123 -d mysql
Criar um container com a image mysql, com o nome database e senha root do mysql em 123
     
docker run --name blog --link database:mysql -e WORDPRESS_DB_PASSWORD=123 -p 80:80 -d wordpress
Cria um container com nome blog e faz um link como database recebendo a senha 
      
docker exec -it blog bash
Abre um terminal ssh interativo no container com o nome blog