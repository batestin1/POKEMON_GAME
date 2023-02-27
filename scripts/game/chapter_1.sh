#!/bin/bash

#####################################################################
#
# script name: chapter_1.sh
# created in: 06/27/22
# modified in: 21:45:11
#
# summary: the first choise from user
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
echo "Great, $NAME_USER"
sleep 1
echo "You choose the $NAME_USER_POKE"
sleep 1
read -p "Would you like to know what pokedesk says about your pokemon? (Y/n): " INFO

if [ "$INFO" = Y -o "$INFO" = y -o "$INFO" = "" ]; then
    sh scripts/game/pokedesk_user.sh  $NUMBER $NAME_USER
elif [ "$INFO" = n -o "$INFO" = N ]; then
    sh scripts/game/chapter_2.sh $NUMBER $NAME_USER
else
    echo "#=================================================================================================================#"
    echo "#                                           Invalid option                                                        #"
    echo "#=================================================================================================================#"

    sleep 2
    sh scripts/game/end.sh
fi