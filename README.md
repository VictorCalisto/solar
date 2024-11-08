# Bem-vindo ao Projeto "Solar"

Nosso objetivo e incentivar o uso de energia solar.
para logar na intranet use
atendente@exemplo.com
ou 
chefe@exemplo.com

## Pré-requisitos

Antes de começar, certifique-se de ter as seguintes ferramentas instaladas em sua máquina:

- Git: [Instale o Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Docker: [Instale o Docker](https://docs.docker.com/get-docker/)

## Como Começar

1. **Clone o repositório do projeto "comex" usando o Git:**
   
    ```bash
        git clone https://github.com/VictorCalisto/solar.git
    ```
2. **Acesse a pasta "comex" com o comando:**
    ```bash
        cd solar
    ```
3. **Construa e inicie o projeto usando o Docker Compose:**
    ```bash
        docker-compose up --build -d
    ```
Isso inicializará o projeto "comex" e o executará em um contêiner Docker com um banco de dados PostgreSQL.

## Detalhes do Projeto
O projeto "comex" é uma aplicação Ruby on Rails inicial. Você pode acessá-lo, digitando http://localhost:3000 em seu navegador da web. O banco postgre esta acessivel em http://localhost:5432

## Parando o Projeto
Para parar o projeto e encerrar o contêiner Docker:
   ```bash
        docker-compose down
   ```
Isso interromperá a execução dos contêineres.

## Licença
Este projeto é de código aberto e segue os princípios do libertarianismo anarco-capitalista. Sinta-se à vontade para usá-lo e adaptá-lo de acordo com suas necessidades.
