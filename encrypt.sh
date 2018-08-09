#!/bin/bash
#Tatsumi-Crew & Arvan Apriyana
clear
header(){
CYAN='\e[36m'
BLUE='\e[34m'
GREEN='\e[92m'
WHITE='\e[37m'
RED='\e[31m'
YELLOW='\e[33m'
GREENLIGHT='\e[39m'
PURPLE='\e[35m'
BOLD='\e[1m'
printf "
${GREEN}
___________________________________________________________

 ████████╗ █████╗ ████████╗███████╗██╗   ██╗███╗   ███╗██╗
 ╚══██╔══╝██╔══██╗╚══██╔══╝██╔════╝██║   ██║████╗ ████║██║${BLUE}
    ██║   ███████║   ██║   ███████╗██║   ██║██╔████╔██║██║
    ██║   ██╔══██║   ██║   ╚════██║██║   ██║██║╚██╔╝██║██║
    ██║   ██║  ██║   ██║   ███████║╚██████╔╝██║ ╚═╝ ██║██║${RED}
    ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝
  
  	              Password - Encrypt  ${WHITE}
 	md5 | sha1 | sha224 | sha256 | sha384 | sha512   
  	              www.tatsumi-crew.net
___________________________________________________________

"
}
scanskrng(){
	kocak="$1"
	encrypter=$(curl -s "https://lea.kz/api/password/$1" -L)
	pwmd5=$(echo $encrypter | grep -Po '(?<="md5":)[^,]*' | tr -d '[]"')
	pwsha1=$(echo $encrypter | grep -Po '(?<="sha1":)[^,]*' | tr -d '[]"')
	pwsha224=$(echo $encrypter | grep -Po '(?<="sha224":)[^,]*' | tr -d '[]"')
	pwsha256=$(echo $encrypter | grep -Po '(?<="sha256":)[^,]*' | tr -d '[]"')
	pwsha384=$(echo $encrypter | grep -Po '(?<="sha384":)[^,]*' | tr -d '[]"')
	pwsha512=$(echo $encrypter | grep -Po '(?<="sha512":)[^,]*' | tr -d '[]"')
	if [[ ! $encrypter =~ "NAKO" ]]; then
	printf "${WHITE}MD5 : ${YELLOW}$kocak => $pwmd5\n"
	printf "${WHITE}SHA1 : ${YELLOW}$kocak => $pwsha1\n"
	printf "${WHITE}SHA224: ${YELLOW}$kocak => $pwsha224\n"
	printf "${WHITE}SHA256 : ${YELLOW}$kocak => $pwsha256\n"
	printf "${WHITE}SHA384 : ${YELLOW}$kocak => $pwsha384\n"
	printf "${WHITE}SHA512 : ${YELLOW}$kocak => $pwsha512\n"
    echo "$encrypter | $1" >> nemu.txt
           else
    printf "${RED}NOT FOUND${NC} => $encrypter\n"
fi
}
header
echo "Method : "
echo "1. Encrypt Password"
read -p "Choose Your Method : " method;

if [ $method -eq 1 ]; then
	read -p "Password : " kocak;
	for pwna in $kocak; do
		scanskrng $pwna
done
fi
