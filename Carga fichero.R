library(dplyr)

# EXAMEN DS ---------------------------------------------------------------
directorio <- setwd('C:/Users/auror/Desktop/RETOS/RETO 4/DS/Examen_DS/Archivos_examen_ds')
load('muestra17.RData')
dim(muestra17)
colnames(muestra17) 
str(muestra17)

#El fichero tiene 310110 registros y 3 variables
colnames(muestra17) <-c('NIF', 'Nombre', 'Genero')
table(muestra17$Genero)
genero <- as.data.frame(table(muestra17$Genero))

muestra2 <- muestra17%>%
  filter(Genero!='')

muestra2<-muestra2%>%
  group_by(Nombre, Genero)%>%
  count()

#chicas
muestra_chicas <- muestra17%>%
  filter(Genero=='M')


muestra_chicas2<-muestra_chicas%>%
  group_by(Nombre)%>%
  count()
muestra_chicas3<-left_join(muestra_chicas, muestra_chicas2, by='Nombre')

#chicos
muestra_chicos <- muestra17%>%
  filter(Genero=='V')

muestra_chicos2<-muestra_chicos%>%
  group_by(Nombre)%>%
  count()
muestra_chicos3<-left_join(muestra_chicos, muestra_chicos2, by='Nombre')

genero_imp<-c()

muestrita<-full_join(muestra_chicas3, muestra_chicos3, by='Nombre')
colnames(muestrita)<-c('NIF', 'Nombre', 'genero_mujer', 'n_mujer', 'Nif_dos', 'genero_hombre', 'n_hombre')  
muestrita <- select(muestrita, -Nif_dos)

#OTRA FORMA
muestrita$genero_imp[muestrita$n_mujer>muestrita$n_hombre]<-'V'
muestrita$genero_imp[muestrita$n_mujer<muestrita$n_hombre]<-'M'
colnames(muestrita)

muestra17<-select(muestrita, NIF, Nombre, genero_imp2)


#sOLUCIONAMOS COSAS RARAS
gsub(pattern="[[:punct:]]", muestra17$Nombre, replacement=" ")
#LISTO
