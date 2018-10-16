@echo off

REM [Criado e Mantido por Lucas Bulegon Mello - lucasbmello96@gmail.com]
REM [Script usado para criar mapeamentos de impressora e pasta de rede.]

::MAPEIA AS IMPRESSORAS - CONSULTAR O ENDEREÇO DA IMPRESSORA E ALTERAR NOS XXX
::CASO OUTRAS IMPRESSORAS NECESSITEM SER ADICIONADAS, FAVOR COPIAR E COLAR A LINHA ABAIXO
start \\192.168.XXX.XXX\IMPXXX

::MAPEIA A PUBLICA DA UNIDADE - CONSULTAR O ENDEREÇO DO COMP. E ALTERAR NOS XXX
net use p: \\192.168.XXX.XXX\Publica /persistent:yes