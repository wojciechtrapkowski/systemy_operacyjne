#!/bin/bash -f
declare -A findCommand
option=0
quotationMark='"'

while [[ $option -ne 8 ]] 
	do
		echo "Menu"
		echo "1. Podaj nazwe pliku ${findCommand[name_input]}"
		echo "2. Podaj nazwe katalog ${findCommand[dir_input]}" 
		echo "3. Podaj rozmiar pliku ${findCommand[size_input]}"
		echo "4. Czy plik ma byc pusty [0/1] ${findCommand[empty_input]}"
		echo "5. Czy chcesz usunac pliki [0/1] ${findCommand[delete_input]}"
		echo "6. Zawartosc pliku ${findCommand[contain_input]}"
		echo "7. Szukaj" 
		echo "8. Wyjscie"
		read option
		case "$option" in
			"1") echo "Podaj nazwe pliku: ";
			read findCommand[name_input];
			if [ "$findCommand[name_input]" != "" ]
			then
				findCommand[name]="-name ${quotationMark}${findCommand[name_input]}*${quotationMark}";
			else
				findCommand[name]="";
			fi
;;
			"2") echo "Podaj nazwe katalogu";
			read findCommand[dir_input];

			if [ "$findCommand[dir_input]" != "" ]
			then
				findCommand[dir]="${findCommand[dir_input]}";
			else
				findCommand[dir]="";
			fi
;;			
			"3") echo "Podaj rozmiar pliku";
			read findCommand[size_input];
			if [ "$findCommand[size_input]" != "" ]
			then
				findCommand[size]="-size ${findCommand[size_input]}";
			else
				findCommand[size]="";
			fi
;;
			"4") echo "Czy plik ma byc pusty [0/1]";
			read findCommand[empty_input];
			if [[ "${findCommand[empty_input]}" == "1" ]]
			then
				echo "empty";
				findCommand[empty_input]="1";
				findCommand[empty]="-empty";
			else
				findCommand[empty_input]="0";
				findCommand[empty]="";
			fi
			;;
			"5") echo "Czy plik ma byc usuniety [0/1]";
			read findCommand[delete_input];
			if [[ "${findCommand[delete_input]}" == "1" ]]
			then
				echo "delete";
				findCommand[delete_input]="1";
				findCommand[delete]="-delete";
			else
				findCommand[delete_input]="0";
				findCommand[delete]="";
			fi
;;
			"6") echo "Podaj zawartosc";
			read findCommand[contain_input];
			if [ "$findCommand[contain_input]" != "" ]
			then
				findCommand[contain]="-exec grep -l ${quotationMark}${findCommand[contain_input]}${quotationMark} {} \;";				
			else
				findCommand[contain]="";
			fi
;;
			"7") 
				findMethod="find ${findCommand[dir]} ${findCommand[name]} ${findCommand[size]} ${findCommand[empty]} -type f ${findCommand[contain]} ${findCommand[delete]}";
				eval $findMethod;	
;;
			"8") option=8;;
		esac
	done