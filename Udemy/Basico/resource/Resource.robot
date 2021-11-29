***Settings***
Library     SeleniumLibrary

***Variables***
${BROWSER}  chrome
${URL}      http://automationpractice.com

***Keywords***
Abrir navegador
    Open Browser  about:blank  ${BROWSER}

Fechar navegador
    Close Browser

Acessar página home do site
    Go To               http://automationpractice.com
    Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text          name=search_query        ${PRODUTO}

Clicar no botão pesquisar
    Click Element       name=submit_search