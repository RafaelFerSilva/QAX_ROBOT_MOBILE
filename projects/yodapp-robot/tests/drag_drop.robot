*** Settings ***

Resource    ${EXECDIR}/resources/base.resource
Library     ${EXECDIR}/resources/libs/extend.py

Suite Setup    Run Keywords     Start Session    AND    
...                             Get Started    AND    
...                             Navigate to Star Wars

Test Setup        Go to item     Lista    Luke Skywalker
Test Teardown     Back Last Screen
Suite Teardown    Close session
Force Tags        spinner

*** Test Cases ***
Deve arrastar e soltar no top da Lista

  ${origin}     Set Variable      //android.widget.TextView[@text="@skywalker"]/../../..//*[contains(@resource-id, "drag_handle")]
  ${target}     Set Variable      //android.widget.TextView[@text="@mando"]/../../..//*[contains(@resource-id, "drag_handle")]

  My Drag And Drop    ${origin}   ${target}
  Sleep  3s