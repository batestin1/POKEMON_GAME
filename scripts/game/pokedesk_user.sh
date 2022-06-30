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
NAME_USER=$2
NUMBER=$1
NAME_USER_POKE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUMBER | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
POKE_USER=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUMBER | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUMBER | jq '.base_experience')
LEVEL_ATTACK_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUMBER | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
LEVEL_DEFENSE_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUMBER | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUMBER | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUMBER | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
clear
echo "================================================= POKEDESK ================================================================================"
sleep 1
echo "POKEMON: $NAME_USER_POKE"
sleep 1
echo "NUMBER ON POKEDESK: $NUMBER"
sleep 1
echo "TYPE: $TYPE"
sleep 1
echo "ABILITY: $ABILITY"
sleep 1
echo "LEVEL: $LEVEL hp"
sleep 1
echo "LEVEL OF ATTACK: $LEVEL_ATTACK_1"
sleep 1
echo "LEVEL OF DEFENSE: $LEVEL_DEFENSE_1"
echo "================================================================================================================================================"
sleep 1

echo "#======================================= Choose an option ========================================================="
echo "#                                                                                                                 #"
echo "# [1] - Go Back the Professor                                                                                     #"
echo "# [2] - See another pokemon                                                                                       #"
echo "# [3] - Exit                                                                                                      #"
echo "#                                                                                                                 #"
echo "#=================================================================================================================#"
read -p "" CHOISE

if [ "$CHOISE" -eq 1 ]; then
    sh scripts/game/chapter_2.sh $NUMBER $NAME_USER
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