
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


# Modificaciones en NIF ---------------------------------------------------

library(dplyr)

table(muestra14$nif)

sum(is.na(muestra14$nif)) #hay una fila con NA
dim(muestra14[muestra14$nif=="",]) #tiene 12 filas sin informar

proporcion_sin_info<-dim(muestra14[muestra14$nif=="",])[1]/dim(muestra14)[1]
proporcion_sin_info #la proporcion es muy pequeña así que podemos eliminar estos valores

muestra14_informadas<-muestra14%>%   #hemos quitado los NAs y los valores sin informar
  filter(nif!="")%>%
  filter(is.na(nif)==F)
dim(muestra14_informadas) #hemos eliminado 12 filas

#vemos que hay varios usuarios con nif mal introducido (8 dígitos y una letra)
#hay que eliminarlos

regexp <- "([[:digit:]]{8})([[:alpha:]]{1})" #el patrón tiene que ser 8 dígitos y una letra
bien<-grepl(pattern = regexp, x = muestra14$nif) #sale T o F dependiendo de si cumple o no
bieninformadas<-muestra14[bien,]
dim(bieninformadas) #2833306 filas y 3 columnas

dim(muestra14)[1]-dim(bieninformadas)[1] #se han eliminado 28804 filas


