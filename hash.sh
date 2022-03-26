echo "Menu hash fabian"
menu () {
	select opt in sha256sum sha1sum sha512sum md5sum salir;
	do 
		case $opt in
			sha256sum)
				echo $archivo | sha256sum
				sleep 5
				clear
				;;
			sha1sum)
				echo $archivo | sha1sum
				sleep 5
				clear
				;;
			sha512sum)
				echo $archivo | sha512sum
				sleep 5
				clear
				;;
			md5sum)
				echo $archivo | md5sum
				sleep 5
				clear
				;;
			salir)
				break
				;;
			*)
				echo "Introduce una opcion valida"
				;;
		esac
	done
}
ls
echo "Ingresa la frase o el nombre del archivo"
read archivo
clear
echo "Selecciona la tecnica a utilizar"
menu
