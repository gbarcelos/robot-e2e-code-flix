*** Settings ***
Documentation       Suíte de testes da feature delete category - API catalogo de vídeos
Resource            ../../resources/category/category-bdd-implementation.robot

*** Test Case ***
Cenário: Excluir uma categoria
    Dado uma categoria criada com apenas dados obrigatórios informados
    Quando excluir a categoria com o id gerado
    Então deve verificar a resposta do metodo excluir uma categoria
    E deve verificar se a categoria foi excluida com sucesso

Cenário: Excluir uma categoria inexistente
    Dado que esteja conectado na API catalogo de videos
    Quando o usuário excluir a categoria por id "999999999"
    Então deve verificar a resposta do metodo excluir uma categoria