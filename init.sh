#!/bin/bash

#####################################################################
#
# script name: init.sh
# created in: 06/27/22
# modified in: 21:45:11
#
# summary: start the game
#                                               developed by: bates
#####################################################################

#variables on USER
clear
if [ $(uname) = "Linux" ]; then

    sudo apt-get update -y > /dev/null 2> /dev/null && sudo apt-get upgrade -y > /dev/null 2> /dev/null
    sudo apt-get install curl  > /dev/null 2> /dev/null

    sudo apt-get install jq > /dev/null 2> /dev/null

    #game
    rm -R /home/bates/Documents/repositorio/shell/pokemon/scripts/pokedesk 2> /dev/null > /dev/null
    rm /home/bates/Documents/repositorio/shell/pokemon/scripts/game/save.log 2> /dev/null > /dev/null
elif [ $(uname) = "Darwin" ]; then
    sudo apt-get update -y > /dev/null 2> /dev/null && sudo apt-get upgrade -y > /dev/null 2> /dev/null
    /usr/bin/ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install) > /dev/null 2> /dev/null && sudo apt-get upgrade -y > /dev/null 2> /dev/null
    brew install jq > /dev/null 2> /dev/null && sudo apt-get upgrade -y > /dev/null 2> /dev/null
    brew install coreutil > /dev/null 2> /dev/null && sudo apt-get upgrade -y > /dev/null 2> /dev/null
    #game
    rm -R /home/bates/Documents/repositorio/shell/pokemon/scripts/pokedesk 2> /dev/null > /dev/null
    rm /home/bates/Documents/repositorio/shell/pokemon/scripts/game/save.log 2> /dev/null > /dev/null
else
    echo "#####################################################################################"
    sleep 1
    echo "Watch out!"
    sleep 1
    echo "This game requires certain packages that your operating system may not have at the moment."
    sleep 1
    echo "Are they:"
    sleep 1
    echo "CURL | SHUF | JQ"
    sleep 1
    echo "Install at your own care"
    echo "#####################################################################################"
fi

sleep 3

clear
sleep 1
echo " ######    #####   ### ###  #######  ##   ##   #####   ##   ##           ##   ##   #####   ######   ####     ##### ";
sleep 1
echo "  ##  ##  ### ###   ## ##    ##   #  ### ###  ### ###  ###  ##           ##   ##  ### ###   ##  ##   ##       ## ## ";
sleep 1
echo "  ##  ##  ##   ##   ####     ##      #######  ##   ##  #### ##           ##   ##  ##   ##   ##  ##   ##       ##  ## ";
sleep 1
echo "  #####   ##   ##   ###      ####    ## # ##  ##   ##  #######           ## # ##  ##   ##   #####    ##       ##  ## ";
sleep 1
echo "  ##      ##   ##   ####     ##      ##   ##  ##   ##  ## ####           #######  ##   ##   ## ##    ##       ##  ## ";
sleep 1
echo "  ##      ### ###   ## ##    ##   #  ##   ##  ### ###  ##  ###           ### ###  ### ###   ## ##    ##  ##   ## ## ";
sleep 1
echo " ####      #####   ### ###  #######  ### ###   #####   ##   ##           ##   ##   #####   #### ##  #######  ##### ";
sleep 0.1
echo  "==================================================== PRESS ENTER ===================================================="
read -p "" OPT

if [ "$OPT" = "B" -o "$OPT" = "b" -o "$OPT" = "" ]; then
    clear
    sleep 1
    echo "#======================================= Choose an option ========================================================="
    echo "#                                                                                                                 #"
    echo "# [1] - Start The Game                                                                                            #"
    echo "# [2] - Continue Old Game                                                                                         #"
    echo "# [3] - Help                                                                                                      #"
    echo "# [4] - Exit                                                                                                      #"
    echo "# [5] - About                                                                                                     #"
    echo "#                                                                                                                 #"
    echo "#=================================================================================================================#"
    read -p "" CHOISE
    if [ "$CHOISE" -eq 1 ]; then
        sh  scripts/game/game.sh
    elif [ "$CHOISE" -eq 2 ]; then
        sh scripts/continue.sh
    elif [ "$CHOISE" -eq 3 ]; then
        sh scripts/help.sh
    elif [ "$CHOISE" -eq 4 ]; then
        clear
        echo "#=================================================================================================================#"
        echo "#                                           By By                                                                 #"
        echo "#=================================================================================================================#"
        sleep 2
        sh scripts/game/end.sh
        exit 1
    elif [ "$CHOISE" -eq 5 ]; then
        sh scripts/about.sh
    else
        clear
        echo "#=================================================================================================================#"
        echo "#                                           Invalid option                                                        #"
        echo "#=================================================================================================================#"
        sleep 2
        sh scripts/game/end.sh
        exit 1
        
    fi
else
    clear
    echo "#=================================================================================================================#"
    echo "#                                           Invalid option                                                        #"
    echo "#=================================================================================================================#"
    sleep 2
    sh scripts/game/end.sh
    exit 1
    
fi