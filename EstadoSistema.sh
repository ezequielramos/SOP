#!/bin/bash

#Ezequiel Marques Ramos

#nome do arquivo
FileName="$(date +"%Y%m%d_%T")_EstadoSistema_$USER.txt"

echo "Numero total processos ativos: $(ps -A --no-headers | wc -l)" > $FileName
echo "Numero de processos ativos do usuario atual: $(ps axo user | grep $USER | wc -l)" >> $FileName
echo "Usuário: $USER" >> $FileName
echo "Numero de processos ativos do usuário root: $(ps axo user | grep root | wc -l)" >> $FileName
