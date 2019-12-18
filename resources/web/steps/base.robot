*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../../elements.robot

*** Variables ***
${DEFAULT_URL}      http://ninjaplus-web:5000/login
${BROWSER}          headlesschrome

*** Keywords ***
#### Setup e TearDown
Abrir navegador
    Open Browser                  ${DEFAULT_URL}    ${BROWSER} 
    Set Selenium Implicit Wait    10
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser

App deve estar no ar
    Title Should Be    Ninja+