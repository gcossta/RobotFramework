***Settings***
Library     SapGuiLibrary

***Variables***

${CON}          01


***Keywords***

Enable Screenshots On Error

Abrir SAP
    connect to session      ${CON}

Fazer Login
    Open Connection         SAP QAS
    SapGuiLibrary.Input Text          wnd[0]/usr/txtRSYST-BNAME       user
    SapGuiLibrary.Input Password      wnd[0]/usr/pwdRSYST-BCODE       password
    SapGuiLibrary.Click Element       wnd[0]/tbar[0]/btn[0] 

Executa Transacao "${TRANSACAO}"
    Run Transaction     ${TRANSACAO}

Buscar Pedido
    SapGuiLibrary.Input Text              wnd[0]/usr/ctxtP_BUKRS-LOW       empresa
    SapGuiLibrary.Input Text              wnd[0]/usr/txtP_WERKS-LOW        filial
    SapGuiLibrary.Input Text              wnd[0]/usr/txtP_EBELN-LOW        numero_pedido
    SapGuiLibrary.Select Radio Button     wnd[0]/usr/radR_ATRIB
    SapGuiLibrary.Click Element           wnd[0]/tbar[1]/btn[8]
    SapGuiLibrary.Select Table Row        wnd[0]/usr/cntlCC_PEDIDOS/shellcont/shell       0

Atribuir Aviso
    SapGuiLibrary.Click Toolbar Button    wnd[0]/usr/cntlCC_PEDIDOS/shellcont/shell       ATRIB_AVISO_REC
    SapGuiLibrary.Click Element           wnd[1]/usr/tabsINFO_AVISO_TAB/tabpAV_TB02
    SapGuiLibrary.Input Text              wnd[1]/usr/tabsINFO_AVISO_TAB/tabpAV_TB02/ssubSUB0102:ZLESR0092:0105/ctxtWA_DADOS_TRANSP-AGENTE_FRETE       agente_frete
    SapGuiLibrary.Input Text              wnd[1]/usr/tabsINFO_AVISO_TAB/tabpAV_TB02/ssubSUB0102:ZLESR0092:0105/ctxtWA_DADOS_TRANSP-COD_REMETENTE      cod_remetente
    Send Vkey                             0
    SapGuiLibrary.Click Element           wnd[1]/usr/tabsINFO_AVISO_TAB/tabpAV_TB03
    SapGuiLibrary.Click Element           wnd[1]/usr/tabsINFO_AVISO_TAB/tabpAV_TB04
    #Safra e ordem de carregamento devem ser opcionais
    #SapGuiLibrary.Input Text             wnd[1]/usr/tabsINFO_AVISO_TAB/tabpAV_TB04/ssubSUB0102:ZLESR0092:0106/txtWA_DADOS_TRANSP-SAFRA_ORDEM_CAR     2018
    #SapGuiLibrary.Input Text             wnd[1]/usr/tabsINFO_AVISO_TAB/tabpAV_TB04/ssubSUB0102:ZLESR0092:0106/txtWA_DADOS_TRANSP-NRO_ORDEM_CAR       
    SapGuiLibrary.Click Toolbar Button    wnd[1]/usr/tabsINFO_AVISO_TAB/tabpAV_TB04/ssubSUB0102:ZLESR0092:0106/cntlCC_DADOS_VEIC/shellcont/shell      ADD
    SapGuiLibrary.Select Checkbox         wnd[1]/usr/tabsINFO_AVISO_TAB/tabpAV_TB04/ssubSUB0102:ZLESR0092:0106/cntlCC_DADOS_VEIC/shellcont
    SapGuiLibrary.Input Text              wnd[1]/usr/tabsINFO_AVISO_TAB/tabpAV_TB04/ssubSUB0102:ZLESR0092:0106/cntlCC_DADOS_VEIC/shellcont/shell      PLACA_VEICULO  
    # SapGuiLibrary.Input Text              wnd[1]/usr/tabsINFO_AVISO_TAB/tabpAV_TB04/ssubSUB0102:ZLESR0092:0106/ctxtWA_DADOS_TRANSP-MOTORISTA          
    # Send Vkey                             0
    # SapGuiLibrary.Click Element           wnd[1]/tbar[0]/btn[8]
    # SapGuiLibrary.Click Element           wnd[2]/usr/btnBUTTON_1
    #Placa AWF6900
    
Aviso Atribuido
    Element Should Be Present             wnd[0]/sbar/pane[0]                             Recebimento 180113253 atribuido com sucesso!

Fechar SAP
    Select Context Menu Item              /app/con[0]/ses[0]/wnd[0]/mbar/menu[0]/menu[12]
