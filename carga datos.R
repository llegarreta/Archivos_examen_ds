load("C:/Users/llegarreta/Desktop/Examen_ds/Archivos_examen_ds/muestra13.RData")

dim(muestra13)

# la muestra tiene 303136 registros y 3 variables

colnames(muestra13)<-c("nif","nombre","genero")

# analisis genero
muestra13<-muestra13[str_detect(muestra13$nif,"^([:digit:]{8})([:alpha:]{1})$"),]
dim(muestra13)

# El fichero tiene 275190 registros tras el análisis del nif