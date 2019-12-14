*** Settings ***
Documentation   Verifica se o App está online
Resource        ../../resources/web/steps/login.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
App is on the Air
    App deve estar no ar