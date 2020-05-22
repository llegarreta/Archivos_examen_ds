load("C:/Users/Mikel/Desktop/Examen_DS/Archivos_examen_ds/muestra01.RData")
dim(muestra01)
#dimensiones del ficero 336086 filas y 3 columnas
str(muestra01)

#Cambiamos los nombres de las variables
names(muestra01)[c(1,2,3)]<- c("nif", "nombre", "genero")
colnames(muestra01)
