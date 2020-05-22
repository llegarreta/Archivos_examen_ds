load("C:/Users/ikern/Desktop/Examen_DS/Archivos_examen_ds/muestra30.RData")

colnames(muestra30)
names(muestra30)<-c('nif','nombre','genero')

str(muestra30)

library(stringi)
library(stringr)
library(rebus)


#<<<<<<< HEAD

#Creamos un dataframe para ambos géneros
varon<- muestra30%>%
  filter(genero=="V")

mujer<- muestra30%>%
  filter(genero=="M")


#creamos la tabla de frecuencias de mujeres
vector_c <- mujer$nombre
freq_mujer <- sort(table(vector_c))
tabla_freq_mujer <- as.data.frame(freq_mujer)
tabla_freq_mujer

#creamos la tabla de frecuencias de varones
vector_c <- varon$nombre
freq_varon <- sort(table(vector_c))
tabla_freq_varon <- as.data.frame(freq_varon)
tabla_freq_varon


#Para juntar ambas tablas usamos la funcion full_join porque nos interesa toda la información
freq<-full_join(tabla_freq_mujer, tabla_freq_varon, by=c("vector_c"="vector_c"))

colnames(freq)<- c("nombre", "M", "V")

#Cambiamos los valores NA a 0 para que no de problemas 
freq[is.na(freq)] <- 0 

#Se imputa por el género que más frecuencia tenga para ese nombre 
freq$genero_imp[freq$V>freq$M]="V"
freq$genero_imp[freq$M>freq$V]="M"

muestra30$nombre<-toupper(muestra30$nombre)
freq$nombre<-toupper(freq$nombre)

#Unimos la tabla de la muestra 30 y la tabla de frecuencias por nombre
tabla_final<-full_join(muestra30, freq, by="nombre")

View(tabla_final)

tabla_final<-tabla_final %>% filter(!is.na(genero_imp))

#=======

#Creo el patrón que cumplen los nif 8 digitos y 1 letra
patron = "([[:digit:]]{8})([[:alpha:]]{1})"

#con str_extract saco las combinaciones que coincidan
a=str_extract(muestra30$nif, patron)

#Lo añado a dataframe
a=data.frame(a)

#Uno la tabla a del patron a la muestra original
tabla_final=inner_join(a, tabla_final, by = c("a" = "nif"))

#>>>>>>> rama-nif
