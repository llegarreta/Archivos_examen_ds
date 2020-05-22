load('C:/Users/usuario/OneDrive/Escritorio/Examen_DS/Archivos_examen_ds/muestra36.RData')
 dim(muestra36)
 # El dataset muestra 36 contiene: 337685 filas y 3 columnas (variables)
 
colnames(muestra36) <- c('nif', 'nombre', 'genero')

#### NIF
library(stringr)
#Nos quedamos con 8 digitos al principio y 1 letra al final
muestra36 <- muestra36[str_detect(muestra36$nif, "(^[:digit:]{8})([:alpha:]{1}$)"),]

dim(muestra36)
# El dataset muestra 36 ahora contiene: 306486 filas y 3 columnas (variables)