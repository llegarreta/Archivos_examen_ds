load("~/Desktop/Examen_DS/Archivos_examen_ds/muestra03.RData")

str(muestra03)
dim(muestra03)
View(muestra03)

library(dplyr)
# el fichero tiene 306085 filas y 3 columnas
# DNI? Nombre y Género

#Modificamos el nombre de las variables
colnames(muestra03) <- c("NIF","NOMBRE", "GENERO")

# imputaciones de genero --------------------------------------------------

# creamos la columna

muestra03$genero_imp <- NA

# tratamos de ver la frecuencia de los nombres

sort(table(muestra03$NOMBRE))
hombres <- muestra03 %>%
  filter(GENERO=="V")

mujeres <- muestra03 %>%
  filter(GENERO=="M")

sort(table(hombres$NOMBRE))
sort(table(mujeres$NOMBRE))


options(max.print = 99999999)

# para empezar con la imputación, los nombres de mujer más comunes, por ejemplo,
# María, Ana, Cristina, Teresa y demás nombres, también hay compuestos finalizados en o que contienen
# otros, normalmente María o Mari.

library(stringr)

# Primero los pondremos en mayúsculas
muestra03$NOMBRE <-   toupper(muestra03$NOMBRE)

# Pero antes intentaremos corregir los Jose´s porque puede haber conflicto con las Mari Jose´s
# Primero probaremos con algunos nombres comunes de hombre
muestra03$genero_imp[str_detect(muestra03$NOMBRE, pattern = "O$|EL$|JULIO|JOSE|CARLOS|DAVID|MANUEL|PABLO|PEDRO|JUAN|LUIS|CESAR")] <- "V"
# Además de los finalizados por O (aunque podamos cargarnos alguno de mujer)

# Añadimos Rosario y Rocio por lo del paso anterior
# tambien las que finalicen por A y AR
muestra03$genero_imp[str_detect(muestra03$NOMBRE, pattern = "A$|AR$|MARIA|ANA|ROSARIO|ROCIO")] <- "M"

# Muchos nombres vascos de chica acaban en NE
muestra03$genero_imp[str_detect(muestra03$NOMBRE, pattern = "NE$|EN$|TXE$")] <- "M"

# Y los de chicos tienen tambien algunas terminaciones populares
muestra03$genero_imp[str_detect(muestra03$NOMBRE, pattern = "ON$|OSU$|AITZ$|IKA$|ER$|OR$")] <- "V"

sum(is.na(muestra03$genero_imp))
# Vemos que de 306085 entradas solo nos quedan sin imputar 57716, algo menos del 20%
# pero tampoco hay que tomar mucho tiempo en este paso.
#Borramos las entradas sin imputar

library(dplyr)
muestra03 <- muestra03 %>%
  filter(is.na(genero_imp)==FALSE)


# Imputaciones NIF --------------------------------------------------------

muestra03$NIF <-   toupper(muestra03$NIF)
muestra03$NIF[gsub("^[:alpha:]","",muestra03$NIF)]
muestra03$NIF[!str_detect(muestra03$NIF, pattern = "[:digit:]{8}[:upper:]{1}")] <- NA
muestra03$NIF

library(dplyr)
muestra03 <- muestra03 %>%
  filter(is.na(NIF)==FALSE)

dim(muestra03)

# se nos queda una dimensión de 230619 filas y 4 columnas

