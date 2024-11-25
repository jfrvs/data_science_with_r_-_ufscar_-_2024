# Lendo pacotes----------------------------------------------------------------

library(dplyr)
library(nycflights13)
library(ggplot2)
library(gridExtra)


# Exercício 1 -----------------------------------------------------------------

nome = "Izabel"
idade = 27
ano = 1996
r = TRUE

idade + ano
# Se você já fez aniversário nesse ano, o resultado será 2024!
# Se você ainda não fez ainda aniversário, o resultado será 2023!

ano + r
# Como r é uma variável lógica, ela é convertida para numérica para fazer a
# a operação, assumindo valor 1, se você já conhecia o R, e 0 caso contrário

idade - r
# Como r é uma variável lógica, ela é convertida para numérica para fazer a
# a operação, assumindo valor 1, se você já conhecia o R, e 0 caso contrário

r * nome
# Como nome é um character, não é possível fazer operações: o R retorna um erro

rep(nome, idade)
# Cria um vetor com o tamanho de acordo com a sua idade preenchido com seu nome


# Exercício 2 -----------------------------------------------------------------

x = seq(from = -4, to = 4, length = 10)
y = x^2
plot(x, y, type = "l")


# Exercício 3 -----------------------------------------------------------------

x = seq(from = -4, to = 4, length = 1000)
y = x^2
plot(x, y, type = "l")
# Esse gráfico fica mais suave pois temos mais pontos!


# Exercício 4 -----------------------------------------------------------------

s = seq(0, 1000, by = 30)

# letra a
which(s == 510)

# letra b
length(s)

# letra c
s[34] - s[20]  # já que sabemos que o vetor tem tamanho 34
s[length(s)] - s[20]  # forma mais geral de fazer a conta

# letra d
media = sum(s) / length(s)
media

media == mean(s)  # para validar o resultado


# Exercício 5 -----------------------------------------------------------------

w = c(5, 10, 50, 30, 1, 0, 2, 300, 100, 60)
resultado = c(100, 60, 50, 30, 10, 5, 2, 1) # para checar o resultado

# maneira 1 de resolver
w_aux_1 = w[(w != 0) & (w != 300)]
w_aux_2 = sort(w_aux_1)
w_final_1 = rev(w_aux_2)
w_final_1

all(w_final_1 == resultado)  # checando se o resultado é igual

# maneira 2 de resolver
w_aux_1 = sort(w)
w_aux_2 = rev(w_aux_1)
w_final_2 = w_aux_2[-c(1, length(w_aux_2))]
w_final_2

all(w_final_2 == resultado)  # checando se o resultado é igual

# maneira 3 de resolver
w_final_3 = rev(sort(w[(w != 0) & (w != 300)]))
w_final_3

all(w_final_3 == resultado)  # checando se o resultado é igual

# maneira 4 de resolver
w_final_4 = w[(w != 0) & (w != 300)] %>% sort() %>% rev()
w_final_4

all(w_final_4 == resultado)  # checando se o resultado é igual

# Existem diversas outras formas de resolver esse problema...
# Fica ao critério da nossa criatividade!


# Exercício 6 -----------------------------------------------------------------

frutas = matrix(c("maçã", "banana", "cereja", "laranja", "uva", "abacaxi",
                  "pera", "melão", "figo"), nrow = 3, ncol = 3)
frutas

# letra a
frutas[2, 2]

# letra b
frutas[, 2]

# letra c
frutas[c(1, 3), c(1, 3)]

# letra d

# maneira 1 de resolver
nova_coluna = c("manga", "melancia", "acerola")
nova_linha = c("carambola", "caqui", "morango", "pitaya")
frutas_1 = cbind(frutas, nova_coluna)
rbind(frutas_1, nova_linha)

# maneira 2 de resolver
rbind(cbind(frutas, c("manga", "melancia", "acerola")), 
      c("carambola", "caqui", "morango", "pitaya"))

# maneira 3 de resolver
frutas %>%
  cbind(c("manga", "melancia", "acerola")) %>% 
  rbind(c("carambola", "caqui", "morango", "pitaya"))


# Exercício 7 -----------------------------------------------------------------

idade = 5
if (idade < 18) {
  print("menor de idade")
} else if (idade < 60) {
  print("adulto")
} else {
  print("idoso")
}


