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
  
  	              Password - Decrypter  ${WHITE}
 	md5 | sha1 | sha224 | sha256 | sha384 | sha512   
  	              www.tatsumi-crew.net
___________________________________________________________

"
}
scanskrng(){
	kocak="$1"
	cek=$(curl -s "https://lea.kz/api/hash/$1" -L | grep -Po '(?<="password":)[^,]*' | tr -d '[]"') #apinya
	if [[ ! $cek =~ "NAKO" ]]; then
	printf "${WHITE}Password : ${GREEN}$cek | $1 \n"
    echo "$cek | $1" >> nemu.txt
           else
    printf "${RED}NOT FOUND${NC} => $cek\n"
fi

}

header

if [ -z $1 ]; then
  header
  printf "\n To Use list.txt \n"
  exit 1
fi
# OPTIONAL
persend=20
setleep=5

itung=1

IFS=$'\r\n' GLOBIGNORE='*' command eval 'list=($(cat list.txt))'
for (( i = 0; i < "${#list[@]}"; i++ )); do

  nako48=$(expr $itung % $persend)
    if [[ $nako48 == 0 && $itung > 0 ]]; then
        sleep $setleep
    fi

    list="${list[$i]}"
  	scanskrng ${list} &
    itung=$[$itung+1]
done
wait
