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
sudo apt-get update -y > /dev/null 2> /dev/null && sudo apt-get upgrade -y > /dev/null 2> /dev/null
sudo apt-get install curl  > /dev/null 2> /dev/null
sudo apt-get install jq > /dev/null 2> /dev/null

#game
rm -R /home/bates/Documents/repositorio/shell/pokemon/scripts/pokedesk 2> /dev/null > /dev/null
rm /home/bates/Documents/repositorio/shell/pokemon/scripts/game/save.log 2> /dev/null > /dev/null 

clear
echo "###########################################################################################################################"
sleep 1
echo "Hello, there!"
sleep 1
echo "Glad to meet you"
sleep 1
echo "Welcome to Pokemon World!"
sleep 1
echo "My name is Dr. Linu X"
sleep 1
echo "People affectionately refe to me as the POKEMON PROFESSOR"
sleep 1
echo "I have a special mission for you."
sleep 1
read -p "But first, tell me what your name is?  " NAME_USER
sleep 1
echo "Nice to meet you $NAME_USER"
sleep 1
echo "I need to study pokemon and for that I would like to give you one of these three pokemons"
sleep 1
echo "#---------------------------------------------------------------------------------------#"
echo "# [1] - Bulbasaur                                                                       #"
echo "# [2] - Charmander                                                                      #"
echo "# [3] - Squirtle                                                                        #"
echo "#---------------------------------------------------------------------------------------#"
read -p "What's your choice? " CHOISE

if [ "$CHOISE" -eq 1 ]; then
    sh  scripts/game/chapter_1.sh 1 $NAME_USER
elif [ "$CHOISE" -eq 2 ]; then
     sh scripts/game/chapter_1.sh 4  $NAME_USER
elif [ "$CHOISE" -eq 3 ]; then
     sh scripts/game/chapter_1.sh 7 $NAME_USER
else
    echo "#=================================================================================================================#"
    echo "#                                           Invalid option                                                        #"
    echo "#=================================================================================================================#"
   
    sleep 2
    sh scripts/game/end.sh
    exit 1
fi