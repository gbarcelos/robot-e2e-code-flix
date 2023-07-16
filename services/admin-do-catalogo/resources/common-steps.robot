*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     FakerLibrary    locale=pt_BR

*** Variable ***
${HOST}         http://localhost:8080/api
${RESPOSTA}
${ID}

*** Keywords ***
#### STEPS
Conecta na API
    Create Session      conectaNaAPI     ${HOST}    disable_warnings=True

Confere o status code
    [Arguments]     ${STATUS_ESPERADO}
    Should Be Equal As Strings   ${RESPOSTA.status_code}  ${STATUS_ESPERADO}
    Log             Status Code Retornado: ${RESPOSTA.status_code} -- Status Code Esperado: ${STATUS_ESPERADO}

Confere o id retornado
    Dictionary Should Contain Key  ${RESPOSTA.json()}  id
    ${ID}=  Get From Dictionary    ${RESPOSTA.json()}  id
    Set Test Variable   ${ID}

Confere Mensagem de Erro
    [Arguments]         ${ERROR_MSG}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  message   ${ERROR_MSG}