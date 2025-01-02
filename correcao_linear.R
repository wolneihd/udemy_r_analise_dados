# Aula 37

# Regressão Linear
# correlação linear
# coeficiente de Pearson (p-value)

# coeficiente de determinição (r²)
# homocedasticidade

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

plot(covid_campinas$casos, covid_campinas$obitos)
cor(covid_campinas$casos, covid_campinas$obitos, method='spearman')

regressao <- lm(formula = obitos ~ casos, data=covid_campinas) #linear model
regressao$coefficients
summary(regressao)

if(!require(ggplot2)) install.packages(ggplot2)
library('ggplot2')

ggplot(data=covid_campinas, mapping = aes(x=casos, y=obitos)) +
  geom_point() + geom_smooth(method = 'lm', col = 'red')

if(!require(corrplot)) install.packages(corrplot)
library('corrplot')

matriz_corr <- cor(covid_campinas[6:7], method = 'spearman')
View(matriz_corr)

corrplot(
  matriz_corr, 
  method = 'color',
  type='full',)

# gráficos lineares
covid_cidades <- covid_sp %>% filter(nome_munic %in% c("Campinas", "Guarulhos", "Sorocaba"))
View(covid_cidades)

ggplot(covid_cidades, aes(x = casos, y = obitos, color = nome_munic)) +
  geom_line() +
  labs(
    title = "Evolução dos óbitos em função dos casos de COVID",
    x = "Casos",
    y = "Óbitos"    
  ) + theme_classic()
