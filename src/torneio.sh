#!/bin/bash

source ./src/battle.sh

jogar_torneio(){
    jogador1_vitorias=0
    jogador2_vitorias=0
    for i in range {1..3}; do
        echo "Partida $i: "
        if [ $1 -eq 1 ]; then
            player_vs_maquina $2
            vencedor=$?
        else
            player_vs_player $2 $3 
            vencedor=$?
        fi

        pilhas=(3 4 5)

        echo "$vencedor"

        if [ $vencedor -eq 1 ]; then
            ((jogador2_vitorias++))
        else
            ((jogador1_vitorias++))
        fi

        echo "vitorias $2: $jogador1_vitorias"
        echo "vitorias $3: $jogador2_vitorias"

        if [ $jogador1_vitorias -ge 2 ]; then
            echo "$2 é o campeão do torneio!"
            return
        elif [ $jogador2_vitorias -ge 2 ]; then
            echo "$3 é o campeão do torneio!"
            return
        fi
    done
}

jogar_amistoso(){
    echo "Partida amistosa começando..."
    echo "$2 $3"
    if [ $1 -eq 1 ]; then
        player_vs_maquina $2
    else
        player_vs_player $2 $3 
    fi
}