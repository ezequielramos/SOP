#!/bin/bash

#Ezequiel Marques Ramos

#nome do arquivo
FileName="$(date +"%Y%m%d_%T")_Memoria_$USER.txt"

MemTotal=$(cat /proc/meminfo | grep MemTotal | tr -d [:alpha:] | tr -d [:punct:])
MemFree=$(cat /proc/meminfo | grep MemFree | tr -d [:alpha:] | tr -d [:punct:])
SwapTotal=$(cat /proc/meminfo | grep SwapTotal | tr -d [:alpha:] | tr -d [:punct:])
SwapFree=$(cat /proc/meminfo | grep SwapFree | tr -d [:alpha:] | tr -d [:punct:])

qtd=0
memUser=0

for h in $(ps axo user,rss | grep udesc | tr -d [:alpha:]); do
	qtd=$((qtd+1))
	memUser=$((memUser+h))
done

echo "Memoria Total: $MemTotal | Memoria em Uso: $((MemTotal-MemFree)) | Swap Total: $SwapTotal | Swap em Uso: $((SwapTotal-SwapFree)) | Número total de processos de $USER: $qtd |  Quantidade de memória ocupada de $USER: $memUser" >> $FileName
