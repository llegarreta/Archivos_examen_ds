load("C:/Users/Aitor Pérez Artetxe/Desktop/CURSO/Data science/Examen_DS/Archivos_examen_ds/muestra34.RData")
View(muestra34)

install.packages("stringi")
install.packages("stringr")
install.packages("rebus")
library(stringi)
library(stringr)
library(rebus)

#1
colnames(muestra34)<-c("nif","nombre","genero")
dim_original=dim(muestra34)#dim=298110x3

#########eliminar los que no esta bien el nif

funcion = START %R% "[0-9]"  %R% any_char(1,8) %R% "[A-Z]" %R% END
muestra34=stri_subset(muestra34$nif,regex = funcion)
dimension_con_NIF_Modificado=dim(muestra34)#dim=271300x3



