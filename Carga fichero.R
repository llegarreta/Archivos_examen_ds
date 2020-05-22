load("C:/Users/clash/Desktop/Examen_DS/Examen/muestra15.RData")
str(muestra15)
dim(muestra15)
#El fichero es un dataframe de 3 variables caracter con 338111 filas
names(muestra15)[1] = "nif"
names(muestra15)[2] = "nombre"
names(muestra15)[3] = "genero"

dnis_cambiar <- "([[:digit:]]{8})([[:alpha:]]{1})"
grepl(pattern = dnis_cambiar, x = muestra15$nif)
cambio1<-grepl(pattern = dnis_cambiar, x = muestra15$nif)
cambio2<-merge(cambio1, muestra15)
cambio3<-as.vector(which(cambio1, arr.ind = FALSE))
muestra15<-muestra15[c(cambio3),]

dim(muestra15)

#GÉNERO
library(plyr)
library(dplyr)

muestra15$genero_imp<-" "
muestra15$nombre <- toupper(muestra15$nombre)
muestra15[muestra15$genero %in% c('', 'X', 'E'),3] <- NA
unique(muestra15$genero)

genero_datos <- muestra15 %>% 
  split(.$genero)
mujeres <- genero_datos[[1]]
hombres <- genero_datos[[2]]

frecuenciahombres <- hombres %>% 
  group_by(nombre) %>% 
  tally()
frecuenciahombres <- frecuenciahombres %>% 
  rename('n_M' = 'n')

frecuenciamujeres <- mujeres %>% 
  group_by(nombre) %>% 
  tally()
frecuenciamujeres <- frecuenciamujeres %>% 
  rename('n_V' = 'n')

frecuenciasgenero <- frecuenciahombres %>% 
  right_join(frecuenciamujeres, by = 'nombre')
frecuenciasgenero[is.na(frecuenciasgenero)] <- 0

tablafinal <- muestra15 %>% 
  left_join(frecuenciasgenero, by = 'nombre')

tablafinal$genero_imputado[tablafinal$n_M>tablafinal$n_V] <- 'M'
tablafinal$genero_imputado[tablafinal$n_V>tablafinal$n_M] <- 'V'
tablafinal <- tablafinal[,-c(4,5)]

tablafinal <- tablafinal[!is.na(tablafinal$genero_imputado),]
