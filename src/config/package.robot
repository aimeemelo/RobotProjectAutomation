*** Settings ***
Documentation        Este aqui é o nosso gerenciador de dependências.

########################################################
#                      Libraries                       #
########################################################
Library        SeleniumLibrary

########################################################
#                       Keywords                       #
########################################################
Resource       ../auto/keywords/kws_pesquisa.robot

########################################################
#                        Pages                         #
########################################################
Resource       ../auto/pages/page_home.robot
Resource       ../auto/pages/page_search.robot

########################################################
#                        Hooks                         #
########################################################
Resource        hooks.robot