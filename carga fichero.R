load("C:/Users/Usuario/Desktop/Examen_DS/Archivos_examen_ds/muestra11.RData")
dim(muestra11)
#Las dimensiones son 296686 filas y 3 columnas.
colnames(muestra11)<-c("nif","nombre","genero")

#Expresiones regulares
regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"
grepl(pattern = regexp, x = muestra11$nif)
prueba<-grepl(pattern = regexp, x = muestra11$nif)
objeto_vector<-as.vector(which(prueba, arr.ind=FALSE))
muestra11<-muestra11[c(objeto_vectcor),]
 dim(muestra11)
 
