setwd("C:/Users/Amesti/OneDrive - Mondragon Unibertsitatea/BDatA/Data science/Examen_DS/Archivos_examen_ds")
load("muestra04.RData")
dim(muestra04)
#en las variables tenemos 3 columnas: un código, nombres y género.
#las dimensiones del archivo son 332086 x 3  (3 columnas 332086 instancias)

names(muestra04)<-c("nif","nombre","genero")
