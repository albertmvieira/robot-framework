*** Settings ***
Resource    ./base_api.robot

*** Variables ***
${name}        Bruce Wayne
${email}       bruce@wayne.com 
${password}    pwd123

*** Test Cases ***
Test: Consult a user
    ${user_id}=                         convert to String    7
    ${response}=                        Get User             ${user_id}
    ${code}=                            convert to string    ${response.status_code}
    should be equal                     ${code}              200
    dictionary should contain value     ${response.json()}   ${name}  
    dictionary should contain value     ${response.json()}   ${email}