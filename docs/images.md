#Comando de exemplos para docker images

                    ##        .
              ## ## ##       ==
           ## ## ## ##      ===
       /""""""""""""""""___/ ===
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
       \______ o          __/
        \    \        __/
          \____\______/

- docker version
- docker images --help

- docker images 
    // lista as images
- docker pull ubuntu:14.04 
    //faz download da image docker do ubuntu-14.04
- docker pull mysql 
    // faz download da image docker para mysql
- docker rmi <image_name> 
    // remove a imagem
- docker rmi $(docker images -qa) 
    //remove todas as imagens

- docker commit exemplo02 anspfeifer/ubuntu-exemplo:1.0
    // cria uma nova image com base no container exemplo02

    
- docker login --username=anspfeifer --email=anspfeifer@gmail.com
    // fazer login no docker hub
    
- docker push anspfeifer/mysql
    // enviar image para docker hub
[Repositorio de images docker](https://hub.docker.com)

