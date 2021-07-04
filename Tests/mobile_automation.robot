*** Settings ***
Documentation       Aqui estarão presentes todos os cenarios de testes Mobile Android.

Resource            ../resources/resourcemobile.robot
Test Setup          Abrir o aplicativo
Test Teardown       Fechar o aplicativo

*** Test Case ***
Cenário: Pesquisar cursos do robot
    [Tags]      PESQUISA
    Dado que o cliente esteja na tela home
    E pesquisa por "robotframework"
    Quando clicar em Pesquisar
    Então serão apresentados vídeos sobre Robot Framework


Caso de Teste 02: Logar no YouTube​
    [tags]      logar   
    Logar no aplicativo com a conta x​
    Entrar no menu “Explorar”​
    Usar swipe de tela até o 10 item da tela​
    Clicar no vídeo

Caso de Teste 03: Usar método Swipe na tela​​
    [Tags]      explorar
    Entrar no menu “Explorar”​
    Usar swipe de tela até o 10 item da tela​
    Clicar no vídeo





