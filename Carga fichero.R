setwd("C:/Users/Amesti/OneDrive - Mondragon Unibertsitatea/BDatA/Data science/Examen_DS/Archivos_examen_ds")
load("muestra04.RData")
dim(muestra04)
#en las variables tenemos 3 columnas: un código, nombres y género.
#las dimensiones del archivo son 332086 x 3  (3 columnas 332086 instancias)

library(stringr)
names(muestra04)<-c("nif","nombre","genero")
     
expr_reg <- "([[:digit:]]{8})([[:alpha:]]{1})"

a<-grepl(pattern = expr_reg, muestra04$nif)
 
df<-cbind(muestra04,a)
df<-muestra04[df$a==T,]
dim(df)

#las dimensiones del nuevo dataset con la columna nif limpia son 301428 x 3
