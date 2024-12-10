# Exemplo 1 -------------------------------------------------------------------

# Lendo os Dados

x = c(83.0, 88.5, 88.2, 89.5, 96.2, 98.1, 99.0, 100.0, 101.2, 104.6, 108.4,
      110.8, 112.6, 114.2, 115.7, 116.9)
y = c(60323, 61122, 60171, 61187, 63221, 63639, 64989, 63761, 66019, 67857,
      68169, 66513, 68652, 69564, 69331, 70561)
length(x)

# Análise Exploratória
library(ggplot2)

ggplot(data = NULL, aes(x = x)) +
  geom_histogram(binwidth = 5) +
  labs(x = "Inflação",
       y = "Contagem")

ggplot(data = NULL, aes(y = x)) +
  geom_boxplot() +
  labs(y = "Inflação")

ggplot(data = NULL, aes(x = y)) +
  geom_histogram(binwidth = 2500) +
  labs(x = "Número de Empregos",
       y = "Contagem")

ggplot(data = NULL, aes(y = y)) +
  geom_boxplot() +
  labs(y = "Número de Empregos")

ggplot(data = NULL, aes(x = x, y = y)) + 
  geom_point() +
  xlab("Inflação (x)") + 
  ylab("Número de Empregos (y)")

# Ajustando uma Regressão Linear Simples
?lm
lm(y ~ x)
# y = 33183 + 316x

# Extraindo os coeficientes
# beta0 = 33183
# beta1 = 316

reg = lm(y ~ x)
reg

names(reg)
reg$coefficients

betas = reg$coefficients
betas

beta0 = betas[1]
beta0
beta1 = betas[2]
beta1

# Analisando os resultados
ggplot(data = NULL, aes(x = x, y = y)) + 
  geom_point()  +
  xlab("Inflação (x)") + 
  ylab("Número de Empregos (y)") +
  geom_abline(intercept = beta0, slope = beta1)

ggplot(data = NULL, aes(x = x, y = y)) + 
  geom_point()  +
  xlab("Inflação (x)") + 
  ylab("Número de Empregos (y)") +
  geom_abline(intercept = beta0, slope = beta1, size = 3, color = "blue")

