library(stringi)
library(stringr)
library(rebus)
library(dplyr)


setwd("C:/Users/cecil/OneDrive/BUSINESS DATA ANALYTICS/PRIMERO/DATA SCIENCE/RETO 4/EXAMEN DS/Archivos_examen_ds")
load("muestra10.RData", envir = parent.frame(), verbose = FALSE)
dim(muestra10) #dimensiones 335686      3
colnames(muestra10)

#cambiamos nombre de las variables
names (muestra10)[1] = "nif"
names (muestra10)[2] = "nombre"
names (muestra10)[3] = "genero"

#eliminaremos del dataset original todos los registros que no tienen el formato adecuado para esta variable (8 dígitos y una letra)

nif <-muestra10[1]
regexp <- "([[:digit:]]{8}) ([[:alpha:]]{1})"
grepl(pattern = regexp, x =muestra10$nif) #no cumple pq no tiene dos digitos

#eliminar las filas false

#imputar género
unique(muestra10$genero)

muestra10%>%
  filter(genero=="M")%>%
  group_by(nombre)



