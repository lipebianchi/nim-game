#!/bin/bash

source ./src/torneio.sh

jogador1=0
jogador2=0
partida=0
battle=0


escolher_partida() {
    while true; do
        echo "Escolha o tipo de partida que deseja jogar!"
        echo "1 - Amistosa (1 partida)"
        echo "2 - Torneio (melhor de 3)"
        read type
        partida=$type

        if [ "$type" -ge 1 ] && [ "$type" -le 2 ]; then
            break
        else
            echo "Digite um tipo de partida válido!"
        fi
    done
}
escolher_jogadores() {
    while true; do
        echo "Deseja jogar contra a Máquina ou contra um 2º jogador?"
        echo "1 - Contra a Máquina"
        echo "2 - Contra um 2º jogador"
        read type
        battle=$type

        if [ $type -eq 1 ]; then
            jogador1="Você"
            jogador2="Máquina"
            break
        elif [ $type -eq 2 ]; then
            read -p "Digite o nome do Jogador 1: " jogador1
            read -p "Digite o nome do Jogador 2: " jogador2
            break
        else
            echo "Digite um valor válido!"
            continue
        fi
    done
}

menu(){
    escolher_partida
    escolher_jogadores

    if [ "$partida" -eq 1 ]; then
        jogar_amistoso "$battle" "$jogador1" "$jogador2"
    else
        jogar_torneio "$battle" "$jogador1" "$jogador2"
    fi
}

menu