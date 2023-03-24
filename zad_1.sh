path1="cdlinux.ftp.log"
path2="cdlinux.www.log"
grep "OK DOWN" $path1 | cut -d '"' -f2,4 | sort -u | grep -o "cdlinux-.*" | grep "iso$"  > wynik1.txt
grep " 20* " $path2 | cut -d ' ' -f1,7 | cut -d ':' -f2 | sort -u | grep -o "cdlinux-.*iso$" >> wynik1.txt
sort wynik1.txt | uniq -c > wynik2.txt

cat wynik2.txt
