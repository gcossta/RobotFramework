***Settings***
Library     SapGuiLibrary
Library  C:/RobotFramework/Libraries/Pywinauto/PywinautoLibrary.py

***Variables***

${CON}          01


***Keywords***

Enable Screenshots On Error

Abrir SAP
    PywinautoLibrary.Start Application      C:/Program Files (x86)/SAP/FrontEnd/SAPgui/saplogon.exe
    Sleep                                   4 s
    connect to session                      ${CON}

Fechar SAP
    Click Element                           wnd[0]/mbar/menu[3]/menu[12]
    Click Element                           wnd[1]/usr/btnSPOP-OPTION1

Fazer Login
    Open Connection                         SAP QAS
    Input Text                              wnd[0]/usr/txtRSYST-BNAME       user
    Input Password                          wnd[0]/usr/pwdRSYST-BCODE       password
    Click Element                           wnd[0]/tbar[0]/btn[0] 

Executar Transacao "${TRANSACAO}"
    Run Transaction                         ${TRANSACAO}

Inserir a chave nf-e "${chave_nfe}"
    Input Text                              wnd[0]/usr/ctxtDEPART-LOW       *
    Input Text                              wnd[0]/usr/txtCHAVEN-LOW        ${chave_nfe}
    Input Text                              wnd[0]/usr/ctxtETOMAD-LOW       empresa
    Input Text                              wnd[0]/usr/txtFTOMAD-LOW        *
    Send Vkey                               8
    #Send Vkey                              74