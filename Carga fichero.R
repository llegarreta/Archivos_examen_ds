load("C:/Users/Mikel/Desktop/Examen_DS/Archivos_examen_ds/muestra01.RData")
dim(muestra01)
#dimensiones del ficero 336086 filas y 3 columnas
str(muestra01)

#Cambiamos los nombres de las variables
names(muestra01)[c(1,2,3)]<- c("nif", "nombre", "genero")
colnames(muestra01)

library(stringr)

#nos quedamos con las instancias con 8 digitos y una letra
muestra01<- muestra01[str_detect(muestra01[,1], "([[:digit:]]{8})([[:alpha:]]{1})")==T,]
dim(muestra01)
#304832 filas y 3 columnas