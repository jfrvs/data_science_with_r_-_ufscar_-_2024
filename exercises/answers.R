# 1.

nome = "Julian"
idade = 32
ano = 1992
r = TRUE

print(idade + ano)
print("Soma de valores inteiros.")

print(ano + r)
print("o Booleano r é tratado como inteiro, e somado a outro valor inteiro.")

print(idade - r)
print("o Booleano r é tratado como inteiro, e subtraído de outro valor inteiro.")

print(r*nome)
print("Erro levantado: Error in r * nome : non-numeric argument to binary operator.")

print(rep(nome, idade))
print("Cria uma lista de tamanho idade com o nome em cada posição.")

# 2.

x = seq(from = -4, to = 4, length = 10)
y = x^2
plot(x, y)

# 3.

x = seq(from = -4, to = 4, length = 1000)
y = x^2
plot(x, y)
print("Maior densidade de pontos.")

# 4.

s = seq(0, 1000, by=30)
print(which(s == 510))
print(length(s))
print(s[length(s)] - s[20])
print(sum(s)/length(s))

# 5.

w = c(5, 10, 50, 30, 1, 0, 2, 300, 100, 60)
w = sort(w)
w = w[-1]
w = w[-length(w)]
w = rev(w)
print(w)

# 6.

frutas = matrix(c("ma¸c~a", "banana", "cereja", "laranja", "uva", "abacaxi", 
                  "pera", "mel~ao", "figo"), nrow = 3, ncol = 3)
print(frutas[2, 2])
print(frutas[,2])
print(frutas[c(1, 3), c(1, 3)])
print(rbind(cbind(frutas, c("manga", "melancia", "acerola")), c("carambola", "caqui", "morango", "pitaya")))

# 7.

if (idade >= 60) {
  print("idoso")
} else if (idade >= 18) {
  print("adulto")
} else {
  print("menor de idade")
}

# 8.

verificar_idade = function(idade){
  if (idade >= 60) {
    return("idoso")
  } else if (idade >= 18) {
    return("adulto")
  } else {
    return("menor de idade")
  }
}

verificar_idade(12)
verificar_idade(17)
verificar_idade(20)
verificar_idade(57)
verificar_idade(90)

# 9.

dados1 = data.frame(Treino = c("Forca", "Resistencia", "Outro"),
                     Pulso = c(100, 150, 120), Duracao = c(60, 30, 45))
dados2 = data.frame(Passos = c(3000, 6000, 2000), Calorias = c(300, 400, 300))
dados1
dados2
dados = cbind(dados1, dados2)
dados
mean(dados$Calorias)
mean(dados$Pulso)
dados = dados[-1,-3]

# 10.

install.packages("pillar")
install.packages("dplyr")
install.packages("nycflights13")
library(pillar)
library(dplyr)
library(nycflights13)
flights
dados = select(flights, month, day, dep_time, sched_dep_time, arr_time, sched_arr_time)
dados1 = rename(dados, "Mês"=month, "Dia"=day, "Saída Real"=dep_time, "Saída Programada"=sched_dep_time, "Chegada Real"=arr_time, "Chegada Programada"=sched_arr_time)
dados2 = filter(dados1, `Saída Real` == 517)
dados
