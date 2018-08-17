#!/bin/bash
#issued on : 17 agustus 2018
#coded By Arvan Apriyana
waktu=$(date '+%Y-%m-%d %H:%M:%S')
HIJAU='\033[0;32m'
MERAH='\033[0;31m'
NORMAL='\033[0m'
CYAN='\033[0;36m'
BIRU='\033[0;34m'
PUTIH='\033[1;37m'
header(){
printf "${HIJAU}
 ####################################
 ####################################
 #######                      #######
 #######                      #######
 #######                      #######
 ###############      ###############
 ###############      ###############
 ###############      ###############
 ###############      ###############${MERAH}
 #######    ####      ####    #######
 #######    ####      ####    #######
 #######    ##############    #######
 #######    ##############    #######
 #######                      #######
 ####################################
 ####################################${PUTIH}
 ------------------------------------
        Password - Decrypter
 md5-sha1-sha224-sha256-sha384-sha512
      Code By: Arvan Apriyana
        www.tatsumi-crew.net
 ------------------------------------
"
}
scanskrng(){
	kocak="$1"
	cek=$(curl -s "https://lea.kz/api/hash/$1" -L | grep -Po '(?<="password":)[^,]*' | tr -d '[]"') #apinya
	if [[ ! $cek =~ "error" ]]; then
	printf " ${HIJAU}Password : $cek | $1 \n"
    echo "$cek | $1" >> nemu.txt
           else
    printf " ${MERAH}NOT FOUND${NC} => $cek\n"
fi
}
header
echo " Delimeter list -> password "
echo -n " Put Your List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
    x=$(gawk -F: '{ print $1 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($x)'
    for (( i = 0; i < "${#passwordna[@]}"; i++ )); do
    scancok="${passwordna[$i]}"
        scanskrng $scancok 
done
