#!/bin/bash -f
option=0
nazwa=""
katalog=""
zawartosc=""

nameOption=""
dirOption=""
zawOption=""

findMethod=""
c='"'
echo $c
while [[ $option -ne 8 ]] 
	do
		echo "Menu"
		echo "1. Nazwa ${nazwa}"
		echo "2. Katalog ${katalog}" 
		echo "3. "
		echo "4. "
		echo "5. "
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
				findMethod="find ${dirOption} ${nameOption} -type f ${zawOption}";
				eval $findMethod;	
;;
			"8") option=8;;
		esac
	done



