library(stringr)
library(dplyr)
load("C:/Users/javie/Desktop/git/Examen_DS/Archivos_examen_ds/muestra31.RData")
dim(muestra31)
#309084      3
colnames(muestra31)<-c('nif','nombre','genero')
nchar(muestra31$nif)
sprintf("La largura deberia ser 9 y es %s para el nif %s",nchar(muestra31$nif),muestra31[,1])
buscar<-c("[0-9]{8}","[A-Z]")
muestra31$a<-stringr::str_detect(pattern=buscar,muestra31$nif) 
muestra31<-muestra31 %>%
filter(a==TRUE)

muestra31<-muestra31[,-4]
