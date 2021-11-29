***Settings***
Library     Browser
Resource    ../variables/my_user_and_passwords.robot

***Variables***
${URL}      PAGINA_WEB


***Keywords***
Abrir navegador
    Browser.Open Browser    ${URL}      headless=false
    #New Page                 ${URL}

Fechar navegador
    Take Screenshot 
    Browser.Close Browser

Acessar página home do Opus
    Browser.Get Text    title    contains    Login
    
Realizar login no domínio "${DOMINIO}"
    Focus               id=IdDominio
    Keyboard Input      type            ${DOMINIO} 
    Fill Text           id=Login        ${MY_OPUS_USER}           
    Fill Text           id=Senha        ${MY_OPUS_PASS}
    Click               id=BtnAcessar  
    Browser.Get Text    title    contains    Index
    

Criar balança
    Click               div#sidebar ul > li:nth-child(1) > a                                
    Click               div#sidebar li.open > ul > li:nth-child(2) > a     
    Click               .btn-group > .btn:nth-child(1)
    Fill Text           id=IdSite                           47
    Keyboard Key        press                               Tab
    Fill Text           id=NumeroBalanca                    12
    Fill Text           id=Descricao                        Teste com Robot
    Fill Text           id=IdModelo                         136
    Keyboard Key        press                               Tab
    Fill Text           id=IPMaquina                        HOMEOFFICE367
    Fill Text           id=Porta                            1
    Fill Text           id=IntervaloCaptura                 1
    Click               id=btnSalvar
    Get Elements        .alert


    #//span[text()="Balanças"]
    #Click               Pesagem

# Clicar no botão pesquisar
#     Click Element       name=submit_search