# Exercício 8 -----------------------------------------------------------------

checa_idade = function(idade) {
  
  if (idade < 18) {
    resultado = "menor de idade"
  } else if (idade < 60) {
    resultado = "adulto"
  } else {
    resultado = "idoso"
  }
  
  resultado
  
}

checa_idade(5)
checa_idade(18)
checa_idade(60)


# Exercício 9 -----------------------------------------------------------------

dados1 = data.frame(Treino = c("Força", "Resistência", "Outro"),
                    Pulso = c(100, 150, 120), Duração = c(60, 30, 45))
dados2 = data.frame(Passos = c(3000, 6000, 2000),
                    Calorias = c(300, 400, 300))

# letra a
dados = cbind(dados1, dados2)
# Como não temos colunas em comum, não conseguimos usar o join do dplyr

# letra b

# maneira 1 de resolver
mean(dados$Calorias)
mean(dados$Pulso)

# maneira 2 de resolver
colMeans(dados[, c("Calorias", "Pulso")])

# maneira 3 de resolver
dados %>% 
  summarise(media_calorias = mean(Calorias),
            media_pulso = mean(Pulso))

# maneira 4 de resolver
dados %>% 
  select(Calorias, Pulso) %>% 
  summarise_all(mean)

# letra c

# maneira 1 de resolver
dados[-1, -3]

# maneira 2 de resolver
dados %>% 
  filter(Treino != "Força") %>% 
  select(-Passos)


# Exercício 10 ----------------------------------------------------------------

# letra a
str(flights)
dados = flights %>% 
  select(origin, dest, dep_delay, arr_delay, air_time)

# letra b
dados1 = dados %>% 
  rename(Origem = origin,
         Destino = dest,
         `Atraso na Partida` = dep_delay,
         `Atraso na Chegada` = arr_delay,
         `Duração do Vôo` = air_time)

# letra c
dados2 = dados1 %>% 
  arrange(Origem, Destino, `Duração do Vôo`)
# Ordenando por Origem, Destino e Duração do Vôo

# letra d
dados3 = dados2 %>% 
  filter(`Atraso na Partida` > 0,
         `Atraso na Chegada` > 0)
# Filtrando vôos que tiveram atraso na partida e atraso na chegada

# letra e
dados_final = dados3 %>% 
  mutate(`Atraso Total` = `Atraso na Partida` + `Atraso na Chegada`)
# Criando a variável de atraso total

# letra f
dados %>% 
  rename(Origem = origin,
         Destino = dest,
         `Atraso na Partida` = dep_delay,
         `Atraso na Chegada` = arr_delay,
         `Duração do Vôo` = air_time) %>% 
  arrange(Origem, Destino, `Duração do Vôo`) %>% 
  filter(`Atraso na Partida` > 0,
         `Atraso na Chegada` > 0) %>% 
  mutate(`Atraso Total` = `Atraso na Partida` + `Atraso na Chegada`)


# Exercício 11 ----------------------------------------------------------------

mpg = mpg %>% 
  rename("fabricante" = "manufacturer",
         "modelo" = "model",
         "motor" = "displ",
         "ano" = "year",
         "cilindros" = "cyl",
         "transmissao" = "trans",
         "tracao" = "drv",
         "mpgc" = "cty",
         "mpgr" = "hwy",
         "combustivel" = "fl",
         "tipo" = "class")

# letra a
dados_grafico = mpg %>% 
  select(motor, mpgc, mpgr, tracao, cilindros)
str(dados_grafico)

# letra b
grafico_tracao = dados_grafico %>% 
  ggplot(mapping = aes(x = factor(tracao))) +
  geom_bar(fill = "dodgerblue3") +
  theme_minimal() +
  labs(x = "Tipo de Tração",
       y = "Contagem",
       title = "Gráfico de Barras da Variável Qualitativa",
       subtitle = "Tipo de Tração")
grafico_tracao

grafico_cilindros = dados_grafico %>% 
  ggplot(mapping = aes(x = factor(cilindros))) +
  geom_bar(fill = "dodgerblue3") +
  theme_minimal() +
  labs(x = "Número de Cilindros",
       y = "Contagem",
       title = "Gráfico de Barras da Variável Qualitativa",
       subtitle = "Número de Cilindros")
grafico_cilindros

grid.arrange(grafico_tracao, grafico_cilindros, ncol = 2)

