# Operações Básicas -----------------------------------------------------------

10 + 2
50 - 3
5 * 3
59 / 3
10^2
9 / 3
9 %% 3
9 %% 2
10 / 3
10 %/% 3
10 / 3; 10 %% 3; 10 %/% 3


# Funções do R Base  ----------------------------------------------------------

# CTRL + F: abre a barra de pesquisa
# Session > Set Working Directory > Choose Directory: muda o diretório
help(setwd)
?setwd
setwd("/home/isouza/Ciência de Dados com R")
getwd() # mostra o diretório de trabalho
dir() # lista todos os arquivos na pasta de trabalho atual
ls() # lista o nome dos objetos criados na sessão atual
search() # lista todos os pacotes carregados
# install.packages("ggplot2") # para instalar pacote
library() # ativa biblioteca/pacote instalado
rm() # remove os objetos entre parênteses
# rm(list=ls()) # remove todos os objetos, limpando a memória


# Funções Mátemáticas do R  ---------------------------------------------------

sqrt(9)
abs(-2)
exp(1)
log(10)
log(10, base = 10)
factorial(10)

# Criando Objetos -------------------------------------------------------------

x = 10
x2 = 10
Curso2022 = 100
curso2022 = 100
curso.2022 = 100
curso_2022 = 100


# Classes de Objetos ----------------------------------------------------------

v = TRUE
f = FALSE
n = 134L
p = "3"
d = 3.2

n + d
n + p
n + v
n + f
n - v
n - f

as.numeric(v)
as.numeric(f)
as.numeric("palavra")

as.character(v)
as.character(d)


# Criando Vetores -------------------------------------------------------------

?c
c(1, 4, -0.3, 9)
vetor_numerico = c(1, 4, -0.3, 9) # vetor numérico
vetor_numerico
class(vetor_numerico)

vetor_logico = c(TRUE, FALSE, TRUE) # vetor lógico
vetor_logico
class(vetor_logico)

vetor_logico2 = c(vetor_logico, vetor_numerico)
vetor_logico2
class(vetor_logico2)

vetor_caracter = c("oi", "olá", "tchau") # vetor de caracteres
vetor_caracter
class(vetor_caracter)

vetor_caracter2 = c(vetor_caracter, vetor_logico, vetor_numerico)
vetor_caracter2
class(vetor_caracter2)

# character > numeric > logical


# Manipulando Vetores ---------------------------------------------------------

vetor_numerico
vetor_numerico[1] # primeiro elemento do vetor
vetor_numerico[4]
vetor_numerico[5] # quinto elemento do vetor
vetor_numerico[-1] # vetor sem o primeiro elemento
vetor_numerico[-4]
length(vetor_numerico)
vetor_numerico[length(vetor_numerico)]
vetor_numerico[-length(vetor_numerico)] # vetor sem o último elemento
vetor_numerico[c(1, 4)]
vetor_numerico[-c(1, 4)]
vetor_numerico[c(-1,-4)]

vetor_numerico[1] = NA # primeiro elemento recebe um missing
vetor_numerico[c(1, 2)] = c(2, 4) # trocando os dois primeiros elementos
vetor_numerico[c(1, 2)] = c(2, 4, 5) # não funciona!!
vetor_numerico[5] = 5 # adicionando um elemento na quinta posição do vetor
vetor_numerico[10] = 10
vetor_numerico*1000
sqrt(vetor_numerico)


# Criando Vetores -------------------------------------------------------------

c(-10, -9, -8, -7)
-10:10
1:10
?seq
seq(from = 1, to = 10)
seq(1, 10)
seq(from = 1, to = 10, by = 2)
seq(from = 5, to = 15, length = 3)
seq(from = 5, to = 15, length = 1000)

x = seq(0, 10, length = 100)
y = sqrt(x)
plot(x, y)
plot(x, y, type = "l")


# Criando Vetores -------------------------------------------------------------

?rep
rep(0)
rep(0, times = 4)
rep(0, times = 50)
rep(c(1, 2, 3), times = 4)
rep(c(1, 3), times = c(8, 9))
rep(c(1, 4), each = 5)
rep(1:4, each = 2, times = 3)
rep(c("a", "b"), times = 10)


# Operações com Vetores -------------------------------------------------------

x = c(2, 7, 5, 13, NA, 1)
length(x) # tamanho do vetor x

sort(x) # ordena x em ordem crescente
sort(x, na.last = TRUE)

rank(x) # posições de cada elemento do vetor x ordenado

round(x + 0.357, digits = 2) # arredonda os valores do vetor x

min(x) # elemento de valor mínimo de x
max(x) # elemento máximo de x
min(x, na.rm = TRUE) # elemento de valor mínimo de x, removendo NA (caso exista)
max(x, na.rm = TRUE) # elemento máximo de x, removendo NA (caso exista)

which.min(x)
which.max(x) # posição do mínimo e do máximo
x[which.min(x)]
x[which.max(x)]

