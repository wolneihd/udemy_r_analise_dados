# aula 11
escolaridade <- c("fundamental",'medio','superior','medio', 'superior','fundamental')
escolaridade

escolaridade_fator <- as.factor(escolaridade)
escolaridade_fator

summary(escolaridade)
summary(escolaridade_fator)

table(escolaridade)

tensao_casas <- c(110,220,110,110,110,110,220)
summary(tensao_casas) # .describe() (py)

tensao_casas_fator <- as.factor(tensao_casas)
summary(tensao_casas_fator) # sort_values() (py)
