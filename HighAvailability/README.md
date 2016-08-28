# Exemplo de configurações para High Availability

- exemplo01
    contem os arquivos de configuracoes para aplicar loadbalancer 
    usando 3 tomee + nginx. 
    
    Referêcia: https://community.oracle.com/docs/DOC-998210

- exemplo 02
    contem melhorias do exemplo 01, na app para expor o IP do container
    
- exemplo 03
   contem melhorias no exemplo 02 e add um container de banco de dados 
   para armazenar as informacoes.
   
- exemplo 04
  usando docker-compose para simular um ambinete de load balancer com mais
  3 container de tomcat em cluster realizando o compartilhamento de sessao.