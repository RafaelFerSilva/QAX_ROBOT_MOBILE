*** Settings ***

Resource    ${EXECDIR}/resources/base.resource

Suite Setup    Run Keywords     Start Session    AND    
...                             Get Started    AND    
...                             Navigate to Formulários

Test Setup        Go to item     Cadastro    Crie sua conta.
Test Teardown     Back Last Screen
Suite Teardown    Close session
Force Tags        spinner

*** Test Cases ***

Deve selecionar o nível Jedi

  Click Element     id=com.qaxperience.yodapp:id/spinnerJob
  Wait Until Element Is Visible     class=android.widget.ListView
  Click Text      Jedi
