*** Settings ***

Resource  ../resource/Resource_ZIM15.robot

Test Setup      Abrir SAP
#Test TearDown   Fechar SAP

*** Test Case ***
Caso de teste 1
    Fazer Login
    Executar Transacao "TRANSACAO"
    Selecionar a empresa "cod_empresa", ano "2019", mês "01", área de contabilidade "AREA", solicitação "NRO_SOLICITACAO" e opção "Exportar investimento"
    O relatório deve exibir os dados do investimento "NRO_SOLICITACAO" e conter "NRO_LINHAS" linhas

#Solicitações
    #000000027917
    #000000025221
    #000000027551