
load("C:/Users/Daniel Puente/Desktop/Examen_DS/Archivos_examen_ds/muestra35.RData")

dim(muestra35)
names(muestra35)[1] <- "nif"
names(muestra35)[2] <- "Nombre"
names(muestra35)[3] <- "genero"
names(muestra35)

View(muestra35)
muestra35[muestra35 == ""] <- NA
muestra35[muestra35 == 0] <- NA
str(muestra35)

regexp <- "([[:digit:]]{8})"
a <- which(grepl(regexp, muestra35$nif)==T)
a <- muestra35[a,]
dim(a)
a$nif <- substr(a$nif, 1,9)
muestra35 <- a
dim(muestra35)
regexp <- "([A-Z]{1})"
muestra35 <- muestra35[which(grepl(regexp, muestra35$nif)==T),]
View(muestra35)



