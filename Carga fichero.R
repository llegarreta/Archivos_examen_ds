library(stringi)
library(stringr)
library(rebus)

load("C:/Users/irati/Desktop/Examen_DS/Archivos_examen_ds/muestra19.RData")
dim(muestra19)

colnames(muestra19)<-c("nif", "nombre","genero")


# nif --------------------------------------------------------------------
cambio <-START %R% "[0-9]"  %R% any_char(1,8) %R% "[A-Z]" %R% END
muestra19$NIF<-str_extract(muestra19$nif, cambio)

muestra19<-filter(muestra19,NIF!=is.na(NIF))
muestra19<-muestra19[,1:3]
