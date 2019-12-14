*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    ../../resources/lib/db.py

*** Variables ***
${BASE_URL}    http://ninjaplus-api:3000
${email}       bruce@wayne.com 
${password}    pwd123

#Criado keyword para encapsular os metodos utilizados pelos testes
*** Keywords ***
Get token
    create session    nplus                ${BASE_URL}
    &{headers}=       create dictionary    Content-Type=application/json
    &{body}=          create dictionary    email=${email}                      password=${password} 
    ${response}=      post request         nplus                               /auth                    data=${body}    headers=${headers}
    log               ${response.text}
    ${token}          convert to String    JWT ${response.json()['token']}
    ${id}             convert to String    ${response.json()['userId']}
    [return]          ${token}             ${id}

Get User
    [Arguments]       ${user_id}
    ${token}          ${id}                Get token
    create session    nplus                ${BASE_URL}
    &{headers}=       create dictionary    Content-Type=application/json    Authorization=${token}
    ${response}=      get request          nplus                            /user/${user_id}          headers=${headers}
    log               ${response.text}
    [return]          ${response}

Post User
    [Arguments]       ${body}
    create session    nplus                ${BASE_URL}
    &{headers}=       create dictionary    Content-Type=application/json
    ${response}=      post request         nplus                            /user    data=${body}    headers=${headers}
    log               ${response.text}
    [return]          ${response}

Post User Return Id
    [Arguments]       ${body}
    create session    nplus                ${BASE_URL}
    &{headers}=       create dictionary    Content-Type=application/json
    ${response}=      post request         nplus                            /user    data=${body}    headers=${headers}
    log               ${response.text}
    ${user_id}        convert to string    ${response.json()['id']}
    [return]          ${user_id}

Delete User
    [Arguments]       ${user_id}
    ${token}          ${id}                Get Token
    create session    nplus                ${BASE_URL}
    &{headers}=       create dictionary    Content-Type=application/json    Authorization=${token}
    ${response}=      delete request       nplus                            /user/${user_id}          headers=${headers}
    log               ${response.text}
    [return]          ${response}

Put User
    [Arguments]       ${user_id}           ${body}
    ${token}          ${id}                Get Token
    create session    nplus                ${BASE_URL}
    &{headers}=       create dictionary    Content-Type=application/json    Authorization=${token}
    ${response}=      put request          nplus                            /user/${user_id}          data=${body}    headers=${headers}
    log               ${response.text}
    [return]          ${response}