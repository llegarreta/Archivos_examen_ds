load('muestra40.RData')
library(dplyr)
#El fichero tiene 339685 filas y 3 columnas

muestra40 <- muestra40 %>% 
  rename('nif' = 'var1',
         'nombre' = 'var2',
         'genero' = 'var3')

# Analizo el NIF ----------------------------------------------------------
formato_correcto <- grepl('[[:digit:]]{8}[[:alpha:]]{1}', muestra40$nif)
formato_correcto
formato_correcto1 <- which(formato_correcto == T)
df_nice <- muestra40[formato_correcto1, ]

