# Aula 21-22

# importação de libs
if(!require(dplyr)) install.packages('dplyr')
library(dplyr)
?dplyr

# carregar dataframe
setwd("C:/Users/f0fp0228/Desktop/Curso DEV/udemy_r_analise_dados/covid/data")

# carregar arquivo
covid_sp <- read.csv('dados_covid_sp.csv', sep=';')
View(head(covid_sp))

summary(covid_sp)

# renomeando colunas
covid_sp_alterado <- rename(covid_sp, municipio = nome_munic)
View(head(covid_sp_alterado))

covid_sp_alterado <- rename(covid_sp_alterado, 
                            data = datahora,
                            rotulo_mapa = map_leg,
                            codigo_mapa = map_leg_s
                            )
View(head(covid_sp_alterado))

# excluir colunas
covid_sp_alterado$cod_ra <- NULL
View(head(covid_sp_alterado))

covid_sp_alterado <- select(covid_sp_alterado, -c(21)) # remove 21º coluna
View(head(covid_sp_alterado))

# remover mais de uma coluna
covid_sp_alterado <- subset(covid_sp_alterado, select = -c(codigo_ibge, cod_drs)) 
View(head(covid_sp_alterado))

covid_sp_alterado <- select(covid_sp_alterado, -c(17:19)) # exclui de 17 até 19
View(head(covid_sp_alterado))

# excluir linhas
covid_sp_alterado <- slice(covid_sp_alterado, -c(239660))
covid_sp_alterado <- slice(covid_sp_alterado, -c(239665:239670))

covid_sp_alterado <- covid_sp_alterado %>% filter(municipio!="Ignorado")
View(head(covid_sp_alterado))

nrow(covid_sp_alterado) - nrow(covid_sp)

# NA > valores ausentes
# NaN > valor indefinido
sapply(covid_sp_alterado, function(x) sum(is.na(x)))
sapply(covid_sp_alterado, function(x) sum(is.nan(x)))



