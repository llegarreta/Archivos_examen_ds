library(stringr)
library(dplyr)
load("C:/Users/javie/Desktop/git/Examen_DS/Archivos_examen_ds/muestra31.RData")
dim(muestra31)
#309084      3
colnames(muestra31)<-c('nif','nombre','genero')
<<<<<<< HEAD
nchar(muestra31$nif)
sprintf("La largura deberia ser 9 y es %s para el nif %s",nchar(muestra31$nif),muestra31[,1])
buscar<-c("[0-9]{8}","[A-Z]")
muestra31$a<-stringr::str_detect(pattern=buscar,muestra31$nif) 
muestra31<-muestra31 %>%
filter(a==TRUE)

muestra31<-muestra31[,-4]
dim(muestra31)
#294427      3
=======
muestra31$genero_imp<-muestra31$genero
unique(muestra31$nombre)
Varon<-muestra31 %>%
  filter(stringr::str_detect("V",muestra31$genero)==TRUE)
Mujer<-muestra31 %>%
  filter(stringr::str_detect("M",muestra31$genero)==TRUE)
# V1<-c(unique(Varon$nombre))
# M1<-c(unique(Mujer$nombre))
# V2<-V1[1:10]
# M2<-M1[1:10]
# muestrita31<-muestra31[1:10,]
# for(i in dim(muestra31)[1]){
#   for(k in length(V1)){
#     for(j in length(M1)){
#       if(muestra31[i,2]==V1[k]){
#         muestrita31[i,4]<-"V"
#       }ifelse(muestrita31[i,2]==M2[j]){
#         muestrita31[i,4]<-"M"
#       }else{
#         muestrita31[i,4]<-"Indefinido"
#       }
#     }
#   }}





Varon1<-Varon %>%
  group_by(nombre)%>%
  summarise(count(nombre))

genero$genero_imp[genero$n_M>genero$n_V]="M"
genero$genero_imp[genero$n_V>genero$n_M]="V"
>>>>>>> rama-genero
