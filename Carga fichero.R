load("C:/Users/ikern/Desktop/Examen_DS/Archivos_examen_ds/muestra30.RData")

colnames(muestra30)
names(muestra30)<-c('nif','nombre','género')

str(muestra30)

library(stringi)
library(stringr)
library(rebus)


muestra30$genero_imp<-0


