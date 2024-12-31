# aula 12 - Matrizes

?matrix
?factor

matriz <- matrix(c(1,5,10,30,15,8), nrow=3, ncol=2, byrow=TRUE)
matriz

matriz [2,2]

vetorA <- c(2,5,8)
vetorB <- c(3,6,9)
matriz <- rbind(vetorA, vetorB)
matriz

matriz[2,3] # linha 2, coluna 3

matriz_nova <- matrix(2:9, ncol = 2)
matriz_nova

dim(matriz_nova) # dimensões
nrow(matriz_nova)
ncol(matriz_nova)

dimnames(matriz_nova) <- list(c('linha1', 'linha2','linha3','linha4'),
                              c('coluna1', 'coluna2'))
matriz_nova
