*** Settings ***
Resource    ./base_api.robot

*** Variables ***
${email}       tony@stark.com 
${password}    pwd123
${user_id}     20
${name}=       Homem de Ferro

*** Test Cases ***
Test: Update a User
    &{body}=           create dictionary    full_name=${name}          email=${email}    password=${password}
    ${response}=       Put User             ${user_id}                 ${body}
    ${code}=           convert to string    ${response.status_code}
    should be equal    ${code}              200

