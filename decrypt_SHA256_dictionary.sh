#!/bin/bash

#Comprueba si se han pasado los dos argumentos necesarios
if [ $# -eq 2 ]
then
	hashes=$1
	diccionario=$2

	#Comprueba si ambos ficheros existen
	if [ -e $hashes ] && [ -e $diccionario ]
	then
		#Bucle while para leer cada linea del fichero de hashes
		while read lineaHash
		do
			#Almacena en una variable el hash para compararlo mas adelante
			pass=$(echo -n $lineaHash | cut -f1 -d' ')

			#Bucle while anidado para leer el diccionario linea a linea
			while read lineaDic
			do
				#Hashea cada pass y la almacena en una variable 
				passDic=$(echo -n $lineaDic | sha256sum | cut -f1 -d' ')

				#Compara los dos hashes y si coincide muestra un mensaje con la contraseña encontrada
				if [ $pass = $passDic ]
				then
					echo "Se ha encontrado la contraseña $lineaDic $lineaHash"
				fi
			done < $diccionario
			
		done < $hashes
	else
		echo "Uno de los ficheros introducidos (o ambos) no son validos"
		exit
	fi
else
	echo "Usage: $0 <ruta_hashes.txt> <diccionario>"
fi