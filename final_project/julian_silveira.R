#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("palmerpenguins")

library(dplyr)
library(ggplot2)
library(palmerpenguins)

?penguins

dados = na.omit(penguins)
dados$year = factor(dados$year)

# 1.

print("Linhas:")
nrow(dados)
print("Colunas")
ncol(dados)

# 2.

print("Mínimo:")
min(dados$body_mass_g)
print("Média:")
mean(dados$body_mass_g)
print("Máximo:")
max(dados$body_mass_g)

# 3.

## a.
colnames(dados)
dados1 = rename(dados, Espécie = species, Ilha = island, "Comprimento do bico (mm)" = bill_length_mm, "Profundidade do bico (mm)" = bill_depth_mm, "Comprimento da nadadeira (mm)" = flipper_length_mm, "Massa (g)" = body_mass_g, Sexo = sex, Ano = year)
dados1

## b.
dados2 = arrange(dados1, `Comprimento do bico (mm)`, `Profundidade do bico (mm)`)
dados2

## c.
dados3 = filter(dados2, Espécie != "Gentoo")
dados3

## d.

dados_final = mutate(dados3, `Razão de bico` = `Comprimento do bico (mm)`/`Profundidade do bico (mm)`)
dados_final

# 4.

## a.

ggplot(dados_final, aes(Espécie)) +
  geom_bar()

ggplot(dados_final, aes(Ilha)) +
  geom_bar()

ggplot(dados_final, aes(Sexo)) +
  geom_bar()

ggplot(dados_final, aes(Ano)) +
  geom_bar()

## b.
colnames(dados_final)
ggplot(dados_final, aes(`Comprimento do bico (mm)`)) +
  geom_histogram()

ggplot(dados_final, aes(`Profundidade do bico (mm)`)) +
  geom_histogram()

ggplot(dados_final, aes(`Comprimento da nadadeira (mm)`)) +
  geom_histogram()

ggplot(dados_final, aes(`Massa (g)`)) +
  geom_histogram()

ggplot(dados_final, aes(`Razão de bico`)) +
  geom_histogram()

# 5.

## a.

ggplot(dados_final, aes(x = Espécie, y = `Massa (g)`)) +
  geom_boxplot()

ggplot(dados_final, aes(x = Ilha, y = `Massa (g)`)) +
  geom_boxplot()

ggplot(dados_final, aes(x = Sexo, y = `Massa (g)`)) +
  geom_boxplot() # Fator significativo

ggplot(dados_final, aes(x = Ano, y = `Massa (g)`)) +
  geom_boxplot()

## b.

ggplot(dados_final, aes(x = `Comprimento do bico (mm)`, y = `Massa (g)`)) +
  geom_point()

ggplot(dados_final, aes(x = `Profundidade do bico (mm)`, y = `Massa (g)`)) +
  geom_point() # Fator significativo

ggplot(dados_final, aes(x = `Comprimento da nadadeira (mm)`, y = `Massa (g)`)) +
  geom_point() # Fator significativo

ggplot(dados_final, aes(x = `Razão de bico`, y = `Massa (g)`)) +
  geom_point()

## c.

print("Sexo, profundidade do bico e comprimento da nadadeira")

# 6.

## a.
attach(dados_final)
reg1 = lm(`Massa (g)` ~ `Sexo`)
reg2 = lm(`Massa (g)` ~ `Profundidade do bico (mm)`)
reg3 = lm(`Massa (g)` ~ `Comprimento da nadadeira (mm)`)

ggplot(dados_final, aes(x = `Sexo`, y = `Massa (g)`)) +
  geom_point() +
  geom_abline(intercept = reg1$coefficients[1], slope = reg1$coefficients[2])

ggplot(dados_final, aes(x = `Profundidade do bico (mm)`, y = `Massa (g)`)) +
  geom_point() +
  geom_abline(intercept = reg2$coefficients[1], slope = reg2$coefficients[2])

ggplot(dados_final, aes(x = `Comprimento da nadadeira (mm)`, y = `Massa (g)`)) +
  geom_point() +
  geom_abline(intercept = reg3$coefficients[1], slope = reg3$coefficients[2])

## b.

reg12 = lm(`Massa (g)` ~ Sexo + `Profundidade do bico (mm)`)
reg13 = lm(`Massa (g)` ~ Sexo + `Comprimento da nadadeira (mm)`)
reg23 = lm(`Massa (g)` ~ `Profundidade do bico (mm)` + `Comprimento da nadadeira (mm)`)
reg123 = lm(`Massa (g)` ~ Sexo + `Profundidade do bico (mm)` + `Comprimento da nadadeira (mm)`)
AIC(reg1, reg2, reg3, reg12, reg13, reg23, reg123)

## c.

t2 = t.test(`Massa (g)`, `Profundidade do bico (mm)`) 
t3 = t.test(`Massa (g)`, `Comprimento da nadadeira (mm)`) 
t2$p.value
t3$p.value

## d.

s123 = summary(reg123)
s123$adj.r.squared
