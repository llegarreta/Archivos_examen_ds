load("C:/Users/junep/Desktop/Examen_DS/Archivos_examen_ds/muestra32.RData")
dim(muestra32) #el dataset tiene 337685 observaciones y 3 variables (un código, nombre y el género)

#cambiamos nombre de las columnas
colnames(muestra32) <- c("nif", "nombre", "genero")

#procesamiento del genero
library(stringr)
library(dplyr)
df <- muestra32 %>% 
  mutate(genero_imp = muestra32$genero)

df$nombre <- toupper(df$nombre)

levels(as.factor(df$genero))

df$genero <- ifelse(df$genero=="M" | df$genero=="V", df$genero, 0)

df$genero_imp <- ifelse(df$genero=="M" | df$genero=="V", 1, 0)

df_M <- df %>% 
  filter(df$genero=="M")

df_V <- df %>% 
  filter(df$genero=="V")

df_M <- df_M %>%
  select(nombre,genero_imp) %>% 
  group_by(nombre) %>% 
  summarise(sum = sum(genero_imp), n = n())

df_V <- df_V %>%
  select(nombre,genero_imp) %>% 
  group_by(nombre) %>% 
  summarise(sum = sum(genero_imp), n = n())

#luego habría que comparar las frecuencias de cada uno e imputar el más frecuente, y eliminar las que no tengan

#borramos "HEAD..."
#procesamiento del nif
regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"
g <- as.vector(grepl(pattern = regexp, x = df$nif))
df <- df %>% 
  mutate(nif_imp = g)

df <- df %>% 
  filter(df$nif_imp == "TRUE")

df <- df[,-5]
