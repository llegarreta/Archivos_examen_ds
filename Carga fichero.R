# CARGA FICHERO ----------------------------------------------------------
load("C:/Users/amaia/OneDrive/Escritorio/1 BDATA/DATA SCIENCE/RECU DS/Archivos_examen_ds/muestra02.RData")

# COMENTARIO DIMS ---------------------------------------------------------
#el fichero contiene 297111 instancias (filas) y 3 variables (columnas)
# NOMBRE COLS -------------------------------------------------------------
colnames(muestra02)<- c("nif", "nombre", "genero")

# PROCESAMIENTO GÉNERO ----------------------------------------------------
library(stringr)
library(dplyr)
df <- muestra02 %>% 
  mutate(genero_imp = muestra02$genero)

df$nombre <- toupper(df$nombre)#IGUALAR TODOS LOS NOMBRES
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

df_M<-df_M%>%
  select(nombre, sum)%>%
  arrange(desc(sum))
df_V<-df_V%>%
  select(nombre, sum)%>%
  arrange(desc(sum))

muestra02$genero_imp[str_detect(muestra02$nombre, pattern = "O$|EL$|JULIO|JOSE|CARLOS|DAVID|MANUEL|PABLO|PEDRO|JUAN|LUIS|CESAR")] <- "V"
df$genero<-ifelse(df_M)
muestra02$genero_imp[str_detect(muestra02$nombre, pattern = "A$|AR$|MARIA|ANA|ROSARIO|ROCIO")] <- "M"

