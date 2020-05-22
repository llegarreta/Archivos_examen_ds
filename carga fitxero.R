setwd("C:/Users/cecil/OneDrive/BUSINESS DATA ANALYTICS/PRIMERO/DATA SCIENCE/RETO 4/EXAMEN DS/Archivos_examen_ds")
load("muestra10.RData", envir = parent.frame(), verbose = FALSE)
dim(muestra10) #dimensiones 335686      3
colnames(muestra10)

#cambiamos nombre de las variables
names (muestra10)[1] = "nif"
names (muestra10)[2] = "nombre"
names (muestra10)[3] = "genero"
