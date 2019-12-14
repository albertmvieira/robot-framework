*** Settings ***
Documentation   O usuário informa suas credenciais de acesso e submete o formulário de login
Resource        ../../resources/web/steps/login.robot
Test Template   Logando com credenciais inválidas devo ver uma mensagem de alerta

# Setup => coisas que devem acontecer antes do teste
# TearDown => coisas que devem acontecer depois do teste
# Suite => Vai fazer antes e depois da suite como um todo
#Test => Vai fazer antes e depois de cada teste

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

# DDT (Data Driven Testing)

*** Test Cases ***

Senha inválida              albert@ninjaplus.com        teste       Usuário e/ou senha inválidos
Usuário não cadastrado      padreKevedo@nokziste.com    teste       Usuário e/ou senha inválidos
Email não informado         ${EMPTY}                    teste       Opps. Cadê o email?
Senha não informada         albert@ninjaplus.com        ${EMPTY}    Opps. Cadê a senha?