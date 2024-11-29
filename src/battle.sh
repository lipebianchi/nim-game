#!/bin/bash

vez=1

pilhas=(3 4 5)

player_vs_maquina(){
    while true; do

        if [ $vez -eq 1 ];then
            jogador_da_vez $1
        else
            jogada_maquina ${pilhas[@]}
        fi
        resultado=$?
        if [ $resultado -eq 1 ] && [ $vez -eq 1 ];then
            echo "Erro! escolha uma pilha ou quantidade certa!"
            continue
        fi


        if jogo_terminado; then
            if [ $vez -eq 1 ]; then
                echo "$1 perdeu! Não há mais objetos nas pilhas."
                return 1
            else
                echo "A máquina perdeu! Não há mais objetos nas pilhas."
                return 2
            fi
        fi
        if [ $vez -eq 1 ]; then 
            vez=2
        else
            vez=1
        fi
    done
}



player_vs_player(){
    while true; do

        if [ $vez -eq 1 ];then
            jogador_da_vez $1 
        else
            jogador_da_vez $2
        fi
        resultado=$?
        if [ $resultado -eq 1 ];then
            echo "Erro! escolha uma pilha ou quantidade certa!"
            continue
        fi

        if jogo_terminado; then
            if [ $vez -eq 1 ]; then
                echo "$1 perdeu! Não há mais objetos nas pilhas."
                return 1
            else
                echo "$2 perdeu! Não há mais objetos nas pilhas."
                return 2
            fi
        fi
        if [ $vez -eq 1 ]; then 
            vez=2
        else
            vez=1
        fi
    done
}

jogador_da_vez(){

    mostrar_pilhas

    # Jogador 
    echo "$1, escolha uma pilha (1, 2 ou 3):"
    read pilha

    # Verifica se a pilha escolhida é válida
    if [ $pilha -lt 1 ] || [ $pilha -gt 3 ]; then
        echo "Pilha inválida! Escolha entre 1, 2 ou 3."
        return 1
    fi

    echo "Quantos objetos você quer remover da pilha $pilha?"
    read quantidade


    # Verifica se a quantidade a remover é válida
    if [ ${pilhas[$pilha-1]} -lt $quantidade ]; then
        echo "Não há objetos suficientes na pilha $pilha!"
        return 1
    fi


    # Remove objetos da pilha escolhida
    pilhas[$pilha-1]=$((pilhas[$pilha-1] - quantidade))

    echo "Palitos retirados: $quantidade"
    return 0
}

jogada_maquina(){
    pilhas=($@)

    pilhas_validas=()

    for i in ${!pilhas[@]}; do
        if [ ${pilhas[$i]} -gt 0 ]; then
            pilhas_validas+=($i)
        fi
    done

    indice_aleatorio=$((RANDOM % ${#pilhas_validas[@]}))
    pilha_escolhida=${pilhas_validas[$indice_aleatorio]}

    maximo_remover=${pilhas[$pilha_escolhida]}
    pecas_remover=$((RANDOM % maximo_remover + 1))

    pilhas[$pilha_escolhida]=$((pilhas[$pilha_escolhida] - pecas_remover))

    echo "A máquina escolheu a pilha $((pilha_escolhida + 1)) e retirou $pecas_remover peça(s)."
    echo "Pilhas após a jogada da máquina: ${pilhas[@]}"    
}

mostrar_pilhas() {
    echo "Pilha 1: ${pilhas[0]}"
    echo "Pilha 2: ${pilhas[1]}"
    echo "Pilha 3: ${pilhas[2]}"
}

jogo_terminado() {
    if [ ${pilhas[0]} -eq 0 ] && [ ${pilhas[1]} -eq 0 ] && [ ${pilhas[2]} -eq 0 ]; then
        return 0
    else
        return 1
    fi
}