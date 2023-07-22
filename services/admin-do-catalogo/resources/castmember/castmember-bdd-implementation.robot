
*** Settings ***
Resource  ../common-steps.robot
Resource  ../common-bdd-implementation.robot
Resource  castmember-steps.robot

*** Keywords ***
#### DADO
Dado um castmember
    Gera um castmember

#### QUANDO
Quando criar um castmember
    Conecta na API
    Realiza requisição para criar um castmember

#### ENTÃO
Então deve verificar a resposta do metodo criar um castmember
    Confere o status code       201
    Confere o id retornado