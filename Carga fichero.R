#Carga de datos
setwd("C:/Users/JON/Desktop/Exámen_DS")
load("C:/Users/JON/Desktop/Exámen_DS/muestra24.RData")
muestra24d<-muestra24

#Análisis de la estructura
dim(muestra24)#Dimensiones de datos (299110 x 3)
str(muestra24)#Estructura de datos (Un dataframe de 3 variables, todas de clase character)

#Ajuste de nombre
names(muestra24)[1]="nif"
names(muestra24)[2]="nombre"
names(muestra24)[3]="genero"

#Realización de expresiones regulares para la variable nif
#Filtrar los nif "completos o buenos"
parametros <- "([[:digit:]]{8})([[:alpha:]]{1})" #Creación de los parámetros/criterios (que tenga 8 números y una letra al final)
grepl(pattern = parametros, x = muestra24$nif) #Se usa la función grepl en la que de introducen los parametros y la columna donde se le van a aplicar 
filtrado<-grepl(pattern = parametros, x = muestra24$nif) #Se guarda en un objeto el anterior filtro
conversion_a_vector<-as.vector(which(filtrado, arr.ind=FALSE)) #Conversión a vector de el anterior objeto
muestra24<-muestra24[c(conversion_a_vector),] #Adjudicación del anterior vector al dataframe muestra 24

#Las dimensiones son (me sale logical(0), aunque creo que el código está bien)


#Creación de la variable genero_imp
muestra24$genero_imp<-" " #Creación de una variable vacía
library(mice) #Carga de la libreía mice
#class(muestra24)
impute <- mice(muestra24[,c(2,4)], m=3, method="pmm", seed = 123) #Imputación por el método pmm



















