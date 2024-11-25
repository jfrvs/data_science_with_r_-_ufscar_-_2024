# Importando Dados ------------------------------------------------------------
?read.table
getwd()

# Concatenando characters
?paste

paste("/home/isouza/",
      "Ciência de Dados com R/Arquivo1.txt",
      sep = "")

paste0("/home/isouza/",
       "Ciência de Dados com R/Arquivo1.txt")

file.path("/home",
          "isouza",
          "Ciência de Dados com R",
          "Arquivo1.txt")

# definindo o caminho completo
dados1 = read.delim("/home/isouza/Ciência de Dados com R/Arquivo1.txt")
dados1
dados2 = read.csv("/home/isouza/Ciência de Dados com R/Arquivo2.csv")
dados2

# definindo apenas o nome do arquivo
getwd()
setwd("~/Ciência de Dados com R")
dados1a = read.delim("Arquivo1.txt")
dados1a
dados1b = read.csv("Arquivo2.csv")
dados1b


# Exportando Dados ------------------------------------------------------------

dados1
write.table(dados1, "teste.txt")
write.table(dados1, "teste2.txt", row.names = FALSE)
write.table(dados1, "teste3.txt", row.names = FALSE, col.names = FALSE)

# install.packages("openxlsx")
library(openxlsx)
?write.xlsx
write.xlsx(dados1, "teste.xlsx")


# Manipulação de bases de dados -----------------------------------------------

# Instalando pacotes
# install.packages("nycflights13")
# install.packages("dplyr")

# Carregando pacotes
library(nycflights13)
library(dplyr)

?flights       # documentação

View(flights)
dim(flights)   # dimensão
str(flights)   # estrutura
?str


# Filtrar linhas com filter()

flights$month == 1 & flights$day == 1
flights[flights$month == 1 & flights$day == 1, ]

?filter
filter(flights, month == 1, day == 1)
flights_first_jan = filter(flights, month == 1, day == 1)

filter(flights, dep_delay < 0)

flights %>% filter(month == 1, day == 1)

mean(flights$arr_delay, na.rm = TRUE)
flights$arr_delay %>% mean(na.rm = TRUE)


# Organizar linhas com arrange()

arrange(flights, year, month, day)
arrange(flights, year, desc(month), desc(day)) %>% View()
arrange(flights, dep_time)
arrange(flights, dep_time, sched_dep_time)
arrange(flights, desc(dep_delay))

flights %>% arrange(dep_delay)

flights %>%
  filter(month == 1, day == 1) %>%
  arrange(dep_delay)

arrange(filter(flights, month == 1, day == 1), dep_delay)


# Selecionar colunas com select()

names(flights)
colnames(flights)
select(flights, year, month, day)  # Selecionando as colunas por nome
select(flights, year:day)          # Selecionando todas as colunas entre year e day (inclusive)
select(flights, -year)
select(flights, -(year:day))       # Selecionando todas as colunas exceto year até day (inclusive)

flights[ , -c(1, 2, 3)]

select(flights, 10)
flights[, 10]

flights %>%
  filter(month == 1, day == 1) %>%
  select(dep_time, dep_delay) %>% 
  arrange(dep_delay)

select(flights, ano = year, mes = month, dia = day, dep_delay)


# Renomear colunas com rename()

select(flights, ano = year, mes = month, dia = day)
rename(flights, ano = year, mes = month, dia = day)

dados_tratados = flights %>% 
  select(Ano = year, Mês = month, Dia = day, `Número do Vôo` = tailnum)
dados_tratados
dados_tratados$`Número do Vôo`


# Adicionar novas colunas com mutate() e transmute()

mutate(flights,
       air_time_in_hours = air_time / 60,
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60
) %>% View()

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
          sum.do.delay.dep = sum(dep_delay, na.rm = TRUE),
)

mean(flights$dep_delay, na.rm = TRUE)
mean(flights$arr_delay, na.rm = TRUE)
sum(flights$dep_delay, na.rm = TRUE)


# Operações agrupadas

summarise(flights,
          count = n(),
          dist = mean(distance, na.rm = TRUE),
          delay = mean(arr_delay, na.rm = TRUE))

group_by(flights, tailnum)
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

flights %>%
  group_by(dest) %>%
  summarise(planes = n_distinct(tailnum),
            flights = n())

daily = group_by(flights, year, month, day)
voos.diarios = summarise(daily, flights = n())
plot(voos.diarios$flights, type = "l")


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

full_join(empregados, cargos2,
          by = c("id.cargo" = "cargo"))

?full_join

# Dica:
# Ctrl + A, Ctrl + I: para identar o código
