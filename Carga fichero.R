

# EXAMEN DS ---------------------------------------------------------------
directorio <- setwd('C:/Users/auror/Desktop/RETOS/RETO 4/DS/Examen_DS/Archivos_examen_ds')
load('muestra17.RData')
dim(muestra17)
colnames(muestra17) <- c('NIF', 'Nombre', 'Genero')
str(muestra17)
#El fichero tiene 310110 registros y 3 variables


# Cambios en NIF ----------------------------------------------------------

gsub(pattern="[[:punct:]]", muestra17$NIF, replacement=" ")
