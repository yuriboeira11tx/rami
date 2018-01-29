#!/bin/bash
# Developer: Derxs
# Version: 1.1
if [[ "$UID" != "0" ]]
then
	sleep 1
	echo
	echo -e "\033[01;31m[!]\033[00;00m Execute o script como root!"
	echo -e "\033[01;33m[?]\033[00;00m Use a sintaxe: sudo "$0
	echo
else
	Menu(){
		sleep 1
		clear
		echo -e "
	     \033[01;32m╦═╗┌─┐┌┬┐┬
	     ╠╦╝├─┤││││
	     ╩╚═┴ ┴┴ ┴┴ \033[01;31mby Derxs v1.1\033[01;37m"
		echo -e "
 \033[01;34m_______________________________________
|                                       |
| 1) Remover serviço da inicialização   |
| 2) Adicionar serviço na inicialização |
| 3) Sair                               |
|_______________________________________|\033[00;00m"
		echo
		echo
		echo -n -e "\033[01;35mRami>\033[00;00m "
		read opc
		case $opc in
			1)sh_Rms;;
			2)sh_Adds;;
			3)exit;;
			*) echo;echo -e -n "\033[01;31m[!]\033[00;00m ERRO!";Menu;;
		esac
	}
	sh_Rms(){
		echo -n -e "\033[01;32m[+]\033[00;00m Digite o nome do serviço: "
		read serv
		echo -e "\033[01;34m[*]\033[00;00m Aguarde..."
		sleep 1
		update-rc.d -f $serv disable 3> /dev/null
		if [[ "$?" == "0" ]]
		then
			sleep 1
			echo -e "\033[01;32m[*]\033[00;00m Sucesso!"
			sleep 3
			Menu
		else
			echo -e "\033[01;31m[!]\033[00;00m OPS! Algo deu errado!"
			sleep 3
			Menu
		fi
	}
	sh_Adds(){
		echo -n -e "\033[01;32m[+]\033[00;00m Digite o nome do serviço: "
		read serv
		echo -e "\033[01;34m[*]\033[00;00m Aguarde..."
		sleep 1
		update-rc.d $serv defaults 3> /dev/null
		if [[ "$?" == "0" ]]
		then
			sleep 1
			echo -e "\033[01;32m[*]\033[00;00m Sucesso!"
			sleep 3
			Menu
		else
			echo -e "\033[01;31m[!]\033[00;00m OPS! Algo deu errado!"
			sleep 3
			Menu
		fi
		Menu
	}
	Menu
fi
