# Criando um proxy reverse com loadbalancer com nginx

                    ##        .
              ## ## ##       ==
           ## ## ## ##      ===
       /""""""""""""""""___/ ===
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
       \______ o          __/
        \    \        __/
          \____\______/
                 
Objetivo:
    - Um container com loadbalancer (nginx)
    
- Passo 1: Criar um Dockerfile para a image asonwyatt/nginx-loadbalancer
        
    - docker build -t asonwyatt/nginx-loadbalancer .
    
    - docker run -d --name loadbalancer -p 80:80 -p 443:443 asonwyatt/nginx-loadbalancer
    
    - docker run -d --name loadbalancer -p 80:80 -p 443:443 --link host1:host1 --link host2:host2 --link host3:host3 --env-file ./env.list nginx
    
    - docker exec -it loadbalancer /bin/bash -c "export TERM=xterm; exec bash"
    
    
[https://hub.docker.com/r/jasonwyatt/nginx-loadbalancer/](nginx-loadbalancer)