load('muestra40.RData')
library(dplyr)
#El fichero tiene 339685 filas y 3 columnas

muestra40 <- muestra40 %>% 
  rename('nif' = 'var1',
         'nombre' = 'var2',
         'genero' = 'var3')
