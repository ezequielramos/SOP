#!/bin/bash

#Ezequiel Marques Ramos

#nome do arquivo
FileName="$(date +"%Y%m%d_%T")_EstadoES_$USER.txt"

#qtd de processadores
qtdProcessadores=$(cat /proc/cpuinfo | grep processor | wc -l)
echo "Quantidade de processadores: $qtdProcessadores" >> $FileName

#modelo
nomemodelo=$(cat /proc/cpuinfo | grep "model name" -m 1)
nomemodelo=$(echo $nomemodelo | cut -d ':' -f 2)
echo "Modelo do processador: $nomemodelo" >> $FileName

#memoria primaria
memoria=$(cat /proc/meminfo | grep MemTotal)
memoria=$(echo $memoria | cut -d ':' -f 2)
echo "Quantidade memória principal: $memoria" >> $FileName

#informacao de unidades de disco rigido
echo "Discos Rigidos e capacidade:" >> $FileName
IFS=$'\n'
for hd in $(lsblk -l | grep disk); do
	echo "  -$(echo $hd | cut -d ' ' -f 1): $(echo $hd | cut -d ' ' -f 12)" >> $FileName
done


#interfaces de rede disponiveis
echo "Interfaces de rede disponiveis:" >> $FileName

declare -i contador
contador=0

interfaces=$(netstat -i)
for interface in $interfaces; do
	if [ $contador -gt 1 ]; then
		interface=$(echo $interface | cut -d ' ' -f 1)
		speed=$(cat /sys/class/net/$interface/speed)

		if [ ! -z $speed ]; then
			echo "  -$interface: $speed Mbps" >> $FileName
		else
			echo "  -$interface" >> $FileName
		fi

	fi
	contador=$contador+1
done