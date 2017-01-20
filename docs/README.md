#Comando de exemplos para docker build

- docker build -t anspfeifer/ubuntu-exemplo:1.1 .
    // com base no Dockerfile vai construir uma nova image anspfeifer/ubuntu-exemplo TAG 1.1
- docker run -it --name exemplo04 anspfeifer/ubuntu-exemplo:1.1
    // cria novo container com base na nova versao da image anspfeifer/ubuntu-exemplo:1.1