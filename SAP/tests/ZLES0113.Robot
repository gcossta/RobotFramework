*** Settings ***

Resource  ../resource/Resource_ZLES0113.robot

Test Setup      Abrir SAP
#Test TearDown   Fechar SAP

*** Test Case ***
Caso de teste 1
    Fazer Login
    Executa Transacao "TRANSACAO"
    Buscar Pedido
    Atribuir Aviso
    #Aviso Atribuido