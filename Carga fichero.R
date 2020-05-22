setwd("C:/Users/adria/Desktop/Examen_DS/Archivos_examen_ds")
#Dimensiones de mi archivo
dim(muestra28)


#cambiar nombres
names(muestra28)[1] ="nif"
names(muestra28)[2] ="nombre"
names(muestra28)[3] ="genero"

#cambio nif
cambio_nif <- "([[:digit:]]{8})([[:alpha:]]{1})"
grepl(pattern = cambio_nif, x = muestra28$nif)
muestra2<-grepl(pattern = cambio_nif, x = muestra28$nif)
vector<-as.vector(which(muestra2, arr.ind=FALSE))
muestra28<-muestra28[c(vector),]
dim(muestra28)
#dimensiones 277949 y 3

