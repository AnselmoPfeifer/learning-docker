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
