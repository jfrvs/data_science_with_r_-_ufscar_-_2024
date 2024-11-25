# install.packages("ggplot2")
library(ggplot2)

# Conjunto de Dados: mpg - Slide 4

?mpg       # documentação
dim(mpg)   # dimensão
str(mpg)   # estrutura

names(mpg) = c("fabricante", "modelo", "motor", "ano", "cilindros",
               "transmissao", "tracao", "mpgc", "mpgr", "combustivel", "tipo")
str(mpg)

# No R Base...

?plot

plot(mpg$motor, mpg$mpgr)

attach(mpg)
plot(motor, mpgr)

plot(motor, mpgr,
     xlab = "Cilindradas",
     ylab = "Milhas por galão")

plot(motor, mpgr,
     xlab = "Cilindradas",
     ylab = "Milhas por galão",
     pch = 16)

plot(motor, mpgr,
     xlab = "Cilindradas",
     ylab = "Milhas por galão",
     pch = 16,
     cex = 1.5)

plot(motor, mpgr,
     xlab = "Cilindradas",
     ylab = "Milhas por galão",
     pch = 16,
     cex = 1.5,
     col = "gray15")

# https://th.bing.com/th/id/R.47a08259a0cd6fb0373f222484993a53?rik=2RGpNtNEe7seRA&riu=http%3a%2f%2frgraphics.limnology.wisc.edu%2fimages%2fmiscellaneous%2fpch.png&ehk=WNAJsqUWgEgNq%2flFZsnUBM%2bPQA2%2fxr0SeXJWPaW9iBA%3d&risl=&pid=ImgRaw&r=0
# https://th.bing.com/th/id/R.6748be4c2bdbee7cb23fd33c6d54f0b2?rik=Zx3yOeMqe1zF%2bw&pid=ImgRaw&r=0

# No ggplot2...

ggplot(data = mpg)

ggplot(data = mpg, mapping = aes(x = motor, y = mpgr)) 

ggplot(data = mpg, mapping = aes(x = motor, y = mpgr)) +
  geom_point()

# Aesthetic Mapping - Slide 5

ggplot(data = mpg, mapping = aes(x = motor, y = mpgr, colour = tipo)) +
  geom_point()

ggplot(mpg, aes(motor, mpgr, colour = tipo)) +
  geom_point()

ggplot(data = mpg, mapping = aes(x = motor, y = mpgr)) +
  geom_point(aes(colour = tipo))

ggplot(data = mpg, mapping = aes(x = motor)) +
  geom_point(mapping = aes(y = mpgr, colour = tipo))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = motor, y = mpgr, colour = tipo))

# Utilizando uma variaável numérica para preenchimento

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = motor, y = mpgr, color = cilindros))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = motor, y = mpgr, color = mpgc))

# E se eu quiser colocar todos de uma cor só?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = motor, y = mpgr, color = "blue"))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = motor, y = mpgr), color = "blue")

ggplot(data = mpg, mapping = aes(x = motor, y = mpgr)) + 
  geom_point(color = "blue")

# Podemos de mudar o símbolo dos pontos também

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = motor, y = mpgr, shape = tipo))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = motor, y = mpgr, shape = tipo, colour = tipo))

# Fazendo algumas modificações...

