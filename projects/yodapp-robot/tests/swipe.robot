*** Settings ***

Resource    ${EXECDIR}/resources/base.resource

Suite Setup    Run Keywords     Start Session    AND    
...                             Get Started    AND    
...                             Navigate to Star Wars

Test Setup        Go to item     Lista    Darth Vader
Test Teardown     Back Last Screen
Suite Teardown    Close session
Force Tags        spinner

*** Test Cases ***
Deve poder remover o Darth Vader

  ${positions}=    Get Element Location     xpath=//android.widget.TextView[@text="@darthvader"]/../../..//*[contains(@resource-id, "indicator")]
  ${start_x}      Set Variable    ${positions}[x]
  ${start_y}      Set Variable    ${positions}[y]
  ${offset_x}     Evaluate        ${positions}[x] - 650
  ${offset_y}     Set Variable    ${positions}[y]


  Swipe    ${start_x}    ${start_y}    ${offset_x}    ${offset_y}
  Wait Until Element Is Visible     id=com.qaxperience.yodapp:id/btnRemove
  Click Element     id=com.qaxperience.yodapp:id/btnRemove
  Wait Until Page Does Not Contain    Darth Vader