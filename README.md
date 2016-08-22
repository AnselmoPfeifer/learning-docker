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

- Comando para images /docs/images.md
- Comando para containers /docs/container.md
- Comando para commit de containers /docs/commit.md
- Exemplos de Dockerfile example/*
    

        
        
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



