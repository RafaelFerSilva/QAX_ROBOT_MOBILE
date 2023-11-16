*** Settings ***

Resource    ${EXECDIR}/resources/base.resource

Suite Setup    Run Keywords     Start Session    AND    
...                             Get Started    AND    
...                             Navigate to Formulários

Test Setup        Go to item     Login    Olá Padawan, vamos testar o login?
Test Teardown     Back Last Screen
Suite Teardown    Close session
Force Tags        login

*** Test Cases ***
Deve logar Com Sucesso

  Input Text    id=com.qaxperience.yodapp:id/etEmail        yoda@qax.com
  Input Text    id=com.qaxperience.yodapp:id/etPassword     jedi
  Click Element   id=com.qaxperience.yodapp:id/btnSubmit
  Wait Until Page Contains    Boas vindas, logado você está.

Não Deve logar Com Senha Incorreta

  Input Text    id=com.qaxperience.yodapp:id/etEmail        yoda@qax.com
  Input Text    id=com.qaxperience.yodapp:id/etPassword     sith
  Click Element   id=com.qaxperience.yodapp:id/btnSubmit
  Wait Until Page Contains    Oops! Credenciais incorretas.    10s