sum(x) # somatório dos elementos de x
sum(x, na.rm = TRUE) # somatório dos elementos de x, removendo NA (caso exista)

prod(x) # produtório dos elementos de x
prod(x, na.rm = TRUE) # produtório dos elementos de x, removendo NA (caso exista)

unique(x) # vetor com elementos não repetidos de x
unique(vetor_logico)
y = rep(c(1, 2), each = 30)
unique(y)

rev(x) # inverte a ordem do vetor x


# Comparando números ----------------------------------------------------------

3 == 2
3 != 2
3 > 2
3 < 2
3 >= 2
3 <= 2

x >= 6
x[c(2, 4)]
x[x >= 6] # elementos de x maiores ou iguais a 6
?which
which(x >= 6) # posição dos elementos de x maiores ou iguais a 6
x[which(x >= 6)]

x2 = rep(c(3, 1, 2), times = 4)
sqrt(sort(unique(x2)))


# Criando Matrizes ------------------------------------------------------------

?matrix
matrix()
matrix(data = 1, nrow = 2, ncol = 3)
1:6
matrix(data = 1:6)
matrix(data = 1:6, nrow = 2, ncol = 3)
matrix(data = 1:6, nrow = 2, ncol = 3, byrow = TRUE)
matrix(data = 1:6, nrow = 2, ncol = 1)
matrix(data = 1:6, nrow = 2, ncol = 5)

matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3, byrow = TRUE)
matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3, byrow = TRUE,
       dimnames = list(c("row1", "row2"),
                       c("C1", "C2", "C3")))

matrix(1:16, nrow = 8)
matrix(1:21, ncol = 7)
matrix(1:21, ncol = 8)

m = matrix(1:16, nrow = 4, ncol = 4) # matriz 4x4 ↓
m
m = matrix(1:16, nrow = 4, ncol = 4, byrow = TRUE) # matriz →
m
m[1, 1]
m[1, 4]
m[ , ]
m[1, ]
m[1:2, ]
m[3:4, ]
m[5, ]
m[ , 1]
m[, 1:2]
m[-1, ]
m[ , -1]
m[-2, -3]
m[c(1, 3), ]
m[ , c(1, 3)]
m[1:2, 1:3]

?diag
diag(4, 6)
diag(x = 4, nrow = 6)
diag(x = 4, nrow = 6, ncol = 10)
diag(x = 4, nrow = 10, ncol = 4)
diag(c(9, 5, 11))
diag(c(9, 5, 11), nrow = 3, ncol = 3)
diag(1:10)

?cbind
?rbind
cbind(1, 2, 3, 4)
rbind(1, 2, 3, 4)

M1 = matrix(1, 2, 2)
M1
M2 = cbind(M1, c(2, 3))
M2
cbind(M1, 2)
cbind(M1, NA)
cbind(M1, c(2, 3, 4))

M3 = cbind(M1, M2)
M3
cbind(M2, M1)

M4 = rbind(M1, c(2, 3))
M4
M5 = rbind(M1, M4)
M5

rbind(M1, c(2, 3))
rbind(M1, 2, 3)


# Operações com Matrizes ------------------------------------------------------

A = matrix(1:4, nrow = 2, ncol = 2)
A
B = matrix(5:8, nrow = 2, ncol = 2)
B

length(A)
dim(A) # dimensão da matriz A
dim(M4)
nrow(A)
ncol(A)

2 * A # multiplicação de todos os elementos por 2
A * B # multiplicação matricial elemento a elemento
A * M4

A %*% B # multiplicação matricial

det(A) # determinante de da matriz A
t(A) # transposta da matriz A
solve(A) # inversa da matriz A
eigen(A) # autovalores e autovetores da matriz A
A^(-1) # valor inverso de cada elemento da matriz A
1/A
1 + A
10 - A
A + M4
A + B

sum(vetor_numerico)
sum(A)
rowSums(A) # calcula a soma de cada linha e de cada
colSums(A)

rowMeans(A) # calcula a média de cada linha e de cada
colMeans(A)


# Criando DataFrames ----------------------------------------------------------

?data.frame

data.frame(1:10)
data.frame(c(1, 2, 3))
data.frame(1, 2, 3, 10)
data.frame(1:10, 11:20, 3)
data.frame(1:10, 11:20, 3:6)
data.frame(1:10, 1:10, 1:10)

dados = data.frame(c(27, 18, 23), c("Ana", "Eva", "Mel")) # criando um DataFrame
dados
names(dados) = c("Idade", "Nome") # nomeando as colunas do DataFrame
colnames(dados)
dados

dados = data.frame(Idade = c(27, 18, 23),
                   Nome = c("Ana", "Eva", "Mel")) # criando um DataFrame de outra maneira
dados

dados[, 1]
dados$Idade
dados$Nome

dados[1, ]

sum(dados$Idade)
idade = dados$Idade
sum(idade)

?attach
attach(dados) # cria variáveis com os nomes das colunas do DataFrame
Idade
Nome


