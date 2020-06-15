load("C:/Users/amaia/OneDrive/Escritorio/1 BDATA/DATA SCIENCE/RECU DS/Archivos_examen_ds/muestra02.RData")
#el fichero contiene 297111 instancias (filas) y 3 variables (columnas)
colnames(muestra02)<- c("nif", "nombre", "genero")

#procesamiento del genero
library(stringr)
library(dplyr)
df <- muestra02 %>% 
  mutate(genero_imp = muestra02$genero)

df$nombre <- toupper(df$nombre) #IGUALAR TODOS LOS NOMBRES

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

for(i in 1:length(df$nombre)){
  if((df$nombre[df$genero_imp==0])[i]%in%df_V[1:7977,1]){
    df$genero[i]=="V"
  }
}
for(i in 1:length(df$nombre)){
  if((df$nombre[df$genero_imp==0])[i]%in%df_M[1:7977,1]){
    df$genero[i]=="M"
  }
}
df$genero<-ifelse(df_M)
#luego habrÃ?a que comparar las frecuencias de cada uno e imputar el mÃ¡s frecuente, y eliminar las que no tengan