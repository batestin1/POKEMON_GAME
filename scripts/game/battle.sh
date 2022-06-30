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
NUM=$3
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

POKE_PC=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.base_experience')
LEVEL_ATTACK_PC=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
LEVEL_DEFENSE_PC=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
clear
echo "======================================================= BATTLE ================================================================================="
sleep 1
echo "Choose:"
echo "[1] - Attack"
echo "[2] - Defense"
read -p "" OPT

if [ "$OPT" -eq 1 ]; then
    if [ "$LEVEL_ATTACK_1" -gt "$LEVEL_DEFENSE_PC" ]; then
        sleep 1
        echo "The $POKE_PC It has a defense of... $LEVEL_DEFENSE_PC"
        sleep 1
        echo "The $POKE_USER It has a attack of... $LEVEL_ATTACK_1"
        sleep 1
        echo "So, the win is..."
        echo "$POKE_USER"
    elif [ "$LEVEL_ATTACK_1" -lt "$LEVEL_DEFENSE_PC" ]; then
        sleep 1
        echo "The $POKE_PC It has a defense of... $LEVEL_DEFENSE_PC"
        sleep 1
        echo "The $POKE_USER It has a attack of... $LEVEL_ATTACK_1"
        sleep 1
        echo "So, the win is..."
        echo "$POKE_PC"
    else
        sleep 1
        echo "The $POKE_PC have the same level as $POKE_USER"
        sleep 1
        echo "There was no winner!"
    fi
elif [ "$OPT" -eq 2 ]; then
    if [ ! "$LEVEL_ATTACK_1" -gt "$LEVEL_DEFENSE_PC" ]; then
        sleep 1
        echo "The $POKE_PC It has a defense of... $LEVEL_DEFENSE_PC"
        sleep 1
        echo "The $POKE_USER It has a attack of... $LEVEL_ATTACK_1"
        sleep 1
        echo "So, the win is..."
        echo "$POKE_PC"
    elif [ ! "$LEVEL_ATTACK_1" -lt "$LEVEL_DEFENSE_PC" ]; then
        sleep 1
        echo "The $POKE_PC It has a defense of... $LEVEL_DEFENSE_PC"
        sleep 1
        echo "The $POKE_USER It has a attack of... $LEVEL_ATTACK_1"
        sleep 1
        echo "So, the win is..."
        echo "The $POKE_USER"
    else
        sleep 1
        echo "$POKE_PC have the same level as $POKE_USER"
        sleep 1
        echo "There was no winner!"
    fi
else
    clear
    echo "#=================================================================================================================#"
    echo "#                                           Invalid option                                                        #"
    echo "#=================================================================================================================#"
    exit 1
    sh scripts/game/end.sh
fi

sleep 1
read -p "...$NAME_USER, would like to save you this appearance on pokedesk? (Y/n): " OPT_2
if [ "$OPT_2" = "Y" -o "$OPT_2" = "y" -o "$OPT_2" = "" ]; then
    sleep 1
    echo "record..."
    mkdir -p scripts/pokedesk
    echo "{\"NAME\": \"$POKE_PC\", \"POKEDESK\": \"$NUM\", \"LEVEL\": \"$LEVEL\", \"ATTACK\": \"$LEVEL_ATTACK_1\", \"DEFENSE\": \"$LEVEL_DEFENSE_1\",\"TYPE\": \"$TYPE\", \"ABILITY\": \"$ABILITY\" }" >> scripts/pokedesk/pokedesk.json
    sleep 1
    echo "$POKE_PC it's save on POKEDESK"
    sleep 1
    read -p "I would like to see you? (Y/n): " OPT_3
    if [ "$OPT_3" = "Y" -o "$OPT_3" = "y" -o "$OPT_3" = "" ]; then
        sleep 1
        sh scripts/game/pokedesk_pc.sh $NUMBER $NAME_USER $NUM
    elif [ "$OPT_3" = "N" -o "$OPT_3" = "n"  ]; then
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
elif [ "$OPT_2" = "N" -o "$OPT_2" = "n" ]; then
    sleep 1
    echo "OK. Pokemon not saved!"
    sleep 1
    echo "Let's keep walking..."
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