# Curso Docker alura
 _________________
< Anselmo Pfeifer >
_________________
    \
     \
      \
                    ##        .
              ## ## ##       ==
           ## ## ## ##      ===
       /""""""""""""""""___/ ===
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
       \______ o          __/
        \    \        __/
          \____\______/

- docker version
- docker --help

- Comando de exemplos para docker images
	- docker images // lista as images
	- docker pull mysql // faz download da image docker para mysql
	- docker rmi <image_name> // remove a imagem
	- docker rmi $(docker images -qa) //remove todas as imagens
    - Repositorio de images docker https://hub.docker.com

- Comandos exemplos para docker containers
	- docker ps // lista containers ativos
	- docker ps -a // lista todos os containers
	- docker rm <id_container> // remove o container pelo id ou nome
	- docker rm $(docker ps -qa) -f // remove todos os container pelo id
	- docker run -it ubuntu bash // cria um container e conecta via ssh
	
	- docker run docker/whalesay cowsay boo // cria um container
	- docker run docker/whalesay cowsay Anselmo Pfeifer
	- docker build -t docker-whale .
	- docker run docker-whale 
    
- Criando um conjunto de Containers para MySQL e wordpress
	- docker run --name database -e MYSQL_ROOT_PASSWORD=123 -d mysql 
	    // criar um container com a image mysql, com o nome database e senha root do mysql em 123
    - docker run --name blog --link database:mysql -e WORDPRESS_DB_PASSWORD=123 -p 80:80 -d wordpress
        // cria um container com nome blog e faz um link como database recebendo a senha e fazendo proxy 
        // entre as portas 80 local e 80 interna do container
    - docker exec -it blog bash 
        // abre um terminal ssh interativo no container com o nome blog
        ps aux | grep www-data | wc -l // conta os processos rodando com usuario www-data 
        
docker pull anspfeifer/docker-pfeifer
docker run -d -P --name web nginx //new Container web com nginx
docker port web
        443/tcp -> 0.0.0.0:32768
        80/tcp -> 0.0.0.0:32769

docker run -d -P -v /Users/anselmo/Documents/Desenvolvimento/workspace/DevOps/4-Docker/Iniciando/Site:/usr/share/nginx/html --name mysite nginx
docker login --username=anspfeifer --email=anspfeifer@gmail.com

docker login --username=anspfeifer --email=anspfeifer@gmail.com
        Warning: '--email' is deprecated, it will be removed soon. See usage.
        Password:
        Login Succeeded

# Docker Machine
- docker-machine ip default
- docker-machine create -d virtualbox <nome-servidor> //Cria um navio para add nele os containers
- docker-machine ls //Lista maquinas
- docker-machine rm <nome_maquina> //remove

- docker-machine env default //Export variaveis de ambientes
- export DOCKER_TLS_VERIFY="1"
- export DOCKER_HOST="tcp://192.168.99.100:2376"
- export DOCKER_CERT_PATH="/Users/anselmo/.docker/machine/machines/default"
- export DOCKER_MACHINE_NAME="default"



