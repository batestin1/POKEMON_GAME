#!/bin/bash

#####################################################################
#
# script name: appear.sh
# created in: 06/27/22
# modified in: 21:45:11
#
# summary: appear of the random pokemon
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

#variables PC

NUM=$(shuf -i 1-151 -n 1)
POKE_PC=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.base_experience')
LEVEL_ATTACK_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
LEVEL_DEFENSE_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
clear
echo "======================================================= ON THE ROAD ================================================================================="
sleep 1
echo "..."
sleep 1
echo "    ..."
sleep 1
echo "       ...."
sleep 1
echo "A pokemon appear!"
sleep 1
echo "Who could it be?"
sleep 1
echo "..."
sleep 1
echo "it's $POKE_PC"
sleep 1
read -p "Would like to battle ? (Y/n): " OPT

if [ "$OPT" = "Y" -o "$OPT" = "y" -o "$OPT" = "" ]; then
    echo "Let's battle!..."
    sleep 1
    sh scripts/game/battle.sh $NUMBER $NAME_USER $NUM

elif [ "$OPT" = "N" -o "$OPT" = "n" ]; then
    clear
    sleep 1
    echo "################################################################################################################################################"
    sleep 1
    echo "OK. Let's keep walking..."
    sleep 1
    sh scripts/game/appear.sh $NUMBER $NAME_USER
else
    clear
    echo "#=================================================================================================================#"
    echo "#                                           Invalid option                                                        #"
    echo "#=================================================================================================================#"
    exit 1
    sh scripts/game/end.sh
fi 
