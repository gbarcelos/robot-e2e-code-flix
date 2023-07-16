*** Settings ***
Resource  ../common-steps.robot

*** Variable ***
${CATEGORY_URL}         /categories
${CATEGORY_OBJ}
${CATEGORY_ACTIVE}     true

*** Keywords ***
#### STEPS
Gera uma categoria com dados obrigatorios
    ${name}           FakerLibrary.First Name Nonbinary
    ${CATEGORY_OBJ}=    Create Dictionary    name=${name}  description=  is_active=
    Set Test Variable   ${CATEGORY_OBJ}

E com description igual a 
    [Arguments]         ${description_DESEJADA}
    Set To Dictionary    ${CATEGORY_OBJ}  description=${description_DESEJADA}

E com active igual a 
    [Arguments]         ${CATEGORY_ACTIVE_DESEJADA}
    Set To Dictionary    ${CATEGORY_OBJ}  is_active=${CATEGORY_ACTIVE_DESEJADA}

Realiza requisição para criar uma categoria
    ${RESPOSTA}=    POST On Session    conectaNaAPI    ${CATEGORY_URL}    json=${CATEGORY_OBJ}    expected_status=any
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Realiza requisição update by id em categorias
    [Arguments]         ${CATEGORIA_DESEJADA}
    ${RESPOSTA}=    PUT On Session    conectaNaAPI    ${CATEGORY_URL}/${CATEGORIA_DESEJADA}    json=${CATEGORY_OBJ}    expected_status=any
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Realiza requisição get by id em categorias
    [Arguments]         ${CATEGORIA_DESEJADA}
    ${RESPOSTA}=        GET On Session  conectaNaAPI  ${CATEGORY_URL}/${CATEGORIA_DESEJADA}    expected_status=any
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Realiza requisição delete by id em categorias
    [Arguments]         ${CATEGORIA_DESEJADA}
    ${RESPOSTA}=        DELETE On Session  conectaNaAPI  ${CATEGORY_URL}/${CATEGORIA_DESEJADA}    expected_status=any
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Confere nome da categoria
    [Arguments]         ${NOME}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  name   ${NOME}

Confere descricao da categoria
    [Arguments]         ${DESCRICAO}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  description       ${DESCRICAO}