#!/bin/bash
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