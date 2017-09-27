#!/bin/bash

#Ezequiel Marques Ramos

#Encontra o PID do processo
pidProc=$(pgrep $1)
pidProc=$(echo $pidProc | cut -d ' ' -f 1)

#verifica valor da variavel
if [ -z $pidProc ]; then
	echo "processo não encontrado"
else
	#Imprime o PID e o Estado do processo
	echo "PID: $(ps axo pid | grep $pidProc)"
	estado="$(ps axo stat,pid | grep $pidProc)"
	estado=${estado:0:1}

	#D    uninterruptible sleep (usually IO)
	#R    running or runnable (on run queue)
	#S    interruptible sleep (waiting for an event to complete)
	#T    stopped, either by a job control signal or because it is being traced.
	#W    paging (not valid since the 2.6.xx kernel)
	#X    dead (should never be seen)
	#Z    defunct ("zombie") process, terminated but not reaped by its parent.


	if [ $estado = "D" ]; then
		echo "Estado: uninterruptible sleep"
	elif [ $estado = "R" ]; then
		echo "Estado: running or runnable"
	elif [ $estado = "S" ]; then
		echo "Estado: interruptible sleep"
	elif [ $estado = "T" ]; then
		echo "Estado: stopped, either by a job control signal or because it is being traced"
	elif [ $estado = "W" ]; then
		echo "Estado: paging"
	elif [ $estado = "X" ]; then
		echo "Estado: dead"
	elif [ $estado = "Z" ]; then
		echo "Estado: zombie"
	fi


fi
