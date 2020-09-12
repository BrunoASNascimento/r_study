library(readr)

duracao <- read_csv("X:/Development/github.com/r_study/Alura/Analise de dados - Introducao com R/data/duracao.csv")
View(duracao)

duracao <- rename(duracao, replace = c("user_id"="aluno","course_id"="curso","timeToFinish"="dias"))

plot(duracao$dias)

hist(duracao$dias, breaks = 20)
