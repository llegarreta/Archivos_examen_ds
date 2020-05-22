
library(dplyr)

load("C:/Users/34688/Documents/EXAMEN_DS/Archivos_examen_ds/muestra23.RData")
names(muestra23)[1]<-"nif"
names(muestra23)[2]<-"nombre"
names(muestra23)[3]<-"genero"


tabla<-table(muestra23$nombre, muestra23$genero)
tabla<-tabla[,c(3,4)]
tabla

mutate(muestra23,n_M=tabla[,2])
mutate(muestra23,n_V=tabla[,3])
muestra23$genero_imp[muestra23$n_M>muestra23$n_V]="M"
muestra23$genero_imp[muestra23$n_V>muestra23$n_M]="V"
# he intentado crear una funcion en base a las frecuencias luego imputar pero no tengo tiempo para seguir.


clean.text <- function(string){
  string <- grep("[[:digit:]{8}][[:alpha:]{1}]", "", TRUE)
  
  return(string)
}

apply(muestra23[1],1,clean.text)

#con este apply mantenemos solo los nif que esten bien completados
dim(muestra23)
#las dimensiones son 338085 x 3 teniendo en cuenta que las imputaciónes no han funcionado