#!/bin/bash

#Ezequiel Marques Ramos

#nome do arquivo
FileName="$(date +"%Y%m%d_%T")_EstadoES_$USER.txt"

#qtd de processadores
cat /proc/cpuinfo | grep processor | wc -l >> $FileName
#modelo
cat /proc/cpuinfo | grep "model name" -m 1 >> $FileName
#memoria primaria
cat /proc/meminfo | grep MemTotal >> $FileName
#informacao de particao de disco rigido
lsblk -l  >> $FileName
#interfaces de rede disponiveis
netstat -i >> $FileName