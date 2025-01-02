# Aula 24

# importação de libs
if(!require(dplyr)) install.packages('dplyr')
library(dplyr)

# carregar dataframe
setwd("C:/Users/f0fp0228/Desktop/Curso DEV/udemy_r_analise_dados/covid/data")

# carregar arquivo
covid_sp <- read.csv('dados_covid_sp.csv', sep=';')

sapply(covid_sp, function(x) sum(is.na(x)))
sapply(covid_sp, function(x) sum(is.nan(x)))

covid_clean <- replace(x = covid_sp, 
                       list = is.na(covid_sp),
                       values=0)

# criação de colunas
covid_clean["idoso(%)"] <- 100*(covid_clean$pop_60/covid_clean$pop)
View(head(covid_clean))

# salvar tabela em csv
write.table(covid_clean, file='covid_sp_tratado.csv', sep=';')