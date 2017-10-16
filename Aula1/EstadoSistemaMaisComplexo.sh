#!/bin/bash

#Ezequiel Marques Ramos

#nome do arquivo
FileName="$(date +"%Y%m%d_%T")_EstadoSistema_$USER.txt"

tempo=$(uptime)

user_proc=()

for h in $(ps axo user --no-headers); do

    x=0
    achou=0

    while [ $x != ${#user_proc[@]} ]
    do
        valor=${user_proc[$x]}

        username=$(echo ${user_proc[$x]} | cut -d ',' -f 1)
        qtd=$(echo ${user_proc[$x]} | cut -d ',' -f 2)

        if [ $username == $h ]
        then
            let "qtd = qtd +1"
            user_proc[$x]="$username,$qtd"
            achou=1
        fi
        let "x = x +1"
    done

    if [ $achou == 0 ]
    then
        user="$h,1"
        user_proc[$x]=$user
    fi

done

echo "Numero total processos ativos: $(ps -A --no-headers | wc -l)" > $FileName

echo "Quantidade de Processos por Usuário:" >> $FileName
x=0

while [ $x != ${#user_proc[@]} ]
do
    username=$(echo ${user_proc[$x]} | cut -d ',' -f 1)
    qtd=$(echo ${user_proc[$x]} | cut -d ',' -f 2)
    echo "    $username: $qtd" >> $FileName
    let "x = x +1"
done

echo "Numero de processos ativos do usuario atual: $(ps axo user | grep $USER | wc -l)" >> $FileName
echo "Usuário atual: $USER" >> $FileName
echo "Numero de processos ativos do usuário root: $(ps axo user | grep root | wc -l)" >> $FileName
echo "Tempo que o computador esta ligado: ${tempo:12:7}" >> $FileName
