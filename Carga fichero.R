
setwd("C:/Users/Leire/OneDrive - Mondragon Unibertsitatea/BDatA/Data Science/Introducción a Git-GitHub/Examen_DS/Archivos_examen_ds")
load("muestra07.RData")

dim(muestra07)
str(muestra07)
# Este fichero contiene 335086 filas y 3 columnas 

names(muestra07)

colnames(muestra07) <- c("nif", "nombre" , "genero")
str(muestra07)


# Procesamiento del nif. --------------

unique(muestra07$nif)

muestra07[muestra07 == ""] <- NA
muestra07[muestra07 == 0] <- NA
sum(is.na(muestra07$nif))

# Cuantos tienen 8 digitos?
regexp <- "([[:digit:]]{8})"
grepl(pattern = regexp, x = muestra07$nif)

# y Cuantos una letra mayuscula al final?
regexp <- "([[:digit:]]{8}[A-Z]$)"
grepl(pattern = regexp, x = muestra07$nif)


#suponiendo que eso es lo correcto
sum(grepl(pattern = regexp, x = muestra07$nif))/nrow(muestra07) #el 90% es correcto

muestra07.2<-muestra07[grepl(pattern = regexp, x = muestra07$nif),]

# Este fichero contiene 303909 filas y 3 columnas 

# El apartado procesamiento de genero despues de procesamiento del nif
# Procesamiento del genero ------------

unique(muestra07$genero)
library(dplyr)
muestra07$genero2<-muestra07$genero
unique(muestra07$genero2)
muestra2<-muestra07 %>%
  filter(muestra07$genero2=="" |muestra07$genero2=="X" |muestra07$genero2=="E")
muestra2$genero2<-NA
muestra07<-muestra07 %>%
  filter(muestra07$genero2=="M" |muestra07$genero2=="V")
muestra07<-rbind(muestra07,muestra2)

sum(is.na(muestra07$genero2)) /nrow(muestra07)
# El 59 % son NAs
unique(muestra07$genero2)

names(muestra07)[4]<-"genero_imp"

mujeres<-muestra07 %>%
  filter(genero_imp=="M")

hombres<-muestra07 %>%
  filter(genero_imp=="V")

m<-mujeres %>%
  group_by(nombre,genero_imp)%>%
  summarise(n=n())

h<-hombres %>%
  group_by(nombre,genero_imp)%>%
  summarise(n=n())
comparacion<-m %>%
  full_join(h, by="nombre", suffix=c(".m", ".h"))

sum(is.na(comparacion$nombre))

comparacion[which(is.na(comparacion$n.h)),][5]<-0
comparacion[which(is.na(comparacion$n.m)),][3]<-0
comparacion<-comparacion[,-4]
m_b<-comparacion[which(comparacion$n.m>comparacion$n.h),]
m_b$genero_imp.m<-"M"

h_b<-comparacion[which(comparacion$n.h>comparacion$n.m),]
h_b$genero_imp.m<-"V"

ambos<-comparacion[which(comparacion$n.h==comparacion$n.m),]
ambos$genero_imp.m<-"v" #criterio propio: he mirado los nombres

corregido<-rbind(m_b,h_b, ambos)
names(corregido)

muestra07<-merge(muestra07,corregido, by="nombre")
names(muestra07)
muestra07<-muestra07[,-c(4,6,7)]
names(muestra07) [4]<- "genero_imp"
>>>>>>> rama-genero
