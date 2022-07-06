#!/bin/bash

#####################################################################
#
# script name: about.sh
# created in: 06/27/22
# modified in: 21:45:11
#
# summary: about the develops
#                                               developed by: bates
#####################################################################

#variables on USER
NOW=$(git log -p -1 | grep -i Date:)
VAL=$(git log --oneline | grep -i -c "v")
AFTER=$(git log -p -2 | grep -i Date:)
if [ "$AFTER" = "$NOW" ]; then
    VAL=$(git log --oneline | grep -i -c "v")
else
    VAL=$(expr $VAL + 1 )
fi
clear
echo "#========================================== About the Game =======================================================#"
echo "# Developer: MAYCON CYPRIANO                                                                                      #"
echo "# Version: $VAL.0.0                                                                                                  #"
echo "# Creation Dater: $(date +%D)                                                                                        #"
echo "# Language used: SHELL SCRIPT                                                                                     #"
echo "# Libraries required: CURL | JQ                                                                                   #"
echo "# Origin of pokemons: pokemon.api                                                                                 #"
echo "#=================================================================================================================#"
echo "#===================================== OPTION  ===================================================================="
echo "#                                                                                                                 #"
echo "# [1] - Start The Game                                                                                            #"
echo "# [2] - Exit                                                                                                      #"
echo "# [3] - Help                                                                                                      #"
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
     sh scripts/help.sh
else
    clear
    echo "#=================================================================================================================#"
    echo "#                                           Invalid option                                                        #"
    echo "#=================================================================================================================#"
    sleep 2
    sh scripts/game/end.sh
fi