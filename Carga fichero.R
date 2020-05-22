setwd("C:/Users/USUARIO/OneDrive/MU/MATERIAS/DATA SCIENCE I/Examen_DS/Archivos_examen_ds")

df<-load("muestra22.RData")

#Las dimensiones de Muestra22 son 302711 x 3. Tenemos tres variables var1, var2 y var 3
dim(muestra22)
str(muestra22)
load("muestra22")

#cambiamos el nmbre de las variables
names(muestra22)[1]<-"nif"
names(muestra22)[2]<-"nombre"
names(muestra22)[3]<-"genero"




#miramos la moda
table(muestra22$genero)
muestra22[muestra22$genero=="",which(colnames(muestra22)=="genero")]<-NA
muestra22[muestra22$genero=="X",which(colnames(muestra22)=="genero")]<-NA
muestra22[muestra22$genero=="E",which(colnames(muestra22)=="genero")]<-NA
muestra22[is.na(muestra22$genero),3]<-"V"
#imputamos por la moda ya que la mayoria de las instacias estan sin informar
muestra22%>%
  filter(genero == 'M')
muestra22%>%
  filter(genero == 'V')
.muestra22%>%
  filter(genero == 'E')

muestra22%>%
  filter(genero == 'X')


patata <- "([[:digit:]]{8})([[:alpha:]]{1})"
patata1<-grepl(pattern = patata, x = muestra22$nif)#vemos que en los FALSE no se cumple la condicion que hemos puesto en patata

str_replace(muestra22[,1],"([[:digit:]]{8})([[:alpha:]]{1})",TRUE)


