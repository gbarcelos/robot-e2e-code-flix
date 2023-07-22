*** Settings ***
Resource  ../common-steps.robot

*** Variable ***
${CAST_MEMBERS_URL}         /cast_members
${CAST_MEMBERS_OBJ}

*** Keywords ***
#### STEPS
Gera um castmember
    ${name}           FakerLibrary.First Name Nonbinary
    ${CAST_MEMBERS_OBJ}=    Create Dictionary    name=${name}  type=ACTOR
    Set Test Variable   ${CAST_MEMBERS_OBJ}

Realiza requisição para criar um castmember
    ${RESPOSTA}=    POST On Session    conectaNaAPI    ${CAST_MEMBERS_URL}    json=${CAST_MEMBERS_OBJ}    expected_status=any
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Realiza requisição update by id em castmembers
    [Arguments]         ${CAST_MEMBER_DESEJADO}
    ${RESPOSTA}=    PUT On Session    conectaNaAPI    ${CAST_MEMBERS_URL}/${CAST_MEMBER_DESEJADO}    json=${CAST_MEMBERS_OBJ}    expected_status=any
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Realiza requisição get by id em castmembers
    [Arguments]         ${CAST_MEMBER_DESEJADO}
    ${RESPOSTA}=        GET On Session  conectaNaAPI  ${CAST_MEMBERS_URL}/${CAST_MEMBER_DESEJADO}    expected_status=any
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Realiza requisição delete by id em castmembers
    [Arguments]         ${CAST_MEMBER_DESEJADO}
    ${RESPOSTA}=        DELETE On Session  conectaNaAPI  ${CAST_MEMBERS_URL}/${CAST_MEMBER_DESEJADO}    expected_status=any
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Confere nome do castmember
    [Arguments]         ${NOME}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  name   ${NOME}