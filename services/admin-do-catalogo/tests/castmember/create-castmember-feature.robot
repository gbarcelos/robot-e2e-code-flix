*** Settings ***
Documentation       Suíte de testes da feature create castmember - API catalogo de vídeos
Resource            ../../resources/castmember/castmember-bdd-implementation.robot

*** Test Case ***
Cenário: Criar novo castmember

Cenário: Criar novo castmember com o nome em branco

Cenário: Criar novo castmember com o nome em nulo

Cenário: Criar novo castmember com o nome com menos de 3 cacateres

Cenário: Criar novo castmember com o nome com mais de 255 cacateres

Cenário: Criar novo castmember com o type em nulo

Cenário: Criar novo castmember com o type inválido