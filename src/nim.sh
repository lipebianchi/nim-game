#!/bin/bash


# Chama o arquivo torneio.sh
source torneio.sh

# Inicializa as variáveis globais
pilhas=(3 4 5)
jogador=1

# Função para exibir o estado atual das pilhas
mostrar_pilhas() {
    echo "Pilha 1: ${pilhas[0]}"
    echo "Pilha 2: ${pilhas[1]}"
    echo "Pilha 3: ${pilhas[2]}"
}

# Função para checar de quem é a vez de jogar
jogador_da_vez(){

    mostrar_pilhas

    
    if [ $jogador -eq 1 || $jogador -eq 2];then
        # Jogador 
        echo "Jogador $1, escolha uma pilha (1, 2 ou 3):"
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
    else

    # Remove objetos da pilha escolhida
    pilhas[$pilha-1]=$((pilhas[$pilha-1] - quantidade))

    echo "Palitos retirados: $quantidade"

    return 0
}

# Função para verificar se o jogo terminou
jogo_terminado() {
     if [ ${pilhas[0]} -eq 0 ] && [ ${pilhas[1]} -eq 0 ] && [ ${pilhas[2]} -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

# Loop principal do jogo
while true; do
    
    if [ $choose -eq "H"]
        jogador_da_vez $jogador
        resultado=$?
        if [ $resultado -eq 1 ];then
            echo "Erro! escolha uma pilha ou quantidade certa!"
            continue
        fi
        if jogo_terminado; then
            echo "Jogador $jogador perdeu! Não há mais objetos nas pilhas."
            break
        fi
        if [ $jogador -eq 1 ];then 
            jogador=2
        else
            jogador=1
        fi
    else
        jogador_da_vez 
done
