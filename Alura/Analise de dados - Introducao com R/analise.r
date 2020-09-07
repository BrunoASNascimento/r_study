library(readxl)

aulas <- read_excel("X:/Development/github.com/r_study/Alura/Analise de dados - Introducao com R/data/aulas.xlsx")
# View(aulas)

attach(aulas)
options(max.print=400000)
print(sort(section_id))

