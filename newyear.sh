#!/bin/bash
if [[ -e $PREFIX/bin/tput ]]; then
	sleep 0
else
apt install ncurses-utils figlet toilet wget -y
fi
if [[ -e $PREFIX/share/figlet/cricket.flf ]]; then
	sleep 0
else
wget -O $PREFIX/share/figlet/cricket.flf http://www.figlet.org/fonts/cricket.flf
fi
name='Coding family'
correction=+1

trap "tput reset; tput cnorm; exit" 2
clear

tput civis
#new years greeting
for c in 34; do
	echo -en "\r \e[${c}m MARRY XMAS
	               AND IN ADVANCE\e[0m "
	sleep 1
done
row=2
m_c=$(($(tput cols) / 2))
m_c=$((m_c-1))
color=0
font=cricket

hacker="2022"

while true; do
    color=$(((color+1)%8))

    from_middle=-8
    for l in H A P P Y
    do
        tput cup $((row+1)) $((m_c+from_middle))
        echo $l
        let from_middle++
        sleep 0.01
    done

    from_middle=-2
    for l in N E W
    do
        tput cup $((row+1)) $((m_c+from_middle))
        echo $l
        let from_middle++
        sleep 0.01
    done

    from_middle=+2
    for l in Y E A R
    do
        tput cup $((row+1)) $((m_c+from_middle))
        echo $l
        let from_middle++
        sleep 0.01
    done

    spaceCount=$((m_c/9 + correction))
    spaces=""
    for (( c=1; c<=$spaceCount; c++ ))
    do
        spaces+=" "
    done
    
    tput cup $((row+2))
    toilet -t -f ${font} " ${spaces}$hacker" --gay

    tput setaf $color; tput bold

    tput cup $((row+8)) $((m_c-(${#name}/3 - 17)))
    echo $name
    from_middle=-2
    tput cup $((row+9)) $((m_c+from_middle))
 
 echo "SUBCRIBE & SUPPORT THE CODING FAMILY"
    
    
    echo "Coded by Dan Maffia"
done
