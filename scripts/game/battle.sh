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
LEVEL_USER=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq '.base_experience')
LEVEL_ATTACK_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
LEVEL_DEFENSE_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$1 | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)

#variables PC

POKE_PC=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
LEVEL_PC=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.base_experience')
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
        sleep 1
        echo "The $POKE_PC It has a defense of... $LEVEL_DEFENSE_PC"
        sleep 1
        echo "The $POKE_USER It has a attack of... $LEVEL_ATTACK_1"
        sleep 1
        DAMAGE_1=$(expr "$LEVEL_PC" - "$LEVEL_ATTACK_1")
        echo "your damage on $POKE_PC was... $DAMAGE_1 hp!"
        if [ $DAMAGE_1 -le 50 ]; then
            echo "So, the win is..."
            sleep 1
            echo "..."
            sleep 1
            echo "   ..."
            sleep 1
            echo "      ..."
            echo "$POKE_USER"
            sleep 1
            sh scripts/game/record.sh $NUMBER $NAME_USER $NUM
        else
            sleep 1
            echo "You didn't defeat $POKE_PC"
            sleep 1
        fi
elif [ "$OPT" -eq 2 ]; then
    sleep 1
    echo "The $POKE_PC It has a attack of... $LEVEL_ATTACK_PC"
    sleep 1
    echo "The $POKE_USER it has a defense of... $LEVEL_DEFENSE_1"
    sleep 1
    DAMAGE_1=$(expr "$LEVEL_PC" - "$LEVEL_DEFENSE_1")
    echo "your damage on $POKE_PC was... $DAMAGE_1 hp!"
    if [ $DAMAGE_1 -le 0 ]; then
            echo "So, the win is..."
            sleep 1
            echo "..."
            sleep 1
            echo "   ..."
            sleep 1
            echo "      ..."
            echo "$POKE_USER"
            sleep 1
            sh scripts/game/record.sh $NUMBER $NAME_USER $NUM
        else
            sleep 1
            echo "You didn't defeat $POKE_PC"
            sleep 1
        fi
else
    clear
    echo "#=================================================================================================================#"
    echo "#                                           Invalid option                                                        #"
    echo "#=================================================================================================================#"
    sleep 2
    sh scripts/game/end.sh
fi
    
sleep 1
echo "===================================================="
sleep 1
echo "What do you want to do now? "
echo "[1] - New Battle"
echo "[2] - On the road"
echo "[3] - Exit"
read -p "" OPT_2

if [ "$OPT_2" -eq 1 ]; then
    sleep 1
    echo "Let's do so..."
    sleep 1
    sh scripts/game/battle.sh $NUMBER $NAME_USER $NUM
elif [ "$OPT_2" -eq 2 ]; then
    sleep 1
    echo "Back on the road..."
    sleep 1
    sh scripts/game/appear.sh $NUMBER $NAME_USER
elif [ "$OPT_2" -eq 3]; then
    clear
    sleep 1
    echo "################################################################################################################################################"
    sleep 1
    echo "...$NAME_USER... I'll see you later!"
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