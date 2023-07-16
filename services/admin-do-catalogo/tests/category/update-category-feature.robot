*** Settings ***
Documentation       Suíte de testes da feature update category - API catalogo de vídeos
Resource            ../../resources/category/category-bdd-implementation.robot

*** Test Case ***
Cenário: Atualizar uma categoria
   Dado uma categoria criada com apenas dados obrigatórios informados
   Quando o usuário atualizar a categoria
   Então deve verificar a resposta do metodo atualizar uma categoria

##Cenário: Inativar uma categoria

##Cenário: Ativar uma categoria

##Cenário: Atualizar uma categoria inativa

Cenário: Atualizar uma categoria inexistente
    Dado que esteja conectado na API catalogo de videos
    Quando o usuário atualizar a categoria por id "999999999"
    Então a mensagem de erro "Category with ID 999999999 was not found" deve ser retornada e com codigo de erro "404"