*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url} =    https://opensource-demo.orangehrmlive.com/index.php/auth/login
${browser} =     gc      

*** Test Cases ***
TC_001_loginTest
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    id=txtUsername    Admin
    Input Password    id=txtPassword    admin123    
    Click Button    id=btnLogin    
    ##Page Should Contain    Dashboard
    Page Should Not Contain    LOGIN  
    Click Element    id=welcome  
    Sleep    2s
    Click Link    link=Logout    
    Close Browser
    
TC_002_validationTextField
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Page Should Contain Textfield    id=txtUsername   
    Input Text    id=txtUsername    Admin
    Page Should Contain Textfield    id=txtPassword
    Input Password    id=txtPassword    admin123    
    Click Button    id=btnLogin    
    #Page Should Contain    Dashboard
    Page Should Not Contain    LOGIN  
    Click Element    id=welcome  
    Sleep    2s
    Click Link    link=Logout    
    Close Browser
    
TC_003_validationCheckBox
    Open Browser   https://login.salesforce.com/    chrome
    Maximize Browser Window
    Click Element    id=rememberUn
    Sleep    2s 
    Checkbox Should Be Selected    id=rememberUn  
    Click Element    id=rememberUn   
    Sleep    2s
    Checkbox Should Not Be Selected    id=rememberUn
    Close Browser
    
TC_004_validationLoginError
    Open Browser   https://login.salesforce.com/    chrome
    Maximize Browser Window
    Input Text    id=username    text
    Input Password    id=password    Abc987
    Sleep    2s 
    Click Button    id=Login
    Sleep    2s 
    #Element Text Should Be    id=error    Vérifiez votre nom d'utilisateur et votre mot de passe. Si vous ne parvenez toujours pas à vous connecter, contactez votre administrateur Salesforce. 
    Element Should Contain    id=error    Vérifiez votre nom d'utilisateur et votre mot de passe.    
    Close Browser
    
TC_005_validationTitle
    Open Browser   https://login.salesforce.com/    chrome
    Maximize Browser Window
    Sleep    2s 
    Title Should Be    Connexion | Salesforce
    Element Should Be Enabled    id=username
    Element Should Be Visible    id=password    
    Close Browser
    