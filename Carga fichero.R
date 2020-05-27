load("~/Desktop/Examen_DS/Archivos_examen_ds/muestra12.RData")
dim(muestra12)
colnames(muestra12)

#dimensiones: 342111 filas y 3 columnas
# > dim(muestra12)
# [1] 342111      3

names(muestra12) <- c("nif", "nombre", "genero")
names(muestra12)

#regexp <- "([[:digit:]]{8}) ([[:alpha:]]{1})"
#grepl(pattern = regexp, x = muestra12$nif)


regexp <- "([[:digit:]]{8}) ([[:alpha:]]{1})"
grepl(pattern = regexp, x = muestra12$nif)


