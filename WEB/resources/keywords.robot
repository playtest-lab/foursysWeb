*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String


*** Variables ***
${BROWSER}    Chrome
${URL}        https://automationexercise.com/login
${EXPECTED_TEXT_TITLE}  Account Created!
${EXPECTED_TEXT_FIRST}  Congratulations! Your new account has been successfully created!
${EXPECTED_TEXT_SECOND}    You can now take advantage of member privileges to enhance your online shopping experience with us.

*** Keywords ***
Dado que eu esteja no sistema do exercicio de automação
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

E informo o campo
    [Arguments]    ${locator}    ${texto}
    Input Text    //*[@data-qa="${locator}"]    ${texto}

Quando clico na opção
    [Arguments]    ${locator}
    Click Element    //*[@data-qa="${locator}"]

Então o usuário direcionado para a tela de criação de conta
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://automationexercise.com/signup
    Wait Until Page Contains Element    //*[@data-qa="days"]
    Page Should Contain Element    //*[@data-qa="days"]

Então o usuário direcionado para a tela de conta criada
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://automationexercise.com/account_created
    Wait Until Page Contains Element    //*[@data-qa="account-created"]

E o sistema exibe a mensagem de conclusão do cadastro da conta
    Page Should Contain    ${EXPECTED_TEXT_TITLE}
    Page Should Contain    ${EXPECTED_TEXT_FIRST}
    Page Should Contain    ${EXPECTED_TEXT_SECOND}

Quando informar data de nascimento
    ${day_option}=    Selecionar Opção Aleatória em Select    //*[@data-qa="days"]
    ${random_day_option}=    Evaluate    random.choice(${day_option}[1:])    random

    ${month_option}=    Selecionar Opção Aleatória em Select    //*[@data-qa="months"]
    ${random_month_option}=    Evaluate    random.choice(${month_option}[1:])    random

    ${years_option}=    Selecionar Opção Aleatória em Select    //*[@data-qa="years"]
    ${random_years_option}=    Evaluate    random.choice(${years_option}[1:])    random

    Select From List By Label    //*[@data-qa="days"]    ${random_day_option}
    Select From List By Label    //*[@data-qa="months"]    ${random_month_option}
    Select From List By Label    //*[@data-qa="years"]   ${random_years_option}

E selecionar o pais
    ${country_option}=    Selecionar Opção Aleatória em Select    //*[@data-qa="country"]
    ${random_country_option}=    Evaluate    random.choice(${country_option}[1:])    random

    Select From List By Label    //*[@data-qa="country"]    ${random_country_option}

E selecionar o checkbox
    [Arguments]    ${locator}
    Click Element    //*[@name="${locator}"]

Selecionar Opção Aleatória em Select
    [Arguments]    ${locator}
    ${options}=    Get List Items    ${locator}
    [Return]    ${options}




