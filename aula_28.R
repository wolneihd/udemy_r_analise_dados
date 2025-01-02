# Aula 28

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

# ver head
View(head(covid_sp))

# medidas de centralidade
mean(covid_sp$casos_novos)
max(covid_sp$casos_novos)

summarise_at(covid_sp, vars(obitos_novos, casos_novos), mean)

View(covid_sp %>% filter(casos_novos == max(covid_sp$casos_novos)))

covid_campinas <- covid_sp %>% filter(nome_munic == "Campinas")
plot(covid_campinas$datahora, 
     covid_campinas$casos_novos, 
     title("Casos Novos"),
     col="blue")
View(covid_campinas)

# Mediana
median(covid_campinas$obitos_novos)
median(covid_campinas$casos_novos)
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), median)

# Moda > valor que mais aparece
moda <- function(m) {
  valor_unico <- unique(m)
  valor_unico[which.max(tabulate(match(m, valor_unico)))]
}

moda(covid_campinas$obitos_novos)

# filtrar pelo mês:
covid_julho_campinas <- covid_campinas %>% filter(
  datahora >= as.Date("2020-07-01") & 
  datahora <= as.Date("2020-07-31"))

moda(covid_julho_campinas$obitos_novos)
moda(covid_julho_campinas$casos_novos)

mean(covid_julho_campinas$obitos_novos)
mean(covid_julho_campinas$casos_novos)

hist(
  covid_julho_campinas$obitos_novos, 
  col='blue',
  xlab = "Casos novos",
  main = paste("Histograma novos obitos em Julho de 2020")
  )

plot(
  covid_julho_campinas$datahora,
  covid_julho_campinas$obitos_novos,
  type = "l",
  main = "Histograma novos obitos em Julho de 2020",
  col = 'green',
  xlab = 'data',
  ylab = 'frequência'
)

?hist
?plot


