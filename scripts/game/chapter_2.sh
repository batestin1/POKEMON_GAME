#!/bin/bash

#####################################################################
#
# script name: chapter_2.sh
# created in: 06/27/22
# modified in: 21:45:11
#
# summary: the mission about
#                                               developed by: bates
#####################################################################

#variables on USER

clear
NAME_USER=$2
NUMBER=$1
NAME_USER_POKE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
POKE_USER=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq '.base_experience')
LEVEL_ATTACK_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
LEVEL_DEFENSE_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
clear
echo "================================================================================================================================================"
sleep 1
echo "The mission is quite simple..."
sleep 1
echo "I need you to hunt pokemons so I can feed my pokedesk"
sleep 1
read -p "Can you do that for me? (Y/n): " OPT

if [ "$OPT" = "Y" -o "$OPT" = "y" -o "$OPT" = "" ]; then
    
    sh scripts/game/chapter_3.sh $NUMBER $NAME_USER

elif [ "$OPT" = "N" -o "$OPT" = "n" ]; then
    clear
    sleep 1
    echo "################################################################################################################################################"
    sleep 1
    echo "... I thought you could do it.I'm sorry, $NAME_USER, but you're not the one I'm looking for!"
    sleep 1
    echo "bye... bye!"
    sleep 1
    echo "################################################################################################################################################"
    sleep 2
    sh scripts/game/end.sh
else
    clear
    echo "#=================================================================================================================#"
    echo "#                                           Invalid option                                                        #"
    echo "#=================================================================================================================#"
    sleep 2
    sh scripts/game/end.sh
fi