library(tidyverse)
setwd("C:/Users/anema/OneDrive - Mondragon Unibertsitatea/Escritorio/BUSINESS DATA ANALYTICS (BDatA)/PRIMERO/RETO 4/DATA SCIENCE/Examen_DS/Archivos_examen_ds")
load("muestra29.RData")

dim(muestra29)
View(muestra29)


#cambiamos el nombre de  las columnas
dput(colnames(muestra29))
colnames(muestra29) <- c("nif", "nombre", "genero")

#arreglamos la columna nif

regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"

muestra29$nif_tf <- grepl(pattern = regexp, x = muestra29$nif)

muestra29 <- muestra29%>%
  filter(nif_tf==T)

muestra29 <- muestra29[,-4]
