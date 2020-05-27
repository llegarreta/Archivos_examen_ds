library(stringi)
library(stringr)
library(rebus)

load("C:/Users/irati/Desktop/Examen_DS/Archivos_examen_ds/muestra19.RData")
dim(muestra19)

colnames(muestra19)<-c("nif", "nombre","genero")


<<<<<<< HEAD
# nif --------------------------------------------------------------------
cambio <-START %R% "[0-9]"  %R% any_char(1,8) %R% "[A-Z]" %R% END
muestra19$NIF<-str_extract(muestra19$nif, cambio)

muestra19<-filter(muestra19,NIF!=is.na(NIF))
muestra19<-muestra19[,1:3]
<<<<<<< HEAD

dim(muestra19)
=======
>>>>>>> rama-nif
=======
# genero ------------------------------------------------------------------
muestra19$genero_imp<-NA
n_M<-filter(muestra19, genero=="M")
n_M$genero<-1
n_M<-summarise(group_by(n_M, nombre), frecuencia=sum(genero))
n_V<-filter(muestra19, genero=="V")
n_V$genero<-1
n_V<-summarise(group_by(n_V, nombre), frecuencia=sum(genero))


genero$genero_imp[genero$n_M>genero$n_V]="M"
genero$genero_imp[genero$n_V>genero$n_M]="V"
>>>>>>> rama-genero
