

setwd("C:/Users/lenovo/OneDrive/Escritorio/examen-DS/Archivos_examen_ds")
load("muestra05.RData")

dim(muestra05)

# el fichero tiene las siguentes dimensiones: 293111 , 3


names(muestra05)<-c("nif", "nombre", "genero")

regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"

muestra05[,"nif"]<-grepl(pattern = regexp, x = muestra05$nif)

muestra05