# letra c
grafico_motor = dados_grafico %>% 
  ggplot(mapping = aes(x = motor)) +
  geom_histogram(fill = "dodgerblue3", binwidth = 0.75) +
  theme_minimal() +
  labs(x = "Tamanho do Motor (em litros)",
       y = "Contagem",
       title = "Histograma da Variável Quantitativa",
       subtitle = "Tamanho do Motor (em litros)")
grafico_motor

grafico_mpgc = dados_grafico %>% 
  ggplot(mapping = aes(x = mpgc)) +
  geom_histogram(fill = "dodgerblue3", binwidth = 2) +
  theme_minimal() +
  labs(x = "Milhas por Galão na Cidade",
       y = "Contagem",
       title = "Histograma da Variável Quantitativa",
       subtitle = "Milhas por Galão na Cidade")
grafico_mpgc

grafico_mpgr = dados_grafico %>% 
  ggplot(mapping = aes(x = mpgr)) +
  geom_histogram(fill = "dodgerblue3", binwidth = 2) +
  theme_minimal() +
  labs(x = "Milhas por Galão na Rodovia",
       y = "Contagem",
       title = "Histograma da Variável Quantitativa",
       subtitle = "Milhas por Galão na Rodovia")
grafico_mpgr

grid.arrange(grafico_motor, grafico_mpgc, grafico_mpgr, ncol = 3)

# letra d
grafico_mpgr_tracao = dados_grafico %>% 
  ggplot(mapping = aes(x = factor(tracao), y = mpgr)) +
  geom_boxplot(fill = "dodgerblue3") +
  theme_minimal() +
  labs(x = "Tipo de Tração",
       y = "Milhas por Galão na Rodovia",
       title = "Boxplot da Variável Quantitativa versus Variável Qualitativa")
grafico_mpgr_tracao

grafico_mpgr_cilindros = dados_grafico %>% 
  ggplot(mapping = aes(x = factor(cilindros), y = mpgr)) +
  geom_boxplot(fill = "dodgerblue3") +
  theme_minimal() +
  labs(x = "Número de Cilindros",
       y = "Milhas por Galão na Rodovia",
       title = "Boxplot da Variável Quantitativa versus Variável Qualitativa")
grafico_mpgr_cilindros

grafico_mpgr_motor = dados_grafico %>% 
  ggplot(mapping = aes(x = motor, y = mpgr)) +
  geom_point(color = "dodgerblue3", size = 2) +
  theme_minimal() +
  labs(x = "Tamanho do Motor (em litros)",
       y = "Milhas por Galão na Rodovia",
       title = "Gráfico de Dispersão das Variáveis Quantitativas")
grafico_mpgr_motor

grafico_mpgr_mpgc = dados_grafico %>% 
  ggplot(mapping = aes(x = mpgc, y = mpgr)) +
  geom_point(color = "dodgerblue3", size = 2) +
  theme_minimal() +
  labs(x = "Milhas por Galão na Cidade",
       y = "Milhas por Galão na Rodovia",
       title = "Gráfico de Dispersão das Variáveis Quantitativas")
grafico_mpgr_mpgc

grid.arrange(grafico_mpgr_tracao, grafico_mpgr_cilindros,
             grafico_mpgr_motor, grafico_mpgr_mpgc, ncol = 2)


# Exercício 12 ----------------------------------------------------------------

# letra a
dados_ajuste = mpg %>% 
  select(mpgr, motor, tracao)

# letra b
# Feito na questão 11

# letra c
# Feito na questão 11

# letra d
regressao_motor = lm(formula = mpgr ~ motor,
                     data = dados_ajuste)
summary(regressao_motor)
# Todas as variáveis são significativas

regressao_tracao = lm(formula = mpgr ~ tracao,
                      data = dados_ajuste)
summary(regressao_tracao)
# Todas as variáveis são significativas

regressao_motor_tracao = lm(formula = mpgr ~ motor + tracao,
                            data = dados_ajuste)
summary(regressao_motor_tracao)
# Todas as variáveis são significativas

# letra e
AIC(regressao_motor, regressao_tracao, regressao_motor_tracao)
# O melhor modelo é o que leva em consideração as variáveis
# Tamanho do Motor (em litros) e Tipo de Tração,
# já que esse modelo tem o menor AIC.
