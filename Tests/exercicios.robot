*** Settings ***

Documentation   Exemlpo de Tipos De Variaveis: SIMPLES DICIONÁRIOS

*** Variable ***
${NOME}     Ronaldo


&{PESSOA}
...     nome=Ronaldo
...     sobrenome=Valenga
...     email=ronaldovalenga95@gmail.com
...     idade=26
...     sexo=Masculino
...     cpf=00990000000

@{FRUTAS}   banana      uva     abacaxi     abacate     maça

@{PAISES}   Brasil      China   Mexico      Espanha     Italia

*** Test Cases ***
Imprimir todas as informações da PESSOA contida no dicionario
    
    Log To Console      ${PESSOA.nome}
    Log To Console      ${PESSOA.sobrenome}
    Log To Console      ${PESSOA.idade}
    Log To Console      ${PESSOA.email}
    Log To Console      ${PESSOA.sexo}
    Log To Console      ${PESSOA.cpf} 

Imprimir Lista de FRUTAS

    FOR    ${ELEMENTO}    IN    @{FRUTAS}
        Log To Console      ${ELEMENTO}
    END
    

    Log To Console      ${FRUTAS[0]}
    Log To Console      ${FRUTAS[1]}
    Log To Console      ${FRUTAS[2]}
    Log To Console      ${FRUTAS[3]}
    Log To Console      ${FRUTAS[4]}

Cenario Teste de Soma
    [tags]      soma
    ${Resultado}        Somara dois numeros     10  35
    Log To Console      ${Resultado}

Cenario criando meu email
    [Tags]      email
    ${EMAIL_NOVO}       Criando email       Ronaldo     Valenga     26
    Log To Console      ${EMAIL_NOVO}

Cenario: utilizando o for na pratica
    [Tags]      Luping
    Contar de 0 a 9

    Percorrer itens de uma Lista



*** Keywords ***
Somara dois numeros 

    [Arguments]     ${NUM_A}    ${NUM_B}
    ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}
    [Return]    ${SOMA}

Criando email
    [Arguments]     ${NOME}     ${SOBRENOME}        ${IDADE}
    ${EMAIL}        Catenate    SEPARATOR=_         ${NOME}     ${SOBRENOME}        ${IDADE}@robot.com
    [Return]        ${EMAIL}

Contar de 0 a 9
    FOR     ${count}    IN RANGE    0   9
            Log To Console      ${count}
    END

Percorrer itens de uma Lista
    FOR     ${frutas}   IN      @{FRUTAS}
            Log To Console      ${frutas}
    END




