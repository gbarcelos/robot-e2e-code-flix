*** Settings ***
Documentation       Suíte de testes da feature find category - API catalogo de vídeos
Resource            ../../resources/category/category-bdd-implementation.robot

*** Test Case ***
Cenário: Consulta de categoria existente
    Dado uma categoria criada com todos os campos informados
    Quando consultar a categoria com o id gerado
    Então deve retornar a categoria

Cenário: Consulta de categoria inexistente
    Dado que esteja conectado na API catalogo de videos
    Quando o usuário consultar a categoria por id "999999999"
    Então a mensagem de erro "Category with ID 999999999 was not found" deve ser retornada e com codigo de erro "404"