# Aula 10
vetor <- c(1,2,3,4,5,6,7)
vetor
class(vetor)

dias <- c('segunda','terca','quarta','quinta','sexta','sabado','domingo')
dias
class(dias)

juntando <- c(vetor, dias)
juntando

gastos_dia <- c(400,300,100,500,150,430,70)
total <- sum(gastos_dia)
total

minimo <- min(gastos_dia)
maximo <- max(gastos_dia)
media <- mean(gastos_dia)
ordem_crescente <- sort(gastos_dia)

limite <- (gastos_dia <= 300)
limite

intervalo <- (3:8)
intervalo

passo <- seq(2,42, by=5)
passo

repeticao <- rep(2,8)
repeticao

repeticao_multipla <- rep(c(3,5),c(4,6))
repeticao_multipla

repeticao_programada <- rep(3:5, each=3)
repeticao_programada

vetor <- c(2,4,6,8,10,12)
vetor <- c(vetor, 14)
vetor

posicao <- vetor[7]
posicao

vetor <- vetor[-3] # exclui o vetor de index 3
vetor
