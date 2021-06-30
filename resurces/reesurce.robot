*** Settings ***
Documentation       Aqui estarão presentes todas as Keywords que usaremos no projeto automação web

Library             SeleniumLibrary
Library             String 

*** Variable ***
${BROWSER}      chrome
${URL}          http://automationpractice.com

&{PESSOA}              nome=Ronaldo    sobrenome=Valenga    pwd=54321
...                    endereco=Jacob wellner, Vista Alegre    cidade=Curitiba
...                    id_estado=PR  cep=22222 telefone=88094456

*** Keywords ***
### Setup e Teardown
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
    Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a[@title="${SUBCATEGORIA}"]     
    Click Element                   xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a[@title="${SUBCATEGORIA}"] 
    
Conferir se os produtos da sub-categoria "${SUBCATEGORIA}" foram mostrados na página
    Page Should Contain Element     xpath=//*[@id="center_column"]/ul/li[1]/div/div[1]/div/a[1]/img            


