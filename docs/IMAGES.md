# Comando de exemplos para docker images

Images
Comando de exemplos para docker images

docker version
docker images --help

docker images
Para listar as images docker na maquina física 

docker search <name>
Faz uma pesquisa no repositorio pelo nome da image
https://hub.docker.com

docker pull ubuntu:16.10
Faz download da image docker do ubuntu-16.10

docker pull mysql
Faz download da image docker para mysql

docker rmi <image_name>
Remove a imagem

docker rmi $(docker images -qa)
Remove todas as imagens

docker commit exemplo02 anspfeifer/mysql:1.0
Cria uma nova image anspfeifer/mysql:1.0 com base no container exemplo02 com a TAG 1.0

docker login --username=anspfeifer --email=anspfeifer@gmail.com
Fazer login no docker hub
  
docker push anspfeifer/mysql
Enviar image para docker hub

