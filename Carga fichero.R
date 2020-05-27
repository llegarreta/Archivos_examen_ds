
setwd("C:/Users/ECI/Desktop/Examen_DS/Archivos_examen_ds")
load("muestra21.RData")

library(dplyr)
library(stringi)
library(stringr)
library(rebus)

#tres variables, la primera numerica, la segunda con nombres, eventos o empresas, y
#la tercera con el genero

colnames(muestra21)<-c("nif","nombre","genero")


#cambiamos 0 o valores missing por NA
muestra21[muestra21 == 0] <- NA

muestra21[muestra21 == ""] <- NA
dim(muestra21)

#vamos a ver si hay guiones, barrabajas o valores extraños
stringr::str_subset(muestra21$nif, "(\\_|\\-)[a-zA-Z]*\\.(csv|ods)$")

#No encuentramos valores extramos, pero quitamos parentesis porseacaso

gsub("\\s*\\([^\\)]+\\)","",muestra21$nif) 
stringr::str_subset(muestra21$nif, "(\\_|\\-)[a-zA-Z]*\\.(csv|ods)$")


nif2<-as.data.frame(grepl(pattern = regexp, x = muestra21$nif))

nif2 %>%
  filter(nif2==TRUE)



# regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"
# 
# grepl(pattern = regexp, x = muestra21$nif)
# 
# 
# 
# muestra21_1<-muestra21 %>%
#   filter((
#     grepl(pattern = regexp, x = muestra21$nif) = TRUE)
#   )
# 
# funcion = START %R% "[0-9]"  %R% any_char(1,8) %R% "[A-Z]" %R% END
# stri_subset (as.da(muestra21$nif,regex = funcion))
# 
# muestra21$nif[muestra21$nif == stri_subset(muestra21$nif,regex = funcion)]

 cambiamos_de_nif <- "([[:digit:]]{8})([[:alpha:]]{1})"


grepl(pattern = cambiamos_de_nif, x = muestra21$nif)

muestra2<-grepl(pattern = cambiamos_de_nif,  x = muestra21$nif)

vector<-as.vector(which(muestra2, arr.ind=FALSE))
muestra21<-muestra21[c(vector),]


chicos<- muestra21%>%
  
  filter(genero=="V")

#filtramos

chicas<- muestra21%>%
  filter(genero=="M")


vector_c <- chicas$nombre
frecuencia_chicas <- sort(table(vector_c))

#tabla frecuencias para ambos
(tabla_frecuencias_chicas <- as.data.frame(frecuencia_chicas))


vector_c <- chicos$nombre
frecuencia_chicos <- sort(table(vector_c))
(tabla_frecuencias_chicos <- as.data.frame(frecuencia_chicos))



frecuencias<-
  full_join(tabla_frecuencias_chicas, tabla_frecuencias_chicos, by=c("vector_c"="vector_c"))

#cambaimos nombre columnas
colnames(frecuencias)<- c("nombre", "M", "V")

frecuencias[is.na(frecuencias)] <- 0 

frecuencias$genero_imp[frecuencias$V>frecuencias$M]="V"




frecuencias$genero_imp[frecuencias$M>frecuencias$V]="M"

muestra21$nombre<-toupper(muestra21$nombre)
frecuencias$nombre<-toupper(frecuencias$nombre)

tabla_final<-full_join(muestra21, frecuencias, by="nombre")







tabla_final<-tabla_final %>% filter(!is.na(genero_imp))
