*** Settings ***

Resource  ../resource/Resource_IE05.robot

Test Setup      Abrir SAP
#Test TearDown   Fechar SAP

*** Test Case ***
Caso de teste 1
    Fazer Login
    Executar Transacao "IE05"
    Informar os equipamentos "91522611" e "91522612" nos filtros e selecionar o layout "US96102"
    #O relatório deve exibir a coluna "Imobilizado Agro"