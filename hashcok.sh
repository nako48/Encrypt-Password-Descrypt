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
    cek=$(curl -s "https://lea.kz/api/hash/$2" -L | grep -Po '(?<="password":)[^,]*' | tr -d '[]"') #apinya
    if [[ ! $cek =~ "NAKO" ]]; then
    printf "${WHITE}Sukses : ${GREEN}$1 :$cek\n"
    echo "$1 :$cek" >> nemu.txt
           else
    printf "${RED}NOT FOUND${NC} => $cek\n"
fi

}
header
echo ""
echo "================================================="
echo "List In This Directory : "
ls
echo "================================================="
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
    email1="${emailna[$i]}"
    passwordna1="${passwordna[$i]}"
        scanskrng $email1 $passwordna1
done
