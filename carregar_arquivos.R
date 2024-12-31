# Aula 16

# session > Set Working Directory > Choose directory ...
setwd("C:/Users/f0fp0228/Desktop/Curso DEV/udemy_r_analise_dados/arquivos")

# arquivo TXT
df1 <- read.table('partks.txt')
View(df1)
dim(df1)

# arquivo CSV
df2 <- read.csv("mola.csv")
View(df2)

df3 <- read.csv('questoes.csv', encoding = 'latin-1')
df3 <- read.csv('questoes.csv', encoding = 'iso-8859-1')
df3 <- read.csv('questoes.csv', encoding = 'UTF-8')
View(df3)

# arquivo excel
install.packages('readxl')
library(readxl)

df4 <- read_xlsx('registro.xlsx')
View(df4)
