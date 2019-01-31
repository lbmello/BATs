##################################################################################################
#        Criado e Mantido por Lucas Bulegon Mello - lucasbmello96@gmail.com                      #   
#                                                                                                #  
#   Script lista Grupos de Segurança e Listas de Distribuição do usuãrio e gera arquivo TXT.     #
##################################################################################################

$usuarioLogado = $env:USERNAME
$usuarioListado = 'USER'

$MemberOf = Get-ADPrincipalGroupMembership $usuarioListado | select name

echo $MemberOf > C:\Users\$usuarioLogado\Desktop\Membro_De.txt