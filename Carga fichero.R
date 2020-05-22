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

# Crear variable nueva ----------------------------------------------------
muestra42
toupper(muestra42$nombre)
unique(muestra42$nombre)
library(tidyverse)

muestra42$genero[muestra42$genero=='']<-NA
sinna<-na.omit(muestra42)

generos<-muestra42 %>%
  mutate(genero_imp=paste(nombre,genero,sep = '_'))

freqnombres<-generos %>% 
  count(genero_imp) 

generos$genero[generos$n>generos$n]="M"
generos$genero[generos$n>generos$n]="V"

