library(readxl)

aulas <- read_excel("X:/Development/github.com/r_study/Alura/Analise de dados - Introducao com R/data/aulas.xlsx")
# View(aulas)

attach(aulas)
options(max.print=400000)
print(sort(section_id))

aulas[33137,3] <- 3255

print(sort(aulas$section_id))

unique(aulas$section_id)

length(unique(aulas$section_id))

table(aulas$section_id)

sort(table(aulas$section_id))

library(plyr)

df_edit <- count(aulas, vars = "course_id" )

write.csv(df_edit,"X:/Development/github.com/r_study/Alura/Analise de dados - Introducao com R/data/popularidade.csv", row.names=FALSE)


