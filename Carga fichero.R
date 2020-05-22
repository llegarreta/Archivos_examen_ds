
load("C:/Users/Daniel Puente/Desktop/Examen_DS/Archivos_examen_ds/muestra35.RData")

dim(muestra35)
names(muestra35)[1] <- "nif"
names(muestra35)[2] <- "Nombre"
names(muestra35)[3] <- "genero"
names(muestra35)

























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






