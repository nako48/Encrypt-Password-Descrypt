#!/bin/bash
#Code By : NakoCoders
#Contact Me : https://www.facebook.com/hxr.id
#Nb : Ga usah recode lah kontol kalau cuman ganti text doang memek
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
ORANGE='\033[0;33m' 
PUR='\033[0;35m'
GRN="\e[32m"
WHI="\e[37m"
NC='\033[0m'
banner(){
	printf "
	####################################
	####################################
	#######                      #######
	#######                      #######
	####### www.tatsumi-crew.net #######
	###############      ###############
	###############      ###############
	###############      ###############
	###############      ###############
	#######    ####      ####    #######
	#######    ####      ####    #######
	#######    ##############    #######
	#######    ##############    #######
	#######                      #######
	####################################
	####################################
	------------------------------------
	           MD5 -> Decrypt
	------------------------------------
"
} 
scanskrng(){
    cek=$(curl -s "https://lea.kz/api/hash/$2" -L | grep -Po '(?<="password":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
    if [[ $cek =~ "" ]]; then
    printf "${HIJAU}BERHASIL => $1 : $cek\n"
    echo "BERHASIL => $1 : $cek" >> nemu.txt
           else
    printf "${MERAH}GAGAL => $1 : $cek\n"
fi

}
banner
echo "Delimeter list -> email:password "
echo -n "Put Your List : "
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
