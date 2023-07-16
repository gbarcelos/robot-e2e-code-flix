*** Settings ***
Documentation       Suíte de testes da feature create category - API catalogo de vídeos - http://localhost:8080/api/swagger-ui/index.html
Resource            ../../resources/category/category-bdd-implementation.robot

*** Test Case ***
Cenário: Criar nova categoria com apenas dados obrigatorios
    Dado uma categoria com apenas dados obrigatórios informados
    Quando criar uma categoria
    Então deve verificar a resposta do metodo criar uma categoria

Cenário: Criar nova categoria com apenas dados obrigatorios e inativa
    Dado uma categoria com apenas dados obrigatórios informados
    E com active igual a  false
    Quando criar uma categoria
    Então deve verificar a resposta do metodo criar uma categoria

Cenário: Criar nova categoria
    Dado uma categoria com todos os campos informados
    Quando criar uma categoria
    Então deve verificar a resposta do metodo criar uma categoria

##Cenário: Criar uma categoria com o nome em branco
##Cenário: Criar uma categoria com o nome em nulo
##Cenário: Criar uma categoria com o nome com menos de 3 cacateres
##Cenário: Criar uma categoria com o nome com mais de 255 cacateres
##Cenário: Criar uma categoria com o nome de uma categoria existente