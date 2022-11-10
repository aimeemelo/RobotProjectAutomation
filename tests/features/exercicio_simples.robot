# *** Settings ***
# Library    SeleniumLibrary
# Library    DebugLibrary

# Resource    ../../src/config/hooks.robot

# *** Test Cases ***
# Caso de Teste 01: Abrir Browser
#      Abrir navegador
#      Pesquisar o produto "BLOUSE"
#      Verificar que o produto "BLOUSE" é listado nos resultados
#      Fechar o navegador

# *** Keywords ***
# Abrir navegador
#     Open Browser    http://automationpractice.com   chrome

# Pesquisar o produto "${ITEM}"
#     Debug
#     #Input Text id=search_query_top ${ITEM}
#     click element   class=btn.btn-default.button-search

# Verificar que o produto "${ITEM}" é listado nos resultados
#     Element Text Should Be    xpath=/html/body/div/div[2]/div/div[3]/div[2]/h1/span[1]  "${ITEM}"

# Fechar o navegador
#     Close Browser