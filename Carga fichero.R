

# EXAMEN DS ---------------------------------------------------------------
directorio <- setwd('C:/Users/auror/Desktop/RETOS/RETO 4/DS/Examen_DS/Archivos_examen_ds')
load('muestra17.RData')
dim(muestra17)
colnames(muestra17) <- c('NIF', 'Nombre', 'Genero')
str(muestra17)
#El fichero tiene 310110 registros y 3 variables


# Cambios en NIF ----------------------------------------------------------

gsub(pattern="[[:punct:]]", muestra17$NIF, replacement=" ")
#8 dígitos y una letra


patron <- "([[:alpha:]]{1})"
muestra17<-muestra17%>%
  filter(grepl(pattern = patron, x = NIF))
patron2 <- "([[:digit:]]{8})"
muestra17<-muestra17%>%
  filter(grepl(pattern = patron2, x = NIF))
dim(muestra17)
#Las dimensiones se han reducido a 282125 registros

