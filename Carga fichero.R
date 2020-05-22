load("C:/Users/ander/OneDrive/Documentos/UNI/DATA SCIENCE/EXAMEN_DS/Archivos_examen_ds/muestra38.RData")
str(muestra38)
dim(muestra38)

#Es un df con 3 variables con 300110 entradas

names(muestra38)[1] = "nif"
names(muestra38)[2] = "nombre"
names(muestra38)[3] = "genero"
