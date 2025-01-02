# Aula 26

# importação de libs
if(!require(dplyr)) install.packages('dplyr')
if(!require(rstatix)) install.packages('rstatix')
library(dplyr)
library(rstatix)

# carregar dataframe
setwd("C:/Users/f0fp0228/Desktop/Curso DEV/udemy_r_analise_dados/covid/data")

# carregar arquivo
covid_sp <- read.csv('dados_covid_sp.csv', sep=';')

# limpar valores NA
covid_sp <- replace(x = covid_sp, 
                       list = is.na(covid_sp),
                       values=0)

# info DF
glimpse(covid_sp)

# Ver DF
View(head(covid_sp))

covid_sp$datahora <- as.Date(covid_sp$datahora, format = '%Y-%m-%d')
covid_sp["idoso"] <- 100*(covid_sp$pop_60/covid_sp$pop)
covid_sp <- rename(covid_sp, porc_idoso = idoso)

# filtrar dados
covid_campinas <- covid_sp %>% filter(nome_munic == "Campinas")
View(covid_campinas)

covid_campinas['dens_demografica'] <- covid_campinas$pop/covid_campinas$area
covid_campinas['area'] <- covid_campinas$area/100

covid_guarulhos <- covid_sp[which(covid_sp$nome_munic=="Guarulhos"),]
covid_guarulhos$area <- covid_guarulhos$area/100
covid_guarulhos['dens_demografica'] <- covid_guarulhos$pop/covid_guarulhos$area
View(covid_guarulhos)

