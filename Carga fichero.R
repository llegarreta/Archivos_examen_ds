setwd("C:/Users/USUARIO/OneDrive/MU/MATERIAS/DATA SCIENCE I/Examen_DS/Archivos_examen_ds")

df<-load("muestra22.RData")

#Las dimensiones de Muestra22 son 302711 x 3. Tenemos tres variables var1, var2 y var 3
dim(muestra22)
str(muestra22)

names(muestra22)[1]<-"nif"
names(muestra22)[2]<-"nombre"
names(muestra22)[3]<-"genero"




