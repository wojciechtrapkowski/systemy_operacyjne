#!/bin/bash -f
declare -A findCommand
option=0
quotationMark='"'
findCommand[dir]="."
findCommand[delete_input]="0"
findCommand[empty_input]="0"
while [[ $option -ne 8 ]] 
	do
		menu=( "1. Podaj nazwe pliku ${findCommand[name_input]}"
		"2. Podaj nazwe katalog ${findCommand[dir_input]}"
		"3. Podaj rozmiar pliku ${findCommand[size_input]}"
		"4. Czy plik ma byc pusty [0/1] ${findCommand[empty_input]}"
		"5. Czy chcesz usunac pliki [0/1] ${findCommand[delete_input]}"
		"6. Zawartosc pliku ${findCommand[contain_input]}"
		"7. Szukaj"
		"8. Wyjscie")
		odp=$(zenity --list --column=Menu "${menu[@]}" --title "Szukaj" --text "Wybierz opcje"  --width 300 --height 500)
		echo ${odp::1}
		case "${odp::1}" in
			"1")
			findCommand[name_input]=$(zenity --entry --title "Szukaj" --text "Podaj nazwe pliku")
			if [ "$findCommand[name_input]" != "" ]
			then
				findCommand[name]="-name ${quotationMark}${findCommand[name_input]}*${quotationMark}";
			else
				findCommand[name]="";
			fi
;;
			"2")
			findCommand[dir_input]=$(zenity --entry --title "Szukaj" --text "Podaj nazwe katalogu")
			if [ "$findCommand[dir_input]" != "" ]
			then
				findCommand[dir]="${findCommand[dir_input]}";
			else
				findCommand[dir]=".";
			fi
;;			
			"3") 
			findCommand[size_input]=$(zenity --entry --title "Szukaj" --text "Podaj rozmiar pliku")
			if [ "$findCommand[size_input]" != "" ]
			then
				findCommand[size]="-size ${findCommand[size_input]}";
			else
				findCommand[size]="";
			fi
;;
			"4")
			zenity --question --title "Szukaj" --text "Czy plik ma byc pusty?"
			findCommand[empty_input]=$?
			if [[ "${findCommand[empty_input]}" == "0" ]]
			then
				echo "empty";
				findCommand[empty_input]="1";
				findCommand[empty]="-empty";
			else
				findCommand[empty_input]="0";
				findCommand[empty]="";
			fi
			;;
			"5")
			zenity --question --title "Szukaj" --text "Czy chcesz usunac plik?"
			findCommand[delete_input]=$?
			if [[ "${findCommand[delete_input]}" == "0" ]]
			then
				echo "delete";
				findCommand[delete_input]="1";
				findCommand[delete]="-delete";
			else
				findCommand[delete_input]="0";
				findCommand[delete]="";
			fi
;;
			"6")
			findCommand[contain_input]=$(zenity --entry --title "Szukaj" --text "Podaj zawartosc pliku")
			if [ "$findCommand[contain_input]" != "" ]
			then
				findCommand[contain]="-exec grep -l ${quotationMark}${findCommand[contain_input]}${quotationMark} {} \;";				
			else
				findCommand[contain]="";
			fi
;;
			"7") 
				findMethod="find ${findCommand[dir]} ${findCommand[name]} ${findCommand[size]} ${findCommand[empty]} -type f ${findCommand[contain]} ${findCommand[delete]}";
				eval $findMethod | zenity --text-info --height 300 --title "Lista znalezionych plikow";
				;;
			"8") option=8;;
		esac
	done
