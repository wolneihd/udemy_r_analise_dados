# aula 32

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

# limpeza dos dados
covid_sp$datahora <- as.Date(covid_sp$datahora, format = '%Y-%m-%d')
covid_sp["idoso"] <- 100*(covid_sp$pop_60/covid_sp$pop)
covid_sp <- rename(covid_sp, porc_idoso = idoso)

# análise estatistica
covid_campinas <- covid_sp %>% filter(nome_munic == "Campinas")
View(covid_campinas)

# amplitude total
range(covid_campinas$obitos_novos) # min até max

# quartil
quantile(covid_campinas$casos_novos)

# amplitude interquartil:
IQR(covid_campinas$casos_novos)

summary(covid_campinas$casos_novos)

covid_julho_campinas <- covid_campinas %>% filter(
  datahora >= as.Date("2020-07-01") & 
    datahora <= as.Date("2020-07-31"))
boxplot(covid_julho_campinas$casos_novos)

boxplot(covid_campinas$casos_novos)

# tratamento de outliers
outliers = c(boxplot.stats(covid_campinas$casos_novos)$out)
covid_campinas_sem_outliers <- covid_campinas[-c(which(covid_campinas$casos_novos %in% outliers)),]
boxplot(covid_campinas_sem_outliers$casos_novos)

# tentativa 02 de retirar todos os outliers
# Calcular os limites uma única vez
Q1 <- quantile(covid_campinas$casos_novos, 0.25)
Q3 <- quantile(covid_campinas$casos_novos, 0.75)
IQR <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remover os outliers com base nos limites fixos
covid_campinas_sem_outliers <- covid_campinas[covid_campinas$casos_novos >= lower_bound & covid_campinas$casos_novos <= upper_bound,]

boxplot(covid_campinas_sem_outliers$casos_novos)

# medidas de dispersão
# desvio populacional > soma das diferenças com relação a média.
var(covid_campinas$casos_novos)

# desvio padrão > raiz quadrada da variância populacional
sd(covid_campinas$casos_novos)


