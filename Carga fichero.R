
load("C:/Users/Daniel Puente/Desktop/Examen_DS/Archivos_examen_ds/muestra35.RData")

# Comprobamos las dimensiones del dataset
dim(muestra35)

# Cambimos los nombres

names(muestra35)[1] <- "nif"
names(muestra35)[2] <- "Nombre"
names(muestra35)[3] <- "genero"
names(muestra35)

# Imputamos por NA los valores erroneos

View(muestra35)
muestra35[muestra35 == ""] <- NA
muestra35[muestra35 == 0] <- NA
str(muestra35)

# Dejamos los usuarios con 8 digitos y una letra en el nif

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



# Genero

# Imputamos aquellas varibales de genero que no sabemos lo que son por NA

names(muestra35)
muestra35[muestra35 == "E"] <- NA
muestra35[muestra35 == "X"] <- NA

# Generamos la varaible de genero

muestra35 <- muestra35%>%
  mutate(genero_imp = genero)


# Realizamos agrupaciones para comprender la muestra correctamente

cantidad_nombres <- muestra35%>%
  group_by(Nombre)%>%
  summarise(n = n())%>%
  arrange(desc(n))
View(cantidad_nombres)

cantidad_genero <- muestra35%>%
  group_by(genero)%>%
  summarise(n = n())
View(cantidad_genero)

cantidad_nombres <- muestra35%>%
  group_by(Nombre, genero_imp)%>%
  summarise(n = n())%>%
  arrange(desc(n))
View(cantidad_nombres)

# Puesto que el tiempo, es limitado se van a imputar los nombres más repetidos 

dim(muestra35)
dim(muestra)
dim(a)

which()

a <- which(muestra35$Nombre =="JOSE")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="ANTONIO")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="MARIA")
muestra35[a,4] = "M"
a <- which(muestra35$Nombre =="JAVIER")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="MANUEL")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="FRANCISCO")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="JESUS")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="CONVERSION")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="ANA")
muestra35[a,4] = "M"
a <- which(muestra35$Nombre =="JUAN")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="JOSE LUIS")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="DAVID")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="FERNANDO")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="MARI CARMEN")
muestra35[a,4] = "M"
a <- which(muestra35$Nombre =="ANGEL")
muestra35[a,4] = "M"
a <- which(muestra35$Nombre =="CRISTINA")
muestra35[a,4] = "M"
a <- which(muestra35$Nombre =="CARMEN")
muestra35[a,4] = "M"
a <- which(muestra35$Nombre =="CARLOS")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="FRANCISCO JAVIER")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="PEDRO")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="LUIS")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="ALBERTO")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="JOSE ANTONIO")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="MIGUEL")
muestra35[a,4] = "V"
a <- which(muestra35$Nombre =="ISABEL")
muestra35[a,4] = "M"
unique(cantidad_nombres$Nombre)



