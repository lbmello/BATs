# -*- encoding: utf-8 -*-

##################################################################################################
#        Criado e Mantido por Lucas Bulegon Mello - lucasbmello96@gmail.com                      #   
#                                                                                                #  
#   Script de monitoramento em loop que realiza ping para os endereços contidos nas chaves dos   #
#   dicionários e printa o resultado com um texto explicativo.                                   #
##################################################################################################

import subprocess

loop = False

#DICIONÁRIOS COM O IP:IDENTIFICAÇÃO DO QUE ESTÁ SENDO TESTADO
internet = {"8.8.8.8":"GOOGLE","8.8.4.4":"GOOGLE","1.1.1.1":"CLOUD FLARE"}

#MÉTODO QUE FAZ O PING E PRINTA O ESTADO
def ping(ip, link, unidade):
    status,resposta = subprocess.getstatusoutput("ping -n 2 " + ip)
    if status == 1:
        print('INOPERANTE: %s %s sem resposta! IP: %s' %(link, unidade, ip))
    elif status == 0:
        print('OK: %s %s funcionando normalmente! IP: %s' %(link, unidade, ip))
    else:
        print('Erro Desconhecido!')

while (loop != True):

    #DNS - CASO NECESSÁRIO, ALTERAR A INFORMAÇÃO DO ATRIBUTO LINK PARA O QUE ESTÁ SENDO MONITORADO, COM ISSO O PRINT DO RESULTADO SAIRÁ COM TEXTO CORRETO.
    print('_____________________ SERVIDORES DNS _________________________')
    link = "DNS"
    internetIP = list(internet.keys())
    for i in range(len(internetIP)):
        ip = internetIP[i]
        unidade = internet[ip]
        ping(ip,link,unidade)
    print('____________________________ FIM! _____________________________')