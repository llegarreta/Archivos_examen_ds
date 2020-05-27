library(stringr)

setwd("C:/Users/mikel/OneDrive - Mondragon Unibertsitatea/MU - One Drive/BDA 1/Data Science/Git/Examen_DS/Archivos_examen_ds-master")
load("C:/Users/mikel/OneDrive - Mondragon Unibertsitatea/MU - One Drive/BDA 1/Data Science/Git/Examen_DS/Archivos_examen_ds-master/muestra25.RData")

dim(muestra25) #308084 3

names(muestra25)[1] = "nif"
names(muestra25)[2] = "nombre"
names(muestra25)[3] = "genero"


muestra25$nif[str_detect(muestra25$nif, pattern = "00000")] <- "1111"

regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"
grepl(pattern = regexp, x = muestra25$nif)

dim(muestra25)

niff <- "([[:digit:]]{8})([[:alpha:]]{1})"
grepl(pattern = niff, x = muestra25$nif)
muestra2<-grepl(pattern = niff, x = muestra25$nif)
vector<-as.vector(which(muestra2, arr.ind=FALSE))
muestra25<-muestra25[c(vector),]

dim(muestra25) #279596 3

muestra25$genero_imp<-" " #creamos variable genero_imp

#cambiamos la variable genero (no me da tiempo)

