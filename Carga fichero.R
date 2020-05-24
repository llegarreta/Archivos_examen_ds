
load("C:/Users/Ainhoa/Desktop/MU/Examen_DS/Archivos_examen_ds/muestra33.RData")
dim(muestra33) 
muestra33<- ("muestra33.RData")
View(muestra33)
## Nuestro fichero tiene 298685 filas y 3 columnas
names(muestra33) <- c("nif", "nombre", "genero")
names(muestra33)
genero_imp=vector(mode='numeric', length=298685)
genero_imp

examen = data.frame(muestra33, genero_imp)
View(examen)


## Expresiones regulares 
muestra33$var1(\n) #creamos una nueva fila
muestra33$var2(\s) #dejamos un espacio
muestra33$var3(\r)# volvemos al principio de la fila


library(stringi)
library(stringr)
library(rebus)
funcion = START %R% "[0-9]"  %R% any_char(1,8) %R% "[A-Z]" %R% END
stri_subset(muestra33$nif,regex = funcion)