ggplot(mpg, aes(motor, mpgr, colour = tipo)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme(legend.position = "none")

ggplot(mpg, aes(motor, mpgr)) +
  geom_point(aes(colour = tipo)) +
  geom_smooth(method = "lm", se = FALSE) +
  theme(legend.position = "none")

# Gráfico de Barras

table(cilindros) # ver a quantidade

barplot(table(cilindros))
plot(factor(cilindros))

?geom_bar

ggplot(mpg, aes(cilindros))

ggplot(mpg, aes(cilindros)) +
  geom_bar()

ggplot(mpg, aes(factor(cilindros))) +
  geom_bar()

ggplot(mpg, aes(factor(cilindros))) +
  geom_bar(colour = "deepskyblue")

ggplot(mpg, aes(factor(cilindros))) +
  geom_bar(colour = "deepskyblue", fill = "deepskyblue3")

ggplot(mpg, aes(factor(cilindros))) +
  geom_bar(colour = "deepskyblue", fill = "deepskyblue3", size = 2)

ggplot(mpg, aes(factor(cilindros))) +
  geom_bar(colour = "deepskyblue", fill = "deepskyblue3", size = 2, alpha = 0.5)

table(ano)

ggplot(mpg, aes(factor(ano))) +
  geom_bar()

ggplot(mpg, aes(factor(ano), fill = factor(cilindros))) +
  geom_bar()

ggplot(mpg, aes(factor(cilindros), fill = factor(ano))) +
  geom_bar()

ggplot(mpg, aes(factor(cilindros), fill = factor(ano))) +
  geom_bar() +
  xlab("Número de Cilindros") +
  ylab("Contagem") + 
  ggtitle("Contagem de carros com diferentes número de cilindros",
          subtitle = "nos anos de 1999 e 2008") +
  theme(legend.position = "bottom")

ggplot(mpg, aes(x = factor(cilindros))) +
  geom_bar(color = "red", size = 1, fill = "pink") +
  facet_wrap(~ ano)

ggplot(mpg, aes(x = factor(ano), fill = factor(tracao))) +
  geom_bar() +
  facet_wrap(~ cilindros)

ggplot(mpg, aes(factor(cilindros), fill = factor(ano))) +
  geom_bar() +
  ggtitle("Contagem de carros com diferentes número de cilindros") +
  xlab("Número de Cilindros") +
  ylab("Contagem") +
  theme(legend.position = "bottom") + 
  theme(legend.text = element_text(face = "bold")) +
  guides(fill = guide_legend(title = "Anos")) +
  scale_fill_brewer(palette = "YlOrRd")

# https://th.bing.com/th/id/R.ff8d7d9d213a1efcf6e6bbfb1cd516a6?rik=bdkYm0depkqN8w&pid=ImgRaw&r=0

# Gráficos de Pontos

plot(ano, cilindros)

# geom_jitter: um atalho conveniente para geom_point(position = jitter).
# O comando adiciona uma pequena quantidade de variação aleatória 
# localização de cada ponto, é uma forma útil de lidar com o overplottig (excesso de pontos em uma mesma localidade) causado por dados discretos.

str(mpg)
mpg$ano = factor(mpg$ano)
mpg$cilindros = factor(mpg$cilindros)
str(mpg)

plot(ano, motor)

ggplot(mpg, aes(ano, motor)) +
  geom_jitter()

ggplot(mpg,aes(ano, motor)) +
  geom_jitter(width = 0.2, size = 3, color = "red")

ggplot(mpg,aes(ano, motor, color = ano)) +
  geom_jitter(width = 0.3, size = 3) +
  coord_flip()

ggplot(mpg, aes(ano, motor, color = cilindros)) +
  geom_jitter(size = 4, width = 0.2) +
  scale_colour_brewer(palette = "Spectral")

ggplot(mpg, aes(ano, motor, color = cilindros)) +
  geom_jitter(size = 4, width = 0.2) +
  scale_colour_brewer(palette = "BrBG") #OrRd,Dark2,BrBG

ggplot(mpg, aes(ano, motor, color = cilindros, shape = tracao)) +
  geom_jitter(size = 2, width = 0.2, alpha = 0.8) +
  scale_colour_brewer(palette = "BrBG")

# Gráficos de Dispersão

ggplot(mpg, aes(x = motor, y = mpgr)) +
  geom_point()

ggplot(mpg, aes(x = mpgc, y = mpgr)) + 
  geom_point()

ggplot(mpg, aes(x = mpgc, y = mpgr, size = motor)) + 
  geom_point(alpha = 0.5)

ggplot(mpg, aes(x = mpgc, y = mpgr, size = motor, shape = ano, color = tipo)) +
  geom_point(alpha = 0.5)

ggplot(mpg, aes(x = mpgc, y = mpgr, size = motor, color = tipo, shape = ano)) +
  geom_point(alpha = 0.5) +
  scale_colour_brewer(palette = "OrRd")

ggplot(mpg, aes(x = mpgc, y = mpgr, size = motor, shape = ano, color = tipo)) + 
  geom_point(alpha = 0.5) +
  facet_wrap(~ cilindros)

# Densidades

hist(motor)

ggplot(mpg, aes(motor)) +
  geom_density()

ggplot(mpg, aes(motor, fill = ano)) +
  geom_density(alpha = 0.4, color = "black")

ggplot(mpg, aes(motor, fill = ano)) +
  geom_density(alpha = 0.4, color = "black") +
  facet_wrap(~ cilindros)

# Histogramas

hist(motor)

ggplot(mpg, aes(motor)) +
  geom_histogram()

ggplot(mpg, aes(motor)) +
  geom_histogram(binwidth = 0.8, color = "black", fill = "red")

ggplot(mpg,aes(motor, color = cilindros, fill = cilindros)) +
  geom_histogram(binwidth = 0.6, alpha = 0.8) +
  facet_wrap(~ ano)

ggplot(mpg, aes(motor)) +
  geom_histogram(binwidth = 0.6, color = "black", fill = "red") +
  facet_wrap(~ ano + cilindros)

# Boxplots

boxplot(mpgr)
boxplot(mpgr ~ tipo)

ggplot(data = mpg, aes(x = tipo, y = mpgr)) +
  geom_boxplot()

ggplot(data = mpg, aes(x = tipo, y = mpgr)) +
  geom_boxplot(aes(fill = tipo))

p <- ggplot(mpg, aes(tipo, mpgr))

p + geom_boxplot()

p + geom_boxplot() + geom_jitter(width = 0.2)

p + geom_boxplot() + coord_flip()

p + geom_boxplot(notch = TRUE)

p + geom_boxplot(varwidth = TRUE)

p + geom_boxplot(fill = "white", colour = "#3366FF")

p + geom_boxplot(outlier.colour = "red", outlier.shape = 1)

p + geom_boxplot(aes(colour = tracao))

# Juntando gráficos

# install.packages("gridExtra")
library(gridExtra)

# Explorando temas:
# theme_gray()
# theme_bw()
# theme_linedraw()
# theme_light()
# theme_dark()
# theme_minimal()
# theme_tipoic()
# theme_void()
# theme_test()

# Podemos usar o theme_set ou diretamente no gráfico
# theme_set(theme_gray())

g1 <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = motor, y = mpgr)) +
  ggtitle("Tema Default")

g2 <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = motor, y = mpgr)) +
  theme_bw() +
  ggtitle("Tema bw")

g3 <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = motor, y = mpgr)) +
  theme_light() +
  ggtitle("Tema light")

g4 <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = motor, y = mpgr)) +
  theme_minimal() +
  ggtitle("Tema minimal")

grid.arrange(g1, g2, g3, g4, ncol = 2)

# Escalas: as funções scale servem para modificar eixos e preenchimentos.

theme_set(theme_minimal())

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = motor, y = mpgr)) +
  scale_x_reverse()

# Usando ggplot sem `data.frame`

x = rnorm(30)
y = 3 + 2.5*x + rnorm(30, 0, 2)

ggplot(data = NULL) +
  geom_point(aes(x = x, y = y)) +
  geom_abline(intercept = 3, slope = 2.5, color = "red")
