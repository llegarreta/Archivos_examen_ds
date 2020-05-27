
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
muestra14<-bieninformadas


# Modificaciones de género--------------------------------
#hemos dejado filas libres para mergear bien

library(dplyr)

table(muestra14$genero)
muestra14$genero<- chartr("ÁÉÍÓÚ", "AEIOU", muestra14$genero)

#eliminamos "E" y "X" porque no están bien informadas
muestra14<-muestra14%>%
  filter(genero!="E")%>%
  filter(genero!="X")

dim(muestra14) #hemos eliminado 30 filas

library(tidyverse)
generosinna<-muestra14[,c(2,3)] #cogemos nombre y género para cambiar cosas
generosinna<-generosinna[generosinna$genero!="",] #eliminamos género no informado

chicas<-generosinna%>% #filtramos por chicas
  filter(genero=="M")

chicos<-generosinna%>% #filtramos por chicos
  filter(genero=="V")

#creamos tablas de frecuencias de nombres de chicos
nombre <- chicos$nombre
frecuencia_chicos <- sort(table(nombre))
tabla_frecuencias_chicos <- as.data.frame(frecuencia_chicos)
colnames(tabla_frecuencias_chicos)<-c("nombre","cant.chicos")
str(tabla_frecuencias_chicos)

#creamos tablas de frecuencias de nombres de chicas
nombre <- chicas$nombre
frecuencia_chicas <- sort(table(nombre))
tabla_frecuencias_chicas <- as.data.frame(frecuencia_chicas)
colnames(tabla_frecuencias_chicas)<-c("nombre","cant.chicas")
str(tabla_frecuencias_chicas)

#Comparamos frecuencias de chicos y chicas
frecuencias_genero<-full_join(tabla_frecuencias_chicas, tabla_frecuencias_chicos, by="nombre")

frecuencias_genero$cant.chicas[is.na(frecuencias_genero$cant.chicas)==T]<-0 #cambiamos NAs por 0
frecuencias_genero$cant.chicos[is.na(frecuencias_genero$cant.chicos)==T]<-0

frecuencias_genero$genero_imp<-frecuencias_genero$nombre #creamos la nueva columna
frecuencias_genero$genero_imp<-NA

#nos quedamos con el género que aparezca con mayor frecuencia para un nombre
frecuencias_genero$genero_imp[frecuencias_genero$cant.chicas>frecuencias_genero$cant.chicos]="M" 
frecuencias_genero$genero_imp[frecuencias_genero$cant.chicos>frecuencias_genero$cant.chicas]="V"

#quedan los que hay el mismo número para ambos
table(generosinna$genero) #como hay muchas más mujeres deducimos que puede estar mal informado
#los imputamos por hombres para tener un número similar
frecuencias_genero$genero_imp[frecuencias_genero$cant.chicos==frecuencias_genero$cant.chicas]="V"


#lo cargamos todo en generosinna que es la que vamos a tener como final
tablafinal<-generosinna
frecuencias_genero<-frecuencias_genero[,c(1,4)] #nos quedamos solo con el nombre y el género final
tablafinal<-inner_join(tablafinal,frecuencias_genero, by="nombre") #inner_join para quedarnos solo con lo informado
tablafinal<-tablafinal%>%distinct(nombre,.keep_all = TRUE)

#dejamos solo nombre con género bueno y hacemos left_join con la limpia de nif
tablafinal<-tablafinal[,c(1,3)]
colnames(bieninformadas)
bieninformadas<-bieninformadas[,c(1:2)] 
tablafinal<-inner_join(bieninformadas, tablafinal,by="nombre") #esta sería la tabla final informada

tablafinal$nombre<-toupper(tablafinal$nombre) #tabla con nombres bien
