#!/bin/bash

#####################################################################
#
# script name: pokedesk.sh
# created in: 06/27/22
# modified in: 21:45:11
#
# summary: information of pokedesk from user
#                                               developed by: bates
#####################################################################

#variables on USER

clear
NUM=$3
NUMBER=$1
NAME_USER=$2
NAME_USER_POKE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
POKE_USER=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.base_experience')
LEVEL_ATTACK_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
LEVEL_DEFENSE_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
clear


if ! test -f scripts/pokedesk/pokedesk.json
then
    clear
    sleep 1
    echo "Nothing recorded on pokedesk"
else
    clear
    sleep 1
    echo "================================================= POKEDESK ================================================================================"
    sleep 1
    cat scripts/pokedesk/pokedesk.json | jq 
fi

echo "#======================================= Choose an option ========================================================="
echo "#                                                                                                                 #"
echo "# [1] - Go Back the road                                                                                          #"
echo "# [2] - See another pokedesk                                                                                      #"
echo "# [3] - Exit                                                                                                      #"
echo "#                                                                                                                 #"
echo "#=================================================================================================================#"
read -p "" CHOISE

if [ "$CHOISE" -eq 1 ]; then
    sh scripts/game/appear.sh $NUMBER $NAME_USER
elif [ "$CHOISE" -eq 2 ]; then
    echo
    read -p "Enter a pokedesk number to search (1-151): " NUMBER
    sh scripts/game/pokedesk_user.sh $NUMBER $NAME_USER
elif [ "$CHOISE" -eq 3 ]; then
    clear
    echo "#=================================================================================================================#"
    echo "#                                           By By                                                                 #"
    echo "#=================================================================================================================#"
    sleep 1
    sh scripts/game/end.sh
    exit 1
else
    clear
    echo "#=================================================================================================================#"
    echo "#                                           Invalid option                                                        #"
    echo "#=================================================================================================================#"
    exit 1

fi