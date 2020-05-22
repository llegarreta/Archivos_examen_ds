load("C:/Users/Mikel/Desktop/Examen_DS/Archivos_examen_ds/muestra01.RData")
dim(muestra01)
#dimensiones del ficero 336086 filas y 3 columnas
str(muestra01)

#Cambiamos los nombres de las variables
names(muestra01)[c(1,2,3)]<- c("nif", "nombre", "genero")
colnames(muestra01)

#HEAD
library(stringr)

#nos quedamos con las instancias con 8 digitos y una letra
muestra01<- muestra01[str_detect(muestra01[,1], "([[:digit:]]{8})([[:alpha:]]{1})")==T,]
dim(muestra01)
#304832 filas y 3 columnas
#
muestra01$genero_imp<-muestra01$genero


#Ponemos todos los nombres en Mayusculas
muestra01[,2]<- str_to_upper(muestra01[,2])


library(dplyr)

#Creamos la tabla de frecuenciasque s eva a llamar s, donde apareceran el numero acumulado de las veces de cada nombre en la variable n.
s<- muestra01 %>%
  group_by(nombre, genero) %>%
  summarise(n=n())
s<- s %>%
  group_by(nombre) %>%
  filter(n==max(n))



for(i in 1:dim(muestra01)[1]){
  for(j in 1:dim(s)[1]){
    if(muestra01[i,2]==s[i,1]){
      muestra01[i,4]<- s[i,2]
    }
  }
}

#Realizamos este codigo por si en el caso de que para el mismo nombre tenga el genero M y V se quede con el más frecuente.

muestra01<- muestra01 %>%
  filter(genero_imp!="")
#solo nos quedamos con las instancias informadas de genero

