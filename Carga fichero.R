setwd("C:/Users/Amesti/OneDrive - Mondragon Unibertsitatea/BDatA/Data science/Examen_DS/Archivos_examen_ds")
load("muestra04.RData")
dim(muestra04)
#en las variables tenemos 3 columnas: un código, nombres y género.
#las dimensiones del archivo son 332086 x 3  (3 columnas 332086 instancias)

library(stringr)
names(muestra04)<-c("nif","nombre","genero")

     
expr_reg <- "([[:digit:]]{8})([[:alpha:]]{1})"

a<-grepl(pattern = expr_reg, muestra04$nif)
 
df<-cbind(muestra04,a)
df<-muestra04[df$a==T,]
dim(df)

#las dimensiones del nuevo dataset con la columna nif limpia son 301428 x 3


#limpiamos los nombres
 df$nombre<-str_to_upper(df$nombre)
 library(tidyverse)
 
 muestra<-df
# muestra[muestra$genero=="",which(colnames(muestra)=="genero")]<-"N"
#  muestra$val<-ifelse(muestra$genero==0,0,1)
# muestra$genero<-as.factor(muestra$genero)
# muestra<-spread(muestra, genero, val)

 m<-muestra%>%
   filter(genero=="M")
 h<-muestra%>%
   filter(genero=="V")
 
mm<-m%>%
  group_by(nombre,genero)%>%
  summarise(n=n())
 
hh<-h%>%
  group_by(nombre,genero)%>%
  summarise(n=n())

juntos<-merge(hh,mm,by="nombre")

juntos<-juntos[,-c(2,4)]
colnames(juntos)<-c("nombre","v","m")

muestra$genero_imp<-muestra$genero

juntos$genero_imp<-0
juntos$genero_imp[juntos$m>juntos$v]="M"
juntos$genero_imp[juntos$v>juntos$m]="V"

juntos<-juntos[,-c(2,3)]
muestra<-muestra[,-4]
fusion<-left_join(muestra, juntos, by="nombre")


 