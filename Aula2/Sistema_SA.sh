#!/bin/bash

#Ezequiel Marques Ramos

FileName="$(date +"%Y%m%d_%T")_SA_DiretorioCorrente_$USER.txt"

lsblk -l | grep part >> $FileName

echo "" >> $FileName
echo "Soft Links:" >> $FileName
ls -lrt /home/$USER | grep ^l >> $FileName
