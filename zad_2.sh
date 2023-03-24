#!/bin/bash -f
option=0
nazwa=""
katalog=""
zawartosc=""
rozmiar=""
empty=0
delete=0

nameOption=""
dirOption=""
zawOption=""
rozmiarOption=""
emptyOption=""
deleteOption=""

findMethod=""
c='"'

echo $c
while [[ $option -ne 8 ]] 
	do
		echo "Menu"
		echo "1. Nazwa ${nazwa}"
		echo "2. Katalog ${katalog}" 
		echo "3. Rozmiar pliku ${rozmiar}"
		echo "4. Czy plik ma byc pusty [0/1] ${empty}"
		echo "5. Czy chcesz usunac pliki [0/1] ${delete}"
		echo "6. Zawartosc ${zawartosc}"
		echo "7. Szukaj" 
		echo "8. Wyjscie"
		read option
		case "$option" in
			"1") echo "Podaj nazwe pliku: ";
			read nazwa;
			if [ "$nazwa" != "" ]
			then
				nameOption="-name ${c}${nazwa}*${c}";
			else
				nameOption="";
			fi
;;
			"2") echo "Podaj nazwe katalogu";
			read katalog;

			if [ "$katalog" != "" ]
			then
				dirOption="${katalog}";
			else
				dirOption="";
			fi
;;			
			"3") echo "Podaj rozmiar pliku";
			read rozmiar;
			if [ "$rozmiar" != "" ]
			then
				rozmiarOption="-size ${rozmiar}";
			else
				rozmiarOption="";
			fi
;;
			"4") echo "Czy plik ma byc pusty [0/1]";
				read empty;
				if [ "$empty" = "1" ]
				then
					emptyOption="-empty";
				else
					emptyOption="";
				fi
			;;
			"5") echo "Czy plik ma byc usuniety [0/1]";
			read delete;
			if [ "$delete" != "" ]
			then
				deleteOption="-delete";
			else
				deleteOption="";
			fi
;;
			"6") echo "Podaj zawartosc";
			read zawartosc;
			if [ "$zawartosc" != "" ]
			then
				zawOption="-exec grep -l ${c}${zawartosc}${c} {} \;";
			else
				zawOption="";
			fi
;;
			"7")  
				findMethod="find ${dirOption} ${nameOption} ${rozmiarOption} ${emptyOption} ${deleteOption} -type f ${zawOption}";
				eval $findMethod;	
;;
			"8") option=8;;
		esac
	done



