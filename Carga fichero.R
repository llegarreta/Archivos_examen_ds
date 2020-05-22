load("C:/Users/irati/Desktop/Examen_DS/Archivos_examen_ds/muestra19.RData")
dim(muestra19)

colnames(muestra19)<-c("nif", "nombre","genero")


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