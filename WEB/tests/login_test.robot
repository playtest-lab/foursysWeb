*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Library    ../CustomLibrary.py

*** Variables ***
@{first_names}    John    Jane    Michael    Emma    Robert    Emily
@{second_names}    Silva    Moura    Barbosa    Neves    Lima    Erick
@{email_domains}    gmail.com    yahoo.com    hotmail.com    example.com
@{company}    Bioheal    Moov    GestUs    Viverde

${PASSWORD_LENGTH}    12


*** Test Cases ***
Login Sistema
    [Documentation]    Iniciar cadastro com sucesso
    Dado que eu esteja no sistema do exercicio de automação

    ${random_first_name}    Evaluate    random.choice($first_names)
    ${random_second_name}    Evaluate    random.choice($second_names)
    ${random_name}       Evaluate    "${random_first_name} ${random_second_name}"
    ${random_number}    Evaluate    random.randint(1, 100)
    
    ${random_domain}    Evaluate    random.choice($email_domains)
    ${random_email}       Evaluate    "${random_first_name}.${random_number}@${random_domain}"

    E informo o campo    signup-name    ${random_name}
    E informo o campo    signup-email    ${random_email}
    Quando clico na opção    signup-button
    Então o usuário direcionado para a tela de criação de conta

Cadastro de novo usuário
        [Documentation]    Realizar cadastro no sistema com sucesso
        ${random_first_name}    Evaluate    random.choice($first_names)
        ${random_second_name}    Evaluate    random.choice($second_names)
        ${random_company}    Evaluate    random.choice($company)
        ${data}    Generate Sp Address And Phone
        ${password}=    Generate Password    ${PASSWORD_LENGTH}
        
        Quando informar data de nascimento
        E informo o campo   password   ${password}
        E selecionar o checkbox  newsletter 
        E selecionar o checkbox  optin 
        E informo o campo   first_name   ${random_first_name}
        E informo o campo   last_name   ${random_second_name}
        E informo o campo   company   ${random_company}
        E selecionar o pais
        E informo o campo   address   ${data['street']}
        E informo o campo   state   ${data['state']}
        E informo o campo   city   ${data['city']} 
        E informo o campo   zipcode   ${data['zipcode']} 
        E informo o campo   mobile_number   ${data['phone_number']}
        Quando clico na opção    create-account
        Então o usuário direcionado para a tela de conta criada
        E o sistema exibe a mensagem de conclusão do cadastro da conta
         


    
    

