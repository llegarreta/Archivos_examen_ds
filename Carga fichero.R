
setwd("C:/Users/Leire/OneDrive - Mondragon Unibertsitatea/BDatA/Data Science/Introducción a Git-GitHub/Examen_DS/Archivos_examen_ds")
df <- load("muestra07.RData")

dim(muestra07)
str(muestra07)
# Este fichero contiene 335086 filas y 3 columnas 

names(muestra07)

colnames(muestra07) <- c("nif", "nombre" , "genero")
str(muestra07)
