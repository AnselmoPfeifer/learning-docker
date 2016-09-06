# Comandos exemplos para docker containers

- docker commit --help

- docker commit -m "Atualizando SO" host1 anspfeifer/ubuntu-exemplo:1.0

- docker commit exemplo02 anspfeifer/ubuntu-exemplo:1.0
    // cria uma image com base no conatiner exemplo02 para ver a image execute: docker images
    
- docker run -it --name exemplo03 anspfeifer/ubuntu-exemplo:1.0
    // para criar um novo container com base na image anspfeifer/ubuntu-exemplo:1.0