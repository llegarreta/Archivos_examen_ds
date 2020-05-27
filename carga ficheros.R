library(stringr)

setwd("C:/Users/lenovo/OneDrive/Escritorio/examen-DS/Archivos_examen_ds")
load("muestra05.RData")

dim(muestra05)

# el fichero tiene las siguentes dimensiones: 293111 , 3
names(muestra05)<-c("nif", "nombre", "genero")

<<<<<<< HEAD

#identificamos los NIF correctamente escritos 
a<-"([[:digit:]]{8})([[:alpha:]]{1})"
nif_correctos <- grepl(pattern = a, muestra05$nif)

#seleccionamos solamente aquellos que son verdaderos (las que cumplen las condiciones)
nif_correctos_final <- which( nif_correctos == T)

#se lo aplicamos a nuestra tabla 
muestra05<- muestra05[nif_correctos_final, ]

#despues de arreglar la columna nif nuestra tabla tiene las siguentes dimensiones: 266126,3
dim(muestra05)

=======



#separamos los chico y las chicas 
chicos<- muestra05%>%
  filter(genero=="V")

chicas<- muestra05%>%
  filter(genero=="M")

#creamos tabla frecuencias de chicas
vector_c <- chicas$nombre
frecuencia_chicas <- sort(table(vector_c))
(tabla_frecuencias_chicas <- as.data.frame(frecuencia_chicas))

#creamos tabla frecuencia de chicos
vector_c <- chicos$nombre
frecuencia_chicos <- sort(table(vector_c))
(tabla_frecuencias_chicos <- as.data.frame(frecuencia_chicos))



#Juntamos las dos tabla de frecuencias mediente un full_join, ya que queremos seleccionar todo
frecuencias<-full_join(tabla_frecuencias_chicas, tabla_frecuencias_chicos, by=c("vector_c"="vector_c"))


colnames(frecuencias)<- c("nombre", "M", "V")

#sustituimos todas los NA por cero, estos dan problemas 
frecuencias[is.na(frecuencias)] <- 0 

#IMputamos por aquel genero con la mayor frecuencia 
frecuencias$genero_imp[frecuencias$V>frecuencias$M]="V"
frecuencias$genero_imp[frecuencias$M>frecuencias$V]="M"

muestra05$nombre<-toupper(muestra05$nombre)
frecuencias$nombre<-toupper(frecuencias$nombre)

tabla_final<-full_join(muestra05, frecuencias, by="nombre")

View(tabla_final)

tabla_final<-tabla_final %>% filter(!is.na(genero_imp))

