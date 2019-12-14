*** Settings ***
Library     OperatingSystem
Resource    ./base_api.robot

*** Variables ***
${name}        Spider Man
${email}       spider@man.com 
${password}    pwd123

*** Test Cases ***
Test: Create a new user
#variável definida com &{var} identifica que receberá uma collection, na hora de usar esta variável usar com $ ${var}
    Remove User By Email    ${email}
    
    #body padrão com poucos campos para o post
    #&{body}=               create dictionary    full_name=${name}          email=${email}    password=${password}
    
    #body criado através de um json / muito util para metodos com muitos dados
    ${body}=               get file             ${EXECDIR}/resources/json/post_200.json

    ${response}=           Post User            ${body}
    log to console         ${response.text}
    ${code}=               convert to string    ${response.status_code}
    should be equal        ${code}              200

Test: Email required
    &{body}=                           create dictionary     full_name=${name}                      email=${EMPTY}    password=${password}
    ${response}=                       Post User             ${body}
    ${code}=                           convert to string     ${response.status_code}
    should be equal                    ${code}               412
    dictionary should contain value    ${response.json()}    Validation notEmpty on email failed

Test: Password required
    &{body}=                           create dictionary     full_name=${name}                         email=${email}    password=${EMPTY}
    ${response}=                       Post User             ${body}
    ${code}=                           convert to string     ${response.status_code}
    should be equal                    ${code}               412
    dictionary should contain value    ${response.json()}    Validation notEmpty on password failed

Test: Name required
    &{body}=                           create dictionary     full_name=${EMPTY}                         email=${email}    password=${password}
    ${response}=                       Post User             ${body}
    ${code}=                           convert to string     ${response.status_code}
    should be equal                    ${code}               412
    dictionary should contain value    ${response.json()}    Validation notEmpty on full_name failed