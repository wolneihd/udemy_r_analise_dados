# Aula 17

x <- 10
if (x < 10) {
  print('x é maior que 10')
} else {
  print('x é maior que 10')
}

y <- 21
if (y < 20) {
  print('y é menor que 20!')
} else if (y == 20) {
  print('y é igual a 20!')
} else {
  print('y é maior que 20')
}

nota <- 4.5
if (nota >= 6) {
  print('aprovado')
} else if (nota >= 5 & nota < 6) {
  print('em recuperação')
} else {
  print('reprovado')
}

w <- 13
ifelse(w %% 2 == 0, 'par', 'impar') # condição, true, false
