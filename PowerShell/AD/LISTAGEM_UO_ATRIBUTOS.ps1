##################################################################################################
#        Criado e Mantido por Lucas Bulegon Mello - lucasbmello96@gmail.com                      #   
#                                                                                                #  
#   Script que gera arquivos TXT com os dados dos atributos "ESCRITÓRIO" e "DESCRIÇÃO" e das UOs #
#   do AD, omitindo, quando necessário, itens nestas listas.                                     #
##################################################################################################

$usuario = $env:USERNAME

#LISTA DADOS SETADOS NO CAMPO ESCRITÓRIO PARA TODOS OS USUÁRIOS
$escritorios = Get-ADUser -Filter * -Properties physicaldeliveryofficename | Select-Object -ExpandProperty physicaldeliveryofficename | sort-object -Unique

#DESCREVER OS ESCRITÓRIOS A SEREM OMITIDOS NESTA LISTA
$escritoriosOmitir = ("EXEMPLO1 DE ITEM REMOVIDO","EXEMPLO2 DE ITEM REMOVIDO")

#PERCORRE LISTA E SUBSTITUI DADOS OMITIDOS
for ($i = 0; $i -lt $escritoriosOmitir.Length; $i++){
    $escritorios = $escritorios.Replace($escritoriosOmitir[$i],"UNIDADE RETIRADA DA LISTA!")
}

#LISTA DADOS SETADOS NO CAMPO DESCRIÇÃO PARA TODOS OS USUÁRIOS
$cargos = Get-ADUser -Filter * -Properties description | Select-Object -ExpandProperty description | sort-object -Unique

#DESCRIÇEÕS OMITIDAS NESTA LISTA
$cargosOmitir = ("EXEMPLO1 DE ITEM REMOVIDO","EXEMPLO2 DE ITEM REMOVIDO")

#PERCORRE LISTA E SUBSTITUI DADOS OMITIDOS
for ($j = 0; $j -lt $cargosOmitir.Length; $j++){
    $cargos = $cargos.Replace($cargosOmitir[$j],"CARGO RETIRADO DA LISTA!")
}

#LISTA UOs
$uo = Get-ADOrganizationalUnit -LDAPFilter '(name=*)' -SearchBase 'OU=XXX' -SearchScope OneLevel |  Format-Table Name

#CRIA OS ARQUIVOS NA ÁREA DE TRABALHO DO USUÁRIO LOGADO
echo $escritorios > C:\Users\$usuario\Desktop\Escritorios_AD.txt
echo $cargos > C:\Users\$usuario\Desktop\Cargos_AD.txt
echo $uo > C:\Users\$usuario\Desktop\UOs_DR_AD.txt