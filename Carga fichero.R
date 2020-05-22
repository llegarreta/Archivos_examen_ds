
setwd("C:/Users/Leire/OneDrive - Mondragon Unibertsitatea/BDatA/Data Science/Introducción a Git-GitHub/Examen_DS/Archivos_examen_ds")
df <- load("muestra07.RData")

dim(muestra07)
str(muestra07)
# Este fichero contiene 335086 filas y 3 columnas 

names(muestra07)

colnames(muestra07) <- c("nif", "nombre" , "genero")
str(muestra07)

# Procesamiento del nif. --------------

unique(muestra07$nif)

muestra07[muestra07 == ""] <- NA
muestra07[muestra07 == 0] <- NA
sum(is.na(muestra07$nif))

# Cuantos tienen 8 digitos?
regexp <- "([[:digit:]]{8})"
grepl(pattern = regexp, x = muestra07$nif)

# y Cuantos una letra mayuscula al final?
regexp <- "([[:digit:]]{8}[A-Z]$)"
grepl(pattern = regexp, x = muestra07$nif)


#suponiendo que eso es lo correcto
sum(grepl(pattern = regexp, x = muestra07$nif))/nrow(muestra07) #el 90% es correcto

muestra07.2<-muestra07[grepl(pattern = regexp, x = muestra07$nif),]

# Este fichero contiene 303909 filas y 3 columnas 
