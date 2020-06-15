load("C:/Users/amaia/OneDrive/Escritorio/1 BDATA/DATA SCIENCE/RECU DS/Archivos_examen_ds/muestra02.RData")
#el fichero contiene 297111 instancias (filas) y 3 variables (columnas)
colnames(muestra02)<- c("nif", "nombre", "genero")
# PROCESAMIENTO NIF -------------------------------------------------------
regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"
g <- as.vector(grepl(pattern = regexp, x = df$nif))
df <- df %>% 
  mutate(nif_imp = g)

df <- df %>% 
  filter(df$nif_imp == "TRUE")

df <- df[,-5]

