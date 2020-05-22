

setwd("C:/Users/lenovo/OneDrive/Escritorio/examen-DS/Archivos_examen_ds")
load("muestra05.RData")

dim(muestra05)

# el fichero tiene las siguentes dimensiones: 293111 , 3


names(muestra05)<-c("nif", "nombre", "genero")

muestra05$genero_imp<-""

vectores <- muestra05$nombre

frecuencia_nombres <- sort(table(vectores))

(tabla_frecuencias <- as.data.frame(frecuencia_nombres))

