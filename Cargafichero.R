load("C:/Examen_DS/Archivos_examen_ds/muestra09.RData")
dim(muestra09)

#307085 filas y 3 columnas

#Cambiamos nombres
colnames(muestra09)<-c("nif", "nombre", "genero")
unique(muestra09$genero)

chicos<- muestra09%>%
  filter(genero=="V")

chicas<- muestra09%>%
  filter(genero=="M")

vec <- chicos$nombre
frecuencia_chicos <- sort(table(vec))
(tabla_frecuencias_chicos <- as.data.frame(frecuencia_chicos))
str(tabla_frecuencias_chicos)

vec <- chicas$nombre
frecuencia_chicas <- sort(table(vec))
(tabla_frecuencias_chicas <- as.data.frame(frecuencia_chicas))
str(tabla_frecuencias_chicas)

#Comprobamos que tenemos una tabla de frecuencias de cada uno y los unimos
View(tabla_frecuencias_chicas)
View(tabla_frecuencias_chicos)
frecuencias<-full_join(tabla_frecuencias_chicas, tabla_frecuencias_chicos, by="vec")
View(frecuencias)

colnames(frecuencias)<- c("nombre", "M", "V")
frecuencias[is.na(frecuencias)] <- 0 

#Creamos nueva variable para quedarnos con el genero de mayor frecuencia
frecuencias$genero_imp[frecuencias$M>frecuencias$V]="M"
frecuencias$genero_imp[frecuencias$V>frecuencias$M]="V"
View(frecuencias)

#Cambiamos a mayúsculas
muestra09$nombre<-toupper(muestra09$nombre)
frecuencias$nombre<-toupper(frecuencias$nombre)

#Unimos con el dataset general
final<-full_join(muestra09, frecuencias, by="nombre")

#Eliminamos las columnas de frecuencia V y M porque no valen para nada
final<-final[-c(4,5)]
View(final)
dim(final)

#729094 filas y 4 columnas

#Solucionamos problemas en el nif
fallos <- grepl('[[:digit:]]{8}[[:alpha:]]{1}', final$nif)
fallos
trues <- which(fallos == T)
bueno <- final[trues, ]
str(bueno)

dim(bueno)

#688528 filas y 4 columnas

