clear
mc
menu='Menu de cifrado\n
Selecciona la opcion deseada\n
1. crear archivo\n
2. cifrado simetrico\n
3. cifrado asimetrico\n
4. salir'
echo -e $menu
read option
case $option in
	1)
		echo "crear archivo"
		echo "introduce el nombre del archivo que desea crear"
		read archivo
		sudo touch $archivo
		clear
		ls
		echo "Archivo creado exitosamente"
		sleep 5
		./menu.sh
		;;
	2)
		clear
		echo "cifrado simetrico"
		echo "1. cifrar"
		echo "2. descifrar"
		echo "3. regresar"
		read opcsim
		case $opcsim in
			1)
				echo "introduce el nombre del archivo a cifrar"
				read archcifrar
				sudo gpg -c --pinentry-mode=loopback $archcifrar
				echo "archivo cifrado exitosamente"
				sleep 3
				./menu.sh
				;;
			2)
				echo "introduce el nombre del archivo a descifrar"
				read archdescifrar
				sudo gpg -d --pinentry-mode=loopback $archdescifrar
				echo "archivo descifrado exitosamente"
				sleep 3
				./menu.sh
				;;
		esac
esac
