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
         Password - Encrypt
 md5-sha1-sha224-sha256-sha384-sha512
      Code By: Arvan Apriyana
        www.tatsumi-crew.net
 ------------------------------------
"
}
scanskrng(){
	kocak="$1"
	encrypter=$(curl -s "https://lea.kz/api/password/$1" -L)
	pwmd5=$(echo $encrypter | grep -Po '(?<="md5":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
	pwsha1=$(echo $encrypter | grep -Po '(?<="sha1":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
	pwsha224=$(echo $encrypter | grep -Po '(?<="sha224":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
	pwsha256=$(echo $encrypter | grep -Po '(?<="sha256":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
	pwsha384=$(echo $encrypter | grep -Po '(?<="sha384":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
	pwsha512=$(echo $encrypter | grep -Po '(?<="sha512":)[^,]*' | tr -d '[]"')
	if [[ ! $encrypter =~ "NAKO" ]]; then
	printf " ${HIJAU}MD5 : $kocak => $pwmd5\n"
	printf " ${HIJAU}SHA1 : $kocak => $pwsha1\n"
	printf " ${HIJAU}SHA224 : $kocak => $pwsha224\n"
	printf " ${HIJAU}SHA256 : $kocak => $pwsha256\n"
	printf " ${HIJAU}SHA384 : $kocak => $pwsha384\n"
	printf " ${HIJAU}SHA512 : $kocak => $pwsha512\n"
    echo "$encrypter | $1" >> nemu.txt
           else
    printf " ${MERAH}NOT FOUND${NC} => $encrypter\n"
fi
}
header
echo " Method : "
echo " 1. Encrypt Password"
read -p " Choose Your Method : " method;

if [ $method -eq 1 ]; then
	read -p " Password : " kocak;
	for pwna in $kocak; do
		scanskrng $pwna
done
fi
