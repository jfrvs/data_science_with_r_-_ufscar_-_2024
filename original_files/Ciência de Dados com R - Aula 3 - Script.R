# Importando Dados ------------------------------------------------------------
?read.table
?read.delim

# definindo o caminho completo
dados1 = read.delim("~/Ciência de Dados com R/Arquivo1.txt")
dados1
dados2 = read.csv("~/Ciência de Dados com R/Arquivo2.csv")
dados2

# definindo apenas o nome do arquivo
getwd()
setwd("~/Ciência de Dados com R/")
dados1a = read.delim("Arquivo1.txt")
dados1a
dados1b = read.csv("Arquivo2.csv")
dados1b


# Exportando Dados ------------------------------------------------------------

dados1
write.table(dados1, "teste.txt")
write.table(dados1, "teste2.txt", row.names = FALSE)
write.table(dados1, "teste3.txt", row.names = FALSE, col.names = FALSE)

library(openxlsx)
?write.xlsx
write.xlsx(dados1, "teste.xlsx")


# Manipulação de bases de dados -----------------------------------------------

# Instalando pacotes
install.packages("nycflights13")
install.packages("dplyr")

# Carregando pacotes
library(nycflights13)
library(dplyr)

?flights       # documentação

View(flights)
dim(flights)   # dimensão
str(flights)   # estrutura

# Filtrar linhas com filter()

flights[flights$month == 1 & flights$day == 1, ]

filter(flights, month == 1, day == 1)           
filter(flights, dep_delay < 0)

flights %>% filter(month == 1, day == 1)

# Organizar linhas com arrange()

arrange(flights, year, month, day)
arrange(flights, dep_time, sched_dep_time )
arrange(flights, desc(arr_time))

flights %>% filter(month == 1, day == 1) %>% arrange(dep_time)

# Selecionar colunas com select()

names(flights)
select(flights, year, month, day)  # Selecionando as colunas por nome
select(flights, year:day)          # Selecionando todas as colunas entre year e day (inclusive)
select(flights, -(year:day))       # Selecionando todas as colunas exceto year até day (inclusive)

select(flights, 10)
flights[, 10]

# Renomear colunas com rename()

select(flights, year, month, day, num_voo = tailnum)
rename(flights, ano = year, mes = month, dia = day)	

# Adicionar novas colunas com mutate() e transmute()

mutate(flights,
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60
)

mutate(flights,
       gain = arr_delay - dep_delay,
       gain_per_hour = gain / (air_time / 60)
)

transmute(flights,
          gain = arr_delay - dep_delay,
          gain_per_hour = gain / (air_time / 60)
)

# Resumir valores com summarise()

summarise(flights,
          media.do.delay.dep = mean(dep_delay, na.rm = TRUE),
          media.do.delay.arr = mean(arr_delay, na.rm = TRUE),
)

# Operações agrupadas

by_tailnum = group_by(flights, tailnum)

summarise(by_tailnum,
          count = n(),
          dist = mean(distance, na.rm = TRUE),
          delay = mean(arr_delay, na.rm = TRUE))

flights %>%
  group_by(tailnum) %>%
  summarise(count = n(),
            dist = mean(distance, na.rm = TRUE),
            delay = mean(arr_delay, na.rm = TRUE))

destinations = group_by(flights, dest)
summarise(destinations,
          planes = n_distinct(tailnum),
          flights = n()
)

flights %>% group_by(dest) %>% summarise(planes = n_distinct(tailnum), flights = n())

daily = group_by(flights, year, month, day)
voos.diarios = summarise(daily, flights = n())
plot(voos.diarios$flights, type = "l")
plot(c(1, 5, 8, 3))

# Juntando com _join()

id.empregado = 1:11
nome.empregado = c(
  'Renato', 'Miguel', 'Paulo', 'Patrícia', 'Inês', 'Saulo', 'Diego', 'Maria',
  'Jose', 'Julia', 'Tiago')
idade = c(
  30, 31, 29, 30, 25, 30, 30, 35, 24, 31, 29)
uf = c(
  'MG', 'DF', 'CE', 'DF', 'DF', 'DF', 'RJ', 'SP', 'RS', 'SC', 'BA')
id.cargo = c(
  4, 4, 4, 4, 5, 4, 6, 3, 1, 2, 8)

empregados = data.frame(id.empregado, nome.empregado, idade, uf, id.cargo)
empregados

id.cargo = 1:7
nome.cargo = c(
  'Técnico', 'Assistente', 'Consultor', 'Analista', 'Auditor', 'Gerente',
  'Gestor')
salario = c(
  7000, 4000, 15000, 11000, 10000, 13000, 20000)
cargos = data.frame(id.cargo, nome.cargo, salario)
cargos

inner_join(empregados, cargos)

left_join(empregados, cargos)

right_join(empregados, cargos)

full_join(empregados, cargos)

cargos2 = cargos
names(cargos2) = c("cargo", "nome.cargo", "salario") 
names(cargos2)
names(empregados)

full_join(empregados, cargos2)
full_join(empregados, cargos2, by = c("id.cargo" = "cargo"))

# Dica:
# Ctrl + A, Ctrl + I: para identar o código
