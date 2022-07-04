#!/bin/bash

#####################################################################
#
# script name: pokemon_go.sh
# created in: 06/27/22
# modified in: 21:45:11
#
# summary: a introducion to game
#                                               developed by: bates
#####################################################################

#variables on USER
#instalation process

clear
echo "###########################################################################################################################"
sleep 1
echo "Hello, there!"
sleep 1
echo "Glad to meet you"
sleep 1
echo "Welcome to Pokemon World!"
sleep 1
echo "My name is DR. LINU X"
sleep 1
echo "People affectionately refe to me as the POKEMON PROFESSOR"
sleep 1
echo "I have a special mission for you."
sleep 1
echo "But first..."
sleep 1
read -p "tell me what your name is?  " NAME
NAME_USER=$(echo $NAME | tr a-z A-Z )
sleep 1
if [ $NAME_USER ]; then
    echo "Nice to meet you $NAME_USER"
    sleep 1
else
    NAME=$(whoami)
    NAME_USER=$(echo $NAME | tr a-z A-Z )
    echo "You didn't give a name. I'm going to call you $NAME_USER"
    sleep 1
fi
echo "I need to study pokemon and for that I would like to give you one of these three pokemons"
#Variables PC

NUM_1=$(shuf -i 1-151 -n 1)
POKE_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_1 | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
NUM_2=$(shuf -i 1-151 -n 1)
POKE_2=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_2 | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
NUM_3=$(shuf -i 1-151 -n 1)
POKE_3=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_3 | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)

sleep 1
echo "#---------------------------------------------------------------------------------------#"
echo "# [1] - $POKE_1                                                                    "
echo "# [2] - $POKE_2                                                                    "
echo "# [3] - $POKE_3                                                                    "
echo "#---------------------------------------------------------------------------------------#"
read -p "What's your choice? " CHOISE

if [ "$CHOISE" -eq 1 ]; then
    sh  scripts/game/chapter_1.sh $NUM_1 $NAME_USER
elif [ "$CHOISE" -eq 2 ]; then
     sh scripts/game/chapter_1.sh $NUM_2  $NAME_USER
elif [ "$CHOISE" -eq 3 ]; then
     sh scripts/game/chapter_1.sh $NUM_3 $NAME_USER
else
    echo "#=================================================================================================================#"
    echo "#                                           Invalid option                                                        #"
    echo "#=================================================================================================================#"
   
    sleep 2
    sh scripts/game/end.sh
    exit 1
fi