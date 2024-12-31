# Aula 20

mes_numero <- c(1,2,3,4,5,6,7,8,9,10,11,12)
mes_nome <- c("janeiro","fevereiro","março","abril","maio","junho","julho",
              "agosto","setembro","outubro","novembro","dezembro")
ano <- c(2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021)

periodo <- data.frame(mes_numero, mes_nome, ano)
periodo
View(periodo)

df <- mtcars
df

df2 <- airquality
View(df2)

?airquality

library(help = 'datasets')

nrow(df)
ncol(df)
dim(df)
summary(df)

nome <- c("Luciano","Pedro","Joyce", "Maria")
idade <- c(46, 38, 27, 29)
curso <- c("Estatística", "Linguagem R", "Redes Neurais", "Python")
lista <- list(nome, idade, curso)
lista