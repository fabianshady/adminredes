echo "Menu de cifrado"
echo "Fabian"
select opt in 'crear usuario' cifrar_sim cifrar_asim salir;
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
				case $opt3 in
					generar_llave)
						gpg --full-generate-key
						echo "Llave creada exitosamente"
						;;
					verificar_clave)
						gpg -k
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
						echo "Introduce el nombre del archivo con la clave"
						read archivo_claveimp
						gpg --import $archivo_claveimp
						;;
					firmar_archivo)
						gpg -k
						echo "Ingresa el id de la clave que usaras para firmar"
						read idclave
						echo "Ingresa el nombre para tu nuevo archivo fimado"
						read archivofirm
						echo "Ingresa el nombre del archivo que quieres firmar"
						read archivo_firm
						gpg -u $idclave --output $archivofirm --sign $archivo_firm
						;;
					cifrar_archivo)
						gpg -k
						echo "Ingresa el id de la clave que usaras para firmar"
						read idclave2
						echo "Ingresa el nombre del archivo que quieres cifrar"
						read archivo_firm2
						gpg -a -r $idclave2 --encrypt $archivo_firm2
						;;
					descifrar_archivo)
						echo "Ingresa el nombre del archivo que quieres descifrar"
						read archivo_desc2
						echo "Ingresa un nombre para tu nuevo archivo"
						read archivo_new
						gpg -a --decrypt $archivo_desc2 > $archivo_new
						;;
					borrar_claves)
						gpg -k 
						echo "Ingresa el id de la clave que quieres borrar"
						read  idborrar
						gpg --delete-secret-key $idborrar
						;;
					salir)
						break
						;;
					*)
						echo "Introduce una opcion valida"
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
