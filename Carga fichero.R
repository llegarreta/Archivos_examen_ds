load("C:/Users/ikern/Desktop/Examen_DS/Archivos_examen_ds/muestra30.RData")

colnames(muestra30)
names(muestra30)
names(muestra30)<-c('nif','nombre','género')

#Creo el patrón que cumplen los nif 8 digitos y 1 letra
patron = "([[:digit:]]{8})([[:alpha:]]{1})"

#con str_extract saco las combinaciones que coincidan
a=str_extract(muestra30$nif, patron)

#Lo añado a dataframe
a=data.frame(a)

#Uno la tabla a del patron a la muestra original
muestra30=inner_join(a, muestra30, by = c("a" = "nif"))
