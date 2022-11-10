*** Settings ***
Documentation        Aqui estarão presentes todos os exercícios da aula de automação.

...                  
Library    DateTime
Library    Collections


*** Variables ***

&{PESSOA}          
...                nome=Aimée   
...                sobrenome=Melo    
...                idade=30    
...                endereco=Rua dos bobos
...                cep=54430770
...                bairro=Candeias
...                cidade=Maringa
                
@{FRUTAS}        
...                banana
...                morango    
...                abacaxi
...                melancia
...                manga

@{LISTABASE}        
...                A
...                1    
...                B
...                2
...                C
...                3
@{listaNumeros}
@{listaLetras} 



*** Keywords ***

Receber idade e retornar ano de nascimento
    [Arguments]            ${IDADE}
    ${ANO_NASCIMENTO}    Evaluate    ${2022}-${IDADE}
    Log To Console         \nVocê nasceu no ano de ${ANO_NASCIMENTO}
    IF    ${ANO_NASCIMENTO} < ${2000}
        Log To Console    Portanto, nasceu no século passado
    END


Imprimir lista de FRUTAS
   FOR    ${fruta}    IN    @{FRUTAS}
        Log To Console       \n${fruta}
    END

        
Loop que contém números pares entre 0 e 10
    FOR    ${COUNT}    IN RANGE    0    11
        IF    ${COUNT}%2==0    Log To Console    \nO número ${COUNT} é par
    END


Adicionar números em uma nova lista a partir da LISTA BASE 

       FOR    ${caractere}    IN    @{LISTABASE}
            TRY
                ${validator}     Evaluate    ${caractere} + 1
                Append To List    ${listaNumeros}    ${caractere}
            EXCEPT   
                Append To List  ${listaLetras}    ${caractere}
                
            FINALLY
                Log To Console    Números encontrados até o momento: ${listaNumeros}
                Log To Console    Letras encontradas até o momento: ${listaLetras}
                
            END
        END
   
        Log To Console    ${SPACE}
        Log To Console    Números: ${listaNumeros}
        Log To Console    Letras: ${listaLetras}
      
    

*** Test Cases ***

Cenário: Imprimindo no console as informações da PESSOA
    [Tags]      INFORMACOES_PESSOAIS
    Log To Console  \nDados da pessoa:
    Log To Console  Nome: ${PESSOA.nome}
    Log To Console  Sobrenome: ${PESSOA.sobrenome}
    Log To Console  Idade: ${PESSOA.idade}
    Log To Console  Endereço: ${PESSOA.endereco}
    Log To Console  CEP: ${PESSOA.cep}
    Log To Console  Cidade: ${PESSOA.cidade}
    Log To Console  Bairro: ${PESSOA.bairro}


Cenário: Receber idade e retornar ano de nascimento
    [Tags]      ANO_NASCIMENTO
    Receber idade e retornar ano de nascimento    33


Cenário: Imprimindo lista de FRUTAS
    [Tags]        FRUTAS
    Imprimir lista de FRUTAS    

Cenário: Loop que contém números pares entre 0 e 10
    [Tags]        PAR
    Loop que contém números pares entre 0 e 10
    

Cenário: Adicionar números em uma nova lista a partir da LISTA BASE 
    [Tags]        NOVA_LISTA
    Adicionar números em uma nova lista a partir da LISTA BASE 