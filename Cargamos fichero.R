load("C:/Users/prueba/Desktop/Examen_DS/Archivos_examen_ds/Muestra16.Rdata")
dim(muestra16)

#El fichero tiene 3 variables y 299136 filas

names(muestra16)[1]= "nif"
names(muestra16) [2]= "nombre"
<<<<<<< HEAD
names (muestra16) [3] = "genero"
=======
names (muestra16) [3] = "genero"

cambio_nif <- "([[:digit:]]{8})([[:alpha:]]{1})"
grepl(pattern = cambio_nif, x = muestra16$nif)
muestra2<-grepl(pattern = cambio_nif, x = muestra16$nif)
vector<-as.vector(which(muestra2, arr.ind=FALSE))
muestra16<-muestra16[c(vector),]

dim(muestra16)

#Muestra 16 tiene ahora 271661 filas
>>>>>>> rama-nif
