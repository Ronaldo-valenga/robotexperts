*** Settings ***
Documentation    Aqui estarão presentes todas as keywords e variaveis dos testes automatizados Mobile.

Library                 AppiumLibrary

*** Variables ***
${FAZER_LOGIN}          id=com.google.android.youtube:id/button
${ADICIONAR_CONTA}      id=com.google.android.youtube:id/name 
${EMAIL}                jucajunio62@gmail.com
${SENHA}                tucunare
${CAMPO_EMAIL}          xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View[1]/android.widget.EditText
${CAMPO_SENHA}          xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View[1]/android.widget.EditText
${BUTTON_PROXIMO}       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.Button
${BUTTON_CONCORDO}   	xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[4]/android.view.View/android.widget.Button
${BUTTON_MAIS}      	xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.Button
${BUTTON_ACEITAR}       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.Button
${EXPLORAR_BUTTON}      xpath=//android.widget.Button[@content-desc="Explorar"]
${ABRIR_VIDEO}          xpath=(//android.widget.ImageView[@content-desc="Ir ao canal"])[3]
*** Keywords ***
Abrir o aplicativo
    Open Application    http://localhost:4723/wd/hub
...                     automationName=uiautomator2
...                     platformName=Android
...                     deviceName=f3b7f81f
...                     autoGrantPermissions=true
...                     appPackage=com.google.android.youtube
...                     appActivity=com.google.android.youtube.HomeActivity



Fechar o aplicativo
    Capture Page Screenshot
    Close Application
    

Dado que o cliente esteja na tela home
    Wait Until Element Is Visible           accessibility_id=YouTube

E pesquisa por "${PESQUISA}"
    Click Element                           accessibility_id=Pesquisar
    Input Text                              id=com.google.android.youtube:id/search_edit_text       ${PESQUISA}

Quando clicar em Pesquisar
    Press Keycode   66

Então serão apresentados vídeos sobre Robot Framework
    Wait Until Element Is Visible           xpath=//*[contains(@content-desc, 'Robot')]


Logar no aplicativo com a conta x​
    Log To Console                          loguei
    Click Element                           accessibility_id=Conta
    Sleep                                   2
    Click Element                           ${FAZER_LOGIN}
    Sleep                                   2
    Click Element                           ${ADICIONAR_CONTA}
    Sleep                                   2
    Wait Until Element Is Visible           ${CAMPO_EMAIL}
    Input Text                              ${CAMPO_EMAIL}      ${EMAIL}
    Click Element                           ${BUTTON_PROXIMO}
    Sleep                                   2
    Wait Until Element Is Visible           ${CAMPO_SENHA}
    Input Password                          ${CAMPO_SENHA}        ${SENHA}
    Click Element                           ${BUTTON_PROXIMO}
    Sleep                                   2
    Wait Until Element Is Visible           ${BUTTON_CONCORDO}
    Click Element                           ${BUTTON_CONCORDO}
    Sleep                                   2
    Wait Until Element Is Visible           ${BUTTON_MAIS}
    Click Element                           ${BUTTON_MAIS}
    Sleep                                   2
    Click Element                           ${BUTTON_ACEITAR}
    
    
Entrar no menu “Explorar”​
    
    Wait Until Element Is Visible           ${EXPLORAR_BUTTON}      35    
    Click Element                           ${EXPLORAR_BUTTON}

Usar swipe de tela até o 10 item da tela​
    Sleep                                   4
    Swipe                                   500    1600    500    900
    Swipe                                   500    1600    500    900
    Swipe                                   500    1600    500    900
    Swipe                                   500    1600    500    900
    Swipe                                   500    1600    500    900
    Swipe                                   500    1600    500    900
    Swipe                                   500    1600    500    900
    Swipe                                   500    1600    500    900
    Swipe                                   500    1600    500    1300
    Swipe                                   500    1600    500    1300
    Swipe                                   500    1600    500    1300
    
    
Clicar no vídeo
    Wait Until Element is Visible           ${ABRIR_VIDEO}      
    Click Element                           ${ABRIR_VIDEO}

