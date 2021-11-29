*** Settings ***

Resource  ../resource/Resource_ZMM0110.robot

Test Setup      Abrir SAP
Test TearDown   Fechar SAP

*** Test Case ***
Caso de teste 1
    Fazer Login
    Executar Transacao "Transacao"
    Inserir a chave nf-e "NRO_CHAVE"
    #Gerar aceite físico
    #Executar Transacao "ZSDT0112"