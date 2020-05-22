load("C:/Users/clash/Desktop/Examen_DS/Examen/muestra15.RData")
str(muestra15)
dim(muestra15)
#El fichero es un dataframe de 3 variables caracter con 338111 filas
names(muestra15)[1] = "nif"
names(muestra15)[2] = "nombre"
names(muestra15)[3] = "genero"

dnis_cambiar <- "([[:digit:]]{8})([[:alpha:]]{1})"
grepl(pattern = dnis_cambiar, x = muestra15$nif)
cambio1<-grepl(pattern = dnis_cambiar, x = muestra15$nif)
cambio2<-merge(cambio1, muestra15)
cambio3<-as.vector(which(cambio1, arr.ind = FALSE))
muestra15<-muestra15[c(cambio3),]

dim(muestra15)
