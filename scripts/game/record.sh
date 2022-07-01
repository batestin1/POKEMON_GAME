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
echo "======================================================= RECORD ================================================================================="
sleep 1
read -p "...$NAME_USER, would like to save you this appearance on pokedesk? (Y/n): " OPT_2
if [ "$OPT_2" = "Y" -o "$OPT_2" = "y" -o "$OPT_2" = "" ]; then
    sleep 1
    echo "record..."
    mkdir -p scripts/pokedesk
    echo "{\"NAME\": \"$POKE_PC\", \"POKEDESK\": \"$NUM\", \"LEVEL\": \"$LEVEL\", \"ATTACK\": \"$LEVEL_ATTACK_1\", \"DEFENSE\": \"$LEVEL_DEFENSE_1\",\"TYPE\": \"$TYPE\", \"ABILITY\": \"$ABILITY\" }" >> scripts/pokedesk/pokedesk.json
    echo "[$NUM] - $POKE_PC" >> scripts/pokedesk/pokedesk_search.txt
    echo "$NUMBER $NAME_USER $NUM" > scripts/game/save.log
    sleep 1
    echo "$POKE_PC it's save on POKEDESK"
    sleep 1
    echo "What you like to do now?"
    sleep 1
    echo "#====================================== OPTIONS =====================================================#"
    echo "# [1] - See on you new pokedesk                                                                      #"
    echo "# [2] - Change you pokemon                                                                           #"
    echo "# [3] - Keep walking                                                                                 #"
    echo "#====================================================================================================#"
    read -p "" OPT_3

    if [ "$OPT_3" -eq 1 ]; then
        sleep 1
        sh scripts/game/pokedesk_pc.sh $NUMBER $NAME_USER $NUM
    elif [ "$OPT_3" -eq 2 ]; then
        sleep 1
        echo "OK. let's change you pokemon..."
        sleep 1
        echo "First, in this painel, search who you want."
        sleep 1
        SEARCH=$(cat scripts/pokedesk/pokedesk_search.txt )
        echo "#------------------------------------------------#"
        echo "$SEARCH                                           "
        echo "#------------------------------------------------#"
        read -p "Insert the number of pokemon: " NAME_P
        sleep 1
        echo "Nice..."
        sleep 1
        POKE_PC=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NAME_P | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
        echo "You now have a $POKE_PC"
        sleep 1
        sh scripts/game/appear.sh $NAME_P $NAME_USER

    elif [ "$OPT_3" -eq 3 ]; then
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
        sleep 2
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
    sleep 2
    sh scripts/game/end.sh
fi