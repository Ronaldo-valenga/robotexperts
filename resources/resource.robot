*** Settings ***
Documentation       Aqui estarão presentes todas as Keywords que usaremos no projeto automação web

Library             SeleniumLibrary
Library             String
 

*** Variable ***
${BROWSER}             chrome
${URL}                 http://automationpractice.com

&{PESSOA}              nome=Ronaldo    sobrenome=Valenga    password=54321
...                    endereco=Jacob wellner, Vista Alegre    cidade=Curitiba
...                    estado=5  cep=22222      telefone=88589825

@{PRODUTOS_CATEGORIA}  Printed Summer Dress  Printed Chiffon Dress
${EMAIL}               jucajunior95@gmail.com

*** Keywords ***

Abrir navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser

Acessar a página home do site Automation Practice
    Go to       ${URL}
    Wait Until Element is Visible       xpath=//*[@id='block_top_menu']/ul
    Title Should Be                    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text      name=search_query   ${PRODUTO}

Clicar no botão pesquisar

    Click Element   name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Title Should Be     Search - My Store

Conferir mensagem "${MENS_ALERTA}"
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p
    Element Text Should Be          xpath=//*[@id="center_column"]/p     ${MENS_ALERTA}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]/ul/li[1]/a[@title="${CATEGORIA}"]
     Mouse Over                     xpath=//*[@id="block_top_menu"]/ul/li[1]/a[@title="${CATEGORIA}"]

Clicar na sub categoria "${SUBCATEGORIA}"
    Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a[@title="${SUBCATEGORIA}"]      2  
    Click Element                   xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a[@title="${SUBCATEGORIA}"] 
    
Conferir se os produtos da sub-categoria "${SUBCATEGORIA}" foram mostrados na página
            
    Set Focus To Element            xpath=//*[@id="center_column"]/ul/li[1]/div/div[1]/div/a[1]/img
    Page Should Contain Element     xpath=//*[@id="center_column"]/ul/li[1]/div/div[1]/div/a[1]/img
    Page Should Contain Element     xpath=//*[@id="center_column"]/ul/li[2]/div/div[1]/div/a[1]/img
    Page Should Contain Element     xpath=//*[@id="center_column"]/ul/li[3]/div/div[1]/div/a[2]
Clicar em "Sign in"
    Click Element    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a

Informar um e-mail válido
    Sleep   2
    Wait Until Element Is Visible   id=email_create
    
    Input Text                      id=email_create    ${EMAIL}
    Sleep   2

Clicar em "Create an account"
    Click Button                    id=SubmitCreate

Preencher os dados obrigatórios
    Wait Until Element Is Visible       id=customer_firstname
    Click Element                       id=id_gender2
    Input Text                          id=customer_firstname    ${PESSOA.nome}
    Input Text                          id=customer_lastname     ${PESSOA.sobrenome}
    Input Text                          id=passwd                ${PESSOA.password}
    Input Text                          id=address1              ${PESSOA.endereco}
    Input Text                          id=city                  ${PESSOA.cidade}
    Set Focus To Element                id=id_state
    Select From List By Index           id=id_state              ${PESSOA.estado}
    Input Text                          id=postcode              ${PESSOA.cep}
    Input Text                          id=phone_mobile          ${PESSOA.telefone}

Submeter cadastro
    Click Button                    submitAccount



Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p
    Element Text Should Be           xpath=//*[@id="center_column"]/p       Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           xpath=//*[@id="header"]/div[2]//div[1]/a/span    ${PESSOA.nome} ${PESSOA.sobrenome} 
       