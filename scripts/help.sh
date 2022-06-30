#!/bin/bash

#####################################################################
#
# script name: help.sh
# created in: 06/27/22
# modified in: 21:45:11
#
# summary: informations will help on game
#                                               developed by: bates
#####################################################################

#variables on USER

clear
echo "#========================================== HELP COMMAND =========================================================#"
echo "# This game was designed on top of the original Pokemon Red                                                       #"
echo "# Contains only the original 151 pokemons                                                                         #"
echo "# It works intuitively, where your computer will ask you questions and you will have option to answer             #"
echo "# To start the game just follow one of the options below                                                          #"
echo "# At any time of the game type 'ctrl + q' to exit                                                                 #"
echo "#=================================================================================================================#"
echo "#===================================== OPTION  ===================================================================="
echo "#                                                                                                                 #"
echo "# [1] - Start The Game                                                                                            #"
echo "# [2] - Exit                                                                                                      #"
echo "# [3] - About                                                                                                     #"
echo "#                                                                                                                 #"
echo "#=================================================================================================================#"
read -p "" OPT

if [ "$OPT" -eq 1 ]; then
    sh scripts/game/game.sh
elif [ "$OPT" -eq 2 ]; then
    clear
    echo "#=================================================================================================================#"
    echo "#                                           By By                                                                 #"
    echo "#=================================================================================================================#"
    sleep 1
    sh scripts/game/end.sh
    exit 1
elif [ "$OPT" -eq 3 ]; then
     sh scripts/about.sh
else
    clear
    echo "#=================================================================================================================#"
    echo "#                                           Invalid option                                                        #"
    echo "#=================================================================================================================#"
    exit 1
    sh scripts/game/end.sh
fi