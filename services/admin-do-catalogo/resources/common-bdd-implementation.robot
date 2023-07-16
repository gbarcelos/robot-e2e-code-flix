*** Settings ***
Resource  common-steps.robot

*** Keywords ***
#### DADO
Dado que esteja conectado na API catalogo de videos
    Conecta na API

#### ENTÃO
Então a mensagem de erro "${ERROR_MSG}" deve ser retornada e com codigo de erro "${ERROR_CODE}"
    Confere o status code     ${ERROR_CODE}
    Confere Mensagem de Erro  ${ERROR_MSG}