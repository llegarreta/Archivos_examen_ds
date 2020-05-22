library(tidyverse)
setwd("C:/Users/anema/OneDrive - Mondragon Unibertsitatea/Escritorio/BUSINESS DATA ANALYTICS (BDatA)/PRIMERO/RETO 4/DATA SCIENCE/Examen_DS/Archivos_examen_ds")
load("muestra29.RData")

dim(muestra29)
View(muestra29)


#cambiamos el nombre de  las columnas
dput(colnames(muestra29))
colnames(muestra29) <- c("nif", "nombre", "genero")
