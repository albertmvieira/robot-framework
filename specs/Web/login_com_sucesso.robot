*** Settings ***
Documentation   O usuário informa suas credenciais de acesso e vai para a área logada
Resource        ../../resources/web/steps/login.robot

# Setup => coisas que devem acontecer antes do teste
# TearDown => coisas que devem acontecer depois do teste
# Suite => Vai fazer antes e depois da suite como um todo
#Test => Vai fazer antes e depois de cada teste

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

# ATDD (Acceptance Test-Driven Development)

*** Test Cases ***
Login com sucesso
    Fazendo login com "albert@ninjaplus.com" e senha "teste123"
    Devo ver o meu nome "Albert" na área logada