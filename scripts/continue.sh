#!/bin/bash

#####################################################################
#
# script name: Continue.sh
# created in: 06/27/22
# modified in: 21:45:11
#
# summary: start the game
#                                               developed by: bates
#####################################################################

#variables on USER
clear

if test -f scripts/game/save.log ; then
    sleep 1
    echo "============================================ LOAD ============================================"
    sleep 1
    echo "Load..."
    sleep 1
    echo "Go to road!"
    PARAM=$(head -1 scripts/game/save.log)
    sleep 1
    sh scripts/game/appear.sh $PARAM
else
    sleep 1
    echo "========================================= LOAD ===================================================="
    sleep 1
    echo "There is no saved game, let's start a match!"
    sleep 3
    sh scripts/game/game.sh
fi