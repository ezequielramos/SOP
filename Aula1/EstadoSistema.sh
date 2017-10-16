#!/bin/bash

#Ezequiel Marques Ramos

#nome do arquivo
FileName="$(date +"%Y%m%d")_EstadoSistema_$USER.txt"

#tempo computador ligado
tempo=$(uptime)
tempo=$(echo $tempo | cut -d ',' -f 1)

#usuario solicitado
user_solic=$1

#se o arquivo é novo: monta cabecalho
if [ ! -e $FileName ]; then
    echo "Numero total processos ativos,Numero de processos ativos do usuario Solicitado,Numero de processos ativos do usuario atual,Usuário Solicitado,Usuário atual,Numero de processos ativos do usuário root,Tempo que o computador esta ligado" > $FileName
fi

#preenche uma linha com os dados. Caso nao tenha usuario solicitado por parametro. Preenche com 0.
if [ -z $user_solic ]; then
    echo "$(ps -A --no-headers | wc -l),0,$(ps axo user | grep $USER | wc -l),$user_solic,$USER,$(ps axo user | grep root | wc -l),${tempo:12}"  >> $FileName
else
    echo "$(ps -A --no-headers | wc -l),$(ps axo user | grep $user_solic | wc -l),$(ps axo user | grep $USER | wc -l),$user_solic,$USER,$(ps axo user | grep root | wc -l),${tempo:12}"  >> $FileName
fi
