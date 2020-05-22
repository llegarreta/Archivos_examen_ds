load('C:/Users/usuario/OneDrive/Escritorio/Examen_DS/Archivos_examen_ds/muestra36.RData')
 dim(muestra36)
 # El dataset muestra 36 contiene: 337685 filas y 3 columnas (variables)
 
colnames(muestra36) <- c('nif', 'nombre', 'genero')









### GENERO
library(dplyr)

#Como X y E no nos aportan informacion nos las cargamos
muestra36[muestra36$genero == 'X' | muestra36$genero == 'E', 'genero'] <- ""

#Poner los nombres en mayusculas
muestra36$nombre <- str_to_upper(muestra36$nombre)

#Dividimos varones y mujeres
varones <- muestra36[muestra36$genero == 'V',]
mujeres <- muestra36[muestra36$genero == 'M',]

#Sacamos las tablas de frecuencia
frecuencia_varones <- as.data.frame(table(varones$nombre))
frecuencia_mujeres <- as.data.frame(table(mujeres$nombre))

#Pasamos a numeric
frecuencia_mujeres[,2] <- as.numeric(frecuencia_mujeres[,2])
frecuencia_varones[,2] <- as.numeric(frecuencia_varones[,2])

#Ponemos el nombre de la columna bien
colnames(frecuencia_varones) <- c('nombre', 'frecuencia_varon')
colnames(frecuencia_mujeres) <- c('nombre', 'frecuencia_mujer')


#Juntamos las frecuencias de los dos generos
frecuencia_total <- frecuencia_mujeres %>% full_join(frecuencia_varones, by = 'nombre')

#Quitamos NA's
frecuencia_total[is.na(frecuencia_total)] <- 0

#Elegimos los numeros más altos
frecuencia_total$genero[frecuencia_total$frecuencia_mujer > frecuencia_total$frecuencia_varon] <- 'M'
frecuencia_total$genero[frecuencia_total$frecuencia_mujer < frecuencia_total$frecuencia_varon] <- 'V'
frecuencia_total$genero[frecuencia_total$frecuencia_mujer == frecuencia_total$frecuencia_varon] <- '' 

#Nos quedamos solo con nombre y genero
frecuencia_total <- frecuencia_total %>% select(nombre, genero)

#Como la cantidad de veces que se repite tanto un genero como el otro es igual y no podemos ir mirando de uno en uno, dejamos vacio

#Lo imputamos los nombres en el df original
muestra36 <- muestra36 %>% full_join(frecuencia_total, by = 'nombre')
colnames(muestra36) <- c("nif", "nombre", "genero.x", "genero")

#Nos quedamos con el genero imputado
muestra36 <- muestra36 %>% select(nif, nombre, genero)

#Quitamos los generos no informados
muestra36 <- muestra36[!is.na(muestra36$genero),]
muestra36 <- muestra36[muestra36$genero != '',]

remove(frecuencia_mujeres, frecuencia_varones, frecuencia_total, mujeres, varones
       )
