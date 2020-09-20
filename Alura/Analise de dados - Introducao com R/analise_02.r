library(readr)
library(plyr)

duracao <- read_csv("X:/Development/github.com/r_study/Alura/Analise de dados - Introducao com R/data/duracao.csv")
View(duracao)
duracao <- rename(duracao, replace = c("user_id"="aluno","course_id"="curso","timeToFinish"="dias"))

popularidade <- read_csv("X:/Development/github.com/r_study/Alura/Analise de dados - Introducao com R/data/popularidade.csv")
View(popularidade)
popularidade <- rename(popularidade, replace = c("course_id"="curso"))

plot(duracao$dias)


jpeg("X:/Development/github.com/r_study/Alura/Analise de dados - Introducao com R/output/histograma.jpg")
hist(duracao$dias, breaks = 20,main="Histograma do tempo", ylab = "Quantidade", xlab = "Tempo", ylim = c(0,2000),col="Blue")
dev.off()

mean(duracao$dias,na.rm = TRUE)
median(duracao$dias,na.rm = TRUE)

summary(duracao)
summary(duracao$dias)

#Faltantes %
faltantes <- sum(is.na(duracao$dias))/dim(duracao)[1]

cat(format(faltantes*100, nsmall = 2), "% dos dados não tem a duração de dias")

length(unique(duracao$curso))
length(unique(duracao$aluno))

sumario_estatistico <- setNames(aggregate(duracao$dias,list(duracao$curso),mean,na.rm=T),c("curso","duracao_mean"))
popularidade_e_duracao <- merge(sumario_estatistico,popularidade,by="curso")

plot(popularidade_e_duracao$duracao_mean,popularidade_e_duracao$freq)

modelo.linear <- lm(popularidade_e_duracao$freq~popularidade_e_duracao$duracao_mean)

abline(lm(popularidade_e_duracao$freq~popularidade_e_duracao$duracao_mean))


scatter.smooth(popularidade_e_duracao$duracao_mean,popularidade_e_duracao$freq)
