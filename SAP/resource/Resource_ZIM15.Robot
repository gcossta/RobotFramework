***Settings***
Library         SapGuiLibrary
Library         C:/TESTES/RobotFramework/Libraries/Pywinauto/PywinautoLibrary.py

***Variables***
${CON}              01

***Keywords***
Abrir SAP
    PywinautoLibrary.Start Application      C:/Program Files (x86)/SAP/FrontEnd/SAPgui/saplogon.exe
    Sleep                                   4 s
    Connect to session                      ${CON}

Fechar SAP
    Click Element                           wnd[0]/mbar/menu[0]/menu[12]
    Click Element                           wnd[1]/usr/btnSPOP-OPTION1

Fazer Login
    Open Connection                         SAP QAS
    SapGuiLibrary.Input Text                wnd[0]/usr/txtRSYST-BNAME       user
    Input Password                          wnd[0]/usr/pwdRSYST-BCODE       password
    Click Element                           wnd[0]/tbar[0]/btn[0] 

Executar Transacao "${TRANSACAO}"
    Run Transaction                         ${TRANSACAO}

Selecionar a empresa "${empresa}", ano "${ano}", mês "${mes}", área de contabilidade "${area_contabil}", solicitação "${nro_investimento}" e opção "Exportar investimento"
    SapGuiLibrary.Input Text                wnd[0]/usr/ctxtP_BUKRS         ${empresa}
    SapGuiLibrary.Input Text                wnd[0]/usr/txtP_ANO            ${ano}
    SapGuiLibrary.Input Text                wnd[0]/usr/txtP_MES            ${mes}
    SapGuiLibrary.Input Text                wnd[0]/usr/ctxtP_KOKRS         ${area_contabil}
    Select Radio Button                     wnd[0]/usr/radR_INVES
    SapGuiLibrary.Input Text                wnd[0]/usr/ctxtS_POSNR-LOW     ${nro_investimento}
    Click Element                           wnd[0]/tbar[1]/btn[8]

O relatório deve exibir os dados do investimento "${nro_investimento}" e conter "${qtde_linhas_desejada}" linhas
    Select Table Column                     wnd[0]/usr/cntlCC_RESU/shellcont/shell/shellcont[0]/shell               IM_POSNR
    SapGuiLibrary.Click Toolbar Button      wnd[0]/usr/cntlCC_RESU/shellcont/shell/shellcont[0]/shell               &MB_FILTER
    SapGuiLibrary.Input Text                wnd[1]/usr/ssub%_SUBSCREEN_FREESEL:SAPLSSEL:1105/ctxt%%DYN001-LOW       ${nro_investimento}
    Click Element                           wnd[1]/tbar[0]/btn[0]
    ${qtde_linhas}                          Get Row Count                                                           wnd[0]/usr/cntlCC_RESU/shellcont/shell/shellcont[0]/shell
    Run Keyword and Continue On Failure     Should Be Equal As Strings              ${qtde_linhas}                  ${qtde_linhas_desejada}
    Take Screenshot