# Criando Listas --------------------------------------------------------------

?list
list()
list(1)
list(1, 2)
list(1:4, 2:8)

lista = list(c(1, 2, 3), matrix(1, 4, 3), "compras") # lista com diferentes objetos
lista

lista[[1]] # acessa o primeiro objeto
lista[[2]]
lista[[3]]

lista[1] # acessa o primeiro objeto, mas como uma lista

lista = list(a = c(1, 2, 3),
             b = matrix(1, 4, 3),
             c = "compras") # lista com diferentes objetos nomeados
lista
lista[[1]]
lista$a # objeto chamado a
lista$c

names(lista) = c("X1", "X2", "X3")
lista


# Comandos if, else if e else  ------------------------------------------------

x1 = 5; x2 = 10
x1 == x2
x1 != x2
x1 < x2
x1 <= x2
x1 > x2
x1 >= x2

print("Olá!")
a = 500
b = 200
if (b >= a) {
  print("b é maior ou igual a a")
}

x = 6
if (x == 6) {
  print("Aehhh! Hexa!")
}

a = 190
b = 200
if (b >= a) {
  print("b é maior ou igual a a")
} else{
  print("b é menor que a")
}

x = 5
if (x == 6) {
  print("Aehhh! Hexa!")
} else {
  print("Poxa...")
}

a = 330
b = 200
if (b > a) {
  print("b é maior que a")
} else if (a == b) {
  print("b é igual a a")
} else{
  print("b é menor que a")
}

x = 10
if (x == 6) {
  print("Hexacampeão!")
} else if (x == 5) {
  print("Pentacampeão!")
} else if (x == 4) {
  print("Tetracampeão!")
} else if (x == 3) {
  print("Tricampeão!")
} else if (x == 2) {
  print("Bicampeão!")
} else if (x == 1) {
  print("Campeão!")
} else{
  print("Poxa...")
}


x = 5
x >= 3
x < 7
(x >= 3) & (x < 7)
(x >= 3) | (x < 7)

if ((x >= 3) & (x < 7)) {
  print("Aluno vai pra final!")
} else{
  print("Aprovado ou reprovado?")
}

x = 1
if (x >= 7) {
  print("Aprovado")
} else if (x >= 3) {
  print("Aluno vai pra final!")
} else {
  print("Reprovado")
}

x = 1
if (x >= 7) {
  resultado = "Aprovado"
} else if (x >= 3) {
  resultado = "Aluno vai pra final!"
} else {
  resultado = "Reprovado"
}
resultado


# For -------------------------------------------------------------------------

for (contador in 1:10) {
  print(contador)
}

notas = c(7, 9, 0, 3, 4)
for (x in notas) {
  print(x)
}

for (x in notas) {
  if (x >= 7) {
    print("Aprovado")
  } else if (x >= 3) {
    print("Aluno vai pra final!")
  } else {
    print("Reprovado")
  }
}

resultado = c()
for (x in notas) {
  if (x >= 7) {
    resultado = c(resultado, "Aprovado")
  } else if (x >= 3) {
    resultado = c(resultado, "Aluno vai pra final!")
  } else {
    resultado = c(resultado, "Reprovado")
  }
}
data.frame(notas, resultado)


# Apply -----------------------------------------------------------------------

x = cbind(x1 = 3, x2 = c(4:1, 2:5))
rownames(x) = letters[1:8]
x
is.matrix(x)
is.data.frame(x)

apply(x, 2, sum)
apply(x, 2, mean)
apply(x, 2, sqrt)

apply(x, 1, sum)
apply(x, c(1, 2), sum)

(col.sums = apply(x, 2, sum))
(row.sums = apply(x, 1, sum))
rowSums(x)
colSums(x)


# Criando Funções -------------------------------------------------------------

x = 3
y = x^2
y

quadrado = function(x){
  y = x^2
  return(y)
}
quadrado(3)
quadrado(1:10)
quadrado(matrix(1:4, ncol = 2, byrow = TRUE))

quadrado2 = function(x){ # função sem return
  x^2
}
quadrado2(1:10)
# quadrado2()

quadrado3 = function(x = 1:5){ # função com argumento default
  x^2
}
quadrado3(1:10)
quadrado3()

quadrado4 = function(){ # função sem argumento
  10^2
}
quadrado4()
quadrado4(1)

# Criando uma função com 3 argumentos
nova_funcao = function(a, b, c) {
  a * b + c
}

# Chamando a função pela posição dos argumentos
nova_funcao(5, 3, 11)
nova_funcao(11, 5, 3)

# Chamando a função pelo nome dos argumentos
nova_funcao(b = 3, c = 11, a = 5)

f = function(x){
  soma_linhas = rowSums(x)
  soma_colunas = colSums(x)
  dobro = 2*x
  list(soma_linhas = soma_linhas, soma_colunas = soma_colunas, dobro = dobro)
}

f(A)

# Para ler um script em R, use a função source
source("funcoes.R")
f(matrix(1:4, ncol = 2))
