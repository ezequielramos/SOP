#!/bin/bash

#Ezequiel Marques Ramos
#nome do arquivo
FileName="$(date +"%Y%m%d_%T")_processos_$USER.txt"

pidProc=$(ps axo "pid:%p | Application: %c | PorcentagemCpu: %C | Memoria:  | User: %U" | grep "User: $USER")

#Imprime o PID e o Estado do processo
echo $pidProc >> $FileName
