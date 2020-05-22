setwd('C:/Users/jiewu/OneDrive/Escritorio/Examen_DS/Archivos_examen_ds')

# Librerias ---------------------------------------------------------------
library(stringr)
# Carga de datos ----------------------------------------------------------
load('muestra42.RData')


# Mirar las dimensiones del fichero ---------------------------------------
dim(muestra42) # Los datos tienen 300685filas y 3 variables

# Cambiamos los nombres de las columnas -----------------------------------
colnames(muestra42)<-c('nif','nombre','genero') #Mediante colnames cambiamos los nombres de las columnas


# nif ---------------------------------------------------------------------

cambio <- "([[:digit:]]{8})([[:alpha:]]{1})"
grepl(pattern = cambio, x = muestra42$nif)
muestra<-grepl(pattern = cambio, x = muestra42$nif)
vector<-as.vector(which(muestra, arr.ind=FALSE))
muestra42<-muestra42[c(vector),]

