*** Settings ***

Library 	AppiumLibrary
Library    String

Resource    ${EXECDIR}/resources/base.resource

Suite Setup    Run Keywords     Start Session    AND    
...                             Get Started    AND    
...                             Navigate to Clique em Botões 

Test Teardown    Back Last Screen

Suite Teardown    Close session

*** Test Cases ***

Deve realizar um click simples
    [Setup]     Go to item     Clique simples    Botão clique simples

	Click Text    CLIQUE SIMPLES
	Wait Until Page Contains    Isso é um clique simples

Deve realizar um click longo
    [Setup]     Go to item     Clique longo    Botão clique longo
  
	${positions}=   Get Element positions    ${LONG_CLICK_ID}

	Tap With Positions    1000    ${${positions}[x], ${positions}[y]}
	Wait Until Page Contains    Isso é um clique longo
    
