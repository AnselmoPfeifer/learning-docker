# Comandos exemplos para docker containers

- docker run --help

- docker ps 
    // lista containers ativos
    
- docker ps -a 
    // lista todos os containers
    
- docker ps --format '{{.Names}},{{.Image}}\n{{.Status}}, PORTAS:{{.Ports}}\n'
    // outra fotma de imprimir a lista de containers
    
- docker run -it ubuntu bash 
    // cria um container e conecta via ssh
    
- docker run -dt --name exemplo01 ubuntu:14.04 
    //cria um container da image ubuntu em modo demon
    
- docker run -it --name exemplo02 ubuntu:14.04
    // cria um container em modo interativo como root, para sair sem matar o container "ctrl + pq"
    
- docker exec -it exemplo02 bash
    // conecta ao contaier em modo interativo, para sair sem matar o container "exit"
    
- docker exec exemplo02 ls -la /etc/
    // executa o comando ls -ls em /etc/ do container 
    
- docker <stop start restart> exemplo02

- docker rm <id_container> 
    // remove o container pelo id ou nome
    
- docker rm $(docker ps -qa) -f 
    // remove todos os container pelo id
	
- docker run -d -P --name web nginx 
- docker port web
        443/tcp -> 0.0.0.0:32768
        80/tcp -> 0.0.0.0:32769
        
        
    #Criando um conjunto de Containers para MySQL e wordpress
	- docker run --name database -e MYSQL_ROOT_PASSWORD=123 -d mysql 
	    // criar um container com a image mysql, com o nome database e senha root do mysql em 123
	    
    - docker run --name blog --link database:mysql -e WORDPRESS_DB_PASSWORD=123 -p 80:80 -d wordpress
        // cria um container com nome blog e faz um link como database recebendo a senha e fazendo proxy 
        // entre as portas 80 local e 80 interna do container
        
    - docker exec -it blog bash 
        // abre um terminal ssh interativo no container com o nome blog
        ps aux | grep www-data | wc -l // conta os processos rodando com usuario www-data 