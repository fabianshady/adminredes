echo "Menu de cifrado"
select opt in crear cifrar_sim cifrar_asim salir;
do
	case $opt in
		crear)
			echo -e  "Crear archivo\n Introduce el nombre del archivo"
			read archivo
			touch $archivo
			ls
			echo "Archivo creado exitosamente"
			sleep 5
			;;
		cifrar_sim)
			echo "Cifrado simetrico"
			select opt2 in cifrar descifrar salir;
			do
				case $opt2 in
					cifrar)
						echo "Introduce el nombre del archivo"
						read archivocif
						gpg -c $archivocif
						echo "Archivo cifrado exitosamente"
						sleep 3
						;;
					descifrar)
						echo "Introduce el nombre del archivo"
						read archivodes
						gpg -d $archivodes
						echo "Archivo descifrado exitosamente"
						sleep 3
						;;
					salir)
						break
						;;
					*)
						echo "Introduzca una opcion valida"
						;;
				esac
			done
			;;
		cifrar_asim)
			echo "Cifrado asimetrico"
			select opt3 in generar_llave verificar_clave exportar_clave importar_clave firmar_archivo cifrar_archivo descifrar_archivo borrar_claves salir;
			do
				case $op3 in
					generar_llave)
						gpg --full-generate-key
						echo "Llave creada exitosamente"
						;;
					verificar_clave)
						;;
					exportar_clave)
						echo "Claves disponibles"
						gpg -k
						echo "Escriba la clave que desea exportar"
						read clave
						echo "Escriba un nombre para el archivo"
						read archivo_clave
						gpg --output $archivo_clave --export $clave
						ls
						echo "Clave $clave exportada en $archivo_clave"
						;;
					importar_clave)
						;;
				esac
			done
			;;
		salir)
			break
			;;
		*)
			echo "Introduzca una opcion valida"
			;;
	esac
done
