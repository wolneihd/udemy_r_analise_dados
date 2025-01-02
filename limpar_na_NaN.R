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
                       values=0
                       )

sapply(covid_clean, function(x) sum(is.na(x)))
glimpse(covid_clean)

covid_clean$datahora <- as.Date(covid_clean$datahora, format = '%Y-%m-%d')
glimpse(covid_clean)

View(covid_clean)
View(covid_sp)

# alterando colunas pra caracteres
covid_clean[5:8] <- lapply(covid_clean[5:8], as.character)
glimpse(covid_clean)
