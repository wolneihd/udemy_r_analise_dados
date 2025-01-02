# Aula 36

# Shapiro-Wilk
# Anderson-Darling
# Kolmogorov-Smirnov
# Cramer-Von Mises
# Histograma
# QQplot

if(!require(nortest)) install.packages('nortest')
library(nortest)

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

# filtra apenas Campinas
covid_campinas <- covid_sp %>% filter(nome_munic == "Campinas")

# Histograma
hist(covid_campinas$casos_novos, probability = T, col='blue')
lines(density(covid_campinas$casos_novos), col='red')

# QQplot
qqnorm(covid_campinas$casos_novos)
qqline(covid_campinas$casos_novos)

# Shapiro-Wilk
shapiro.test(covid_campinas$casos_novos)

# Anderson-Darling
ad.test(covid_campinas$casos_novos)

# Kolmogorov-Smirnov (não mais usado)
ks.test(covid_campinas$casos_novos, pnorm)
lillie.test(covid_campinas$casos_novos)

# Cramer-Von Mises
cvm.test(covid_campinas$casos_novos)
