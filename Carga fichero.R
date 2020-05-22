

#vamos a cambiar los missinng por NAs, para eliminarlos
muestra21$genero[muestra21$genero=='']<-NA
quitasna<-na.omit(muestra21)


#sumamos columna
generos<-muestra21 %>%
  mutate(genero_imp=paste(nombre,genero,sep = '_'))

freqnombres<-generos %>% 
  count(genero_imp)
