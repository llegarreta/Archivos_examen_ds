load("C:/Users/llegarreta/Desktop/Examen_ds/Archivos_examen_ds/muestra13.RData")

dim(muestra13)

# la muestra tiene 303136 registros y 3 variables

colnames(muestra13)<-c("nif","nombre","genero")

# Analisis genero

mujeres<-df_clientes[df_clientes$genero=='M',3]
hombres<-df_clientes[df_clientes$genero=='V',3]
mujeres<-as.data.frame(table(mujeres))
hombres<-as.data.frame(table(hombres))
colnames(mujeres)<-c("nombre","n_M")
colnames(hombres)<-c("nombre","n_V")
genero<-merge(mujeres,hombres,all.x=T,all.y=T)
genero[is.na(genero)]=0
genero$genero_imp[genero$n_M>genero$n_V]="M"
genero$genero_imp[genero$n_V>genero$n_M]="V"