ggplot(data = NULL, aes(x = x, y = y)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

ggplot(data = NULL, aes(x = x, y = y)) + 
  geom_point()  +
  xlab("Inflação (x)") + 
  ylab("Número de Empregos (y)") +
  geom_abline(intercept = beta0, slope = beta1, size = 3, color = "blue") +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed", color = "white")

# Erro e
beta0 + beta1*105
# y = beta0 + beta1*x + e

y
beta0 + beta1*x
reg$fitted.values

y - (beta0 + beta1*x)
reg$residuals

# Teste de Hipóteses sobre os Coeficientes do Modelo
reg
summary(reg)

# Exemplo 2 -------------------------------------------------------------------

# Vamos considerar uma base de dados do custo com seguro de saude por idade
# para 9 tempos observados

# Lendo a base de dados
dados0 = read.table(file = "dadosCusto.txt", dec = ".", head = TRUE)

# Verificando a quantidade de linhas e colunas
dim(dados0)

# Avaliando a estrutura dos dados
str(dados0)

# Temos 5 colunas no nosso conjunto de dados. Sao elas:
# *gastos*: valores gastos com pagamento de servicos de planos de saude para uma empresa ficticia
# *idade*: idade dos segurados
# *tempo*: tempo em que os dados foram obtidos
# *expostos*: numero de expostos (vidas) em cada grupo de risco
# *sinistros*: numero de sinistros para cada grupo de risco

# Vamos considerar dados somente ate a idade de 75 anos
# pois para outras idades temos poucos dados e muita variabilidade.

ggplot(data = dados0, aes(x = idade, y = gastos)) +
  geom_point()

# Filtrando os dados
library(dplyr)
dados = filter(dados0, idade < 76)
View(dados)
dim(dados)

# Adicionando uma nova variavel
ggplot(data = dados, aes(x = gastos)) +
  geom_histogram(binwidth = 50000)

dados = mutate(dados, log.gastos = log(gastos))
View(dados)

ggplot(data = dados, aes(x = log.gastos)) +
  geom_histogram(binwidth = 0.75)

# Verificando a quantidade de linhas e colunas
dim(dados)

n = nrow(dados) # numero de observacoes

attach(dados) # fazendo o R ler cada uma das variaveis da base

# Agora, vamos fazer uma analise exploratoria dos dados, avaliando a relacao entre as variaveis.
# No contexto dessa base de dados, podemos ter interesse em explicar os gastos!
# Na verdade, vamos explicar o log dos gastos!

# Vamos entao fazer a analise exploratoria!

names(dados)

# Queremos explicar o log.gastos através de:
# - idade
# - tempo
# - expostos
# - sinistros

# Explorando a idade
unique(idade)
ggplot(data = dados, aes(x = idade, y = log.gastos)) +
  xlab("Idade") +
  ylab("Log dos Gastos") +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

reg1 = lm(log.gastos ~ idade)
summary(reg1)
# a princípio, a variável idade, é importante para o modelo

# Explorando a idade^2
dados = mutate(dados, idade2 = idade^2)
attach(dados)

ggplot(data = dados, aes(x = idade2, y = log.gastos)) +
  xlab("Idade") +
  ylab("Log dos Gastos") +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

reg.idade2 = lm(log.gastos ~ idade + idade2)
summary(reg.idade2)
# a princípio, a variável idade, é importante para o modelo

# Explorando o tempo
unique(tempo)
ggplot(data = dados, aes(x = factor(tempo), y = log.gastos)) +
  geom_point()

ggplot(data = dados, aes(x = factor(tempo), y = log.gastos)) +
  xlab("Tempo") +
  ylab("Log dos Gastos") +
  geom_boxplot()

reg2 = lm(log.gastos ~ tempo)
summary(reg2)
# a princípio, a variável tempo, é importante para o modelo

# Explorando o expostos
ggplot(data = dados, aes(x = expostos, y = log.gastos)) +
  xlab("Expostos") +
  ylab("Log dos Gastos") +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

reg3 = lm(log.gastos ~ expostos)
summary(reg3)
# a princípio, a variável expostos, é importante para o modelo

# Explorando o sinistros
ggplot(data = dados, aes(x = sinistros, y = log.gastos)) +
  xlab("Sinitros") +
  ylab("Log dos Gastos") +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

reg4 = lm(log.gastos ~ sinistros)
summary(reg4)
# a princípio, a variável sinistros, é importante para o modelo

# Comparação de modelos
AIC(reg1, reg.idade2, reg2, reg3, reg4)

# Vamos ajustar modelos de regressao linear múltipla!

ggplot(data = dados, aes(x = factor(tempo), y = idade)) +
  geom_boxplot()

ggplot(data = dados, aes(x = factor(tempo), y = expostos)) +
  geom_boxplot()

ggplot(data = dados, aes(x = factor(tempo), y = sinistros)) +
  geom_boxplot()
# tempo e (expostos e sinistros) não podem ser incluidos juntos no modelo

ggplot(data = dados, aes(x = idade, y = expostos)) +
  geom_point()

ggplot(data = dados, aes(x = idade, y = sinistros)) +
  geom_point()

ggplot(data = dados, aes(x = expostos, y = sinistros)) +
  geom_point()
# expostos e sinistros não podem ser incluidos juntos no modelo

reg.multipla = lm(log.gastos ~ idade + tempo + expostos + sinistros)
summary(reg.multipla)

reg.multipla1 = lm(log.gastos ~ tempo + expostos + sinistros)
summary(reg.multipla1)

reg.multipla2 = lm(log.gastos ~ tempo + sinistros)
summary(reg.multipla2)

reg.multipla3 = lm(log.gastos ~ idade + idade2 + tempo + expostos + sinistros)
summary(reg.multipla3)

mit = lm(log.gastos ~ idade + tempo)
mie = lm(log.gastos ~ idade + expostos)
mis = lm(log.gastos ~ idade + sinistros)
miit = lm(log.gastos ~ idade + idade2 + tempo)
miie = lm(log.gastos ~ idade + idade2 + expostos)
miis = lm(log.gastos ~ idade + idade2 + sinistros)
summary(miis)

# Comparamos modelos através do AIC
# Escolhemos o modelo que fornece o menor valor desse critério!
AIC(reg.multipla, reg.multipla1, reg.multipla2, reg.multipla3,
    reg1, reg2, reg3, reg4,
    mit, mie, mis, miit, miie, miis)

# R-quadrado ajustado (Adjusted R-squared)
# Quantos por cento da variável y é explicado pelas demais variáveis
# Quanto mais próximo de 1, melhor!
