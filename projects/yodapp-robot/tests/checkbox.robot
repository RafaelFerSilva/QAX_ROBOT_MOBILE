*** Settings ***

Library 	AppiumLibrary

Resource    ${EXECDIR}/resources/base.resource

Suite Setup    Run Keywords     Start Session    AND    
...                             Get Started    AND    
...                             Navigate to Check e Radio

Test Teardown    Back Last Screen

Suite Teardown    Close session

Test Tags        temp

*** Test Cases ***

Deve marcar as techs que usam Appium
    [Setup]     Go to item     Checkbox    Marque as techs que usam Appium

    @{techs}        Create List    Ruby    Python    Java    Javascript    C#    Robot Framework
    
    FOR    ${tech}    IN    @{techs}
	    Click Element    xpath=//android.widget.CheckBox[contains(@text, "${tech}")] 
    END

Deve marcar as linguagens preferidas
    [Setup]     Go to item     Botões de radio    Escolha sua linguagem preferida
    
	Click Element    xpath=//android.widget.RadioButton[contains(@text, "Python")]
