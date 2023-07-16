*** Settings ***
Resource  ../common-steps.robot
Resource  ../common-bdd-implementation.robot
Resource  category-steps.robot

*** Keywords ***
#### DADO
Dado uma categoria com apenas dados obrigatórios informados
    Gera uma categoria com dados obrigatorios

Dado uma categoria com todos os campos informados
    Gera uma categoria com dados obrigatorios
    ${description}    FakerLibrary.Text
    E com description igual a  ${description}
    E com active igual a  ${CATEGORY_ACTIVE}

Dado uma categoria criada com apenas dados obrigatórios informados
    Gera uma categoria com dados obrigatorios
    Quando criar uma categoria
    Então deve verificar a resposta do metodo criar uma categoria

Dado uma categoria criada com todos os campos informados
    Dado uma categoria com todos os campos informados
    Quando criar uma categoria
    Então deve verificar a resposta do metodo criar uma categoria

#### QUANDO
Quando criar uma categoria
    Conecta na API
    Realiza requisição para criar uma categoria

Quando o usuário atualizar a categoria
    ${description}    FakerLibrary.Text
    E com description igual a  ${description}
    E com active igual a  true
    Realiza requisição update by id em categorias  ${ID}

Quando o usuário atualizar a categoria por id "${CATEGORIA_ATUALIZADA}"
    Gera uma categoria com dados obrigatorios
    Realiza requisição update by id em categorias  ${CATEGORIA_ATUALIZADA}

Quando o usuário consultar a categoria por id "${CATEGORIA_CONSULTADA}"
    Realiza requisição get by id em categorias  ${CATEGORIA_CONSULTADA}

Quando consultar a categoria com o id gerado
    Realiza requisição get by id em categorias  ${ID}

Quando o usuário excluir a categoria por id "${CATEGORIA_DELETADA}"
    Realiza requisição delete by id em categorias  ${CATEGORIA_DELETADA}

Quando excluir a categoria com o id gerado
    Realiza requisição delete by id em categorias  ${ID}

#### ENTÃO
Então deve verificar a resposta do metodo criar uma categoria
    Confere o status code       201
    Confere o id retornado

Então deve retornar a categoria
    Confere o status code       200

Então deve ser mostrado o nome "${NOME}"
    Confere o status code       200
    Confere nome da categoria  ${NOME}

E deve ser mostrado a descrição "${DESCRICAO}"
    Confere descricao da categoria  ${DESCRICAO}

Então deve verificar a resposta do metodo excluir uma categoria
    Confere o status code       204

E deve verificar se a categoria foi excluida com sucesso
    Realiza requisição get by id em categorias  ${ID}
    Confere o status code       404

Então deve verificar a resposta do metodo atualizar uma categoria
    Confere o status code       200
    Confere o id retornado