#!/bin/bash

escolher_partida(){
    echo "Escolha o tipo de partida de deseja jogar!"
    echo "1 - ) Amistosa (1 partida)"
    echo "2 - ) Torneio (melhor de 3)"
    read tipo_partida
}

escolher_jogadores() {
    echo "Deseja jogar contra a Máquina ou contra um 2º jogador?"
    echo "1 - Contra a Máquina"
    echo "2 - Contra um 2º jogador"
    read tipo_jogo

    if [ $tipo_jogo -eq 1 ]; then
        jogador1="Jogador 1"
        jogador2="Máquina"
    else
        read -p "Digite o nome do Jogador 1: " jogador1
        read -p "Digite o nome do Jogador 2: " jogador2
    fi
}

jogar_torneio(){
    jogador1_vitorias=0
    jogador2_vitorias=0
    for i in range {1..3}; do
        echo "Partida $i: "
        jogar_partida

        if [ $vencedor == $jogador1 ];then
            ((jogador1_vitorias++))
        else
            ((jogador2_vitorias++))
        fi

        if [ $jogador1_vitorias -ge 2 ]; then
            echo "$jogador1 é o campeão do torneio!"
            return
        elif [ $jogador2_vitorias -ge 2 ]; then
            echo "$jogador2 é o campeão do torneio!"
            return
}