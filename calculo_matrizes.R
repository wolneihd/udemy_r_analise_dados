# Aula 13

matriz_nova <- matrix(2:9, ncol = 2)

dimnames(matriz_nova) <- list(c('linha1', 'linha2','linha3','linha4'),
                              c('coluna1', 'coluna2'))
matriz_nova

produto <- 2 * matriz_nova
produto

matrizA <- matrix(c(1,5,15,8), nrow=2, ncol=2, byrow=TRUE)
matrizB <- matrix(c(2,4,6,10), nrow=2, ncol=2, byrow=TRUE)

soma <- matrizA + matrizB
soma

subtracao <- matrizA - matrizB
subtracao

produto = matrizA %*% matrizB
produto

media_col <- colMeans(matrizA)
media_col

media_row <- rowMeans(matrizA)
media_row

soma_linhas <- rowSums(matrizA)
soma_linhas

soma_colunas <- colSums(matrizA)
soma_colunas
