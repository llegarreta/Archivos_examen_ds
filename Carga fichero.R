
# Cargamos datos ----------------------------------------------------------

setwd("C:/Users/ikump/OneDrive/Escritorio/Examen_DS/Archivos_examen_ds")
load("muestra14.RData")


# Inspeccionamos dimensiones ----------------------------------------------

dim(muestra14)
#contiene 312110 filas y 3 columnas

str(muestra14)
#contiene 3 variables de tipo character


# Modificar nombres -------------------------------------------------------

colnames(muestra14)<-c("nif","nombre","genero")

























# Modificaciones de género--------------------------------
#hemos dejado filas libres para mergear bien

library(dplyr)

table(muestra14$genero)

#eliminamos "E" y "X" porque no están bien informadas
muestra14<-muestra14%>%
  filter(genero!="E")%>%
  filter(genero!="X")

dim(muestra14) #hemos eliminado 30 filas

library(tidyverse)
tablafrecuencias<-muestra14[,c(2,3)]
tablafrecuencias<-tablafrecuencias[tablafrecuencias$genero!="",]

chicos<-tablafrecuencias%>%
  filter(genero=="M")

chicas<-tablafrecuencias%>%
  filter(genero=="V")


