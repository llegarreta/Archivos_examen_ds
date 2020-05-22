load("C:/Users/Usuario/Desktop/Examen_DS/Archivos_examen_ds/muestra11.RData")
dim(muestra11)
#Las dimensiones son 296686 filas y 3 columnas.
colnames(muestra11)<-c("nif","nombre","genero")

#Expresiones regulares
regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"
grepl(pattern = regexp, x = muestra11$nif)
prueba<-grepl(pattern = regexp, x = muestra11$nif)
objeto_vector<-as.vector(which(prueba, arr.ind=FALSE))
muestra11<-muestra11[c(objeto_vectcor),]
 dim(muestra11)
 
 #Cambiamos nombres
 unique(muestra11$genero)#Aqui miro los diferentes nombres que hay en genero
 
 Hombres<- muestra11%>%
   filter(genero=="V") #Separo en una tabla los datos de los que sean hombres
 
 Mujeres<- muestra11%>%
   filter(genero=="M") #Separo en una tabla los datos de los que sean mujeres
 
 name <- Hombres$nombre
 Tabla_frecuencias_Hombres <- sort(table(name))#Aqui estoy diciendo que me haga una tabla con los nombre
                                              #en una columna llamada name y te cuente cuantas veces sale el nombre 
 (tabla_frecuencias_Hombres <- as.data.frame(Tabla_frecuencias_Hombres)) #estas diciendo que me covierta la tabla 
                                                                         #a data.frame
 
 name <- Mujeres$nombre
 Tabla_frecuencias_Mujeres <- sort(table(name))
 (tabla_frecuencias_Mujeres <- as.data.frame(Tabla_frecuencias_Mujeres))#Es lo mismo que el paso anterior pero con las mujeres
 
 View(tabla_frecuencias_Mujeres)
 View(tabla_frecuencias_Hombres)
 frecuencias<-full_join(tabla_frecuencias_Mujeres, tabla_frecuencias_Hombres, by="name") #Aqui lo que hago es que me junte 
                 #las dos tablas de frecuencias la de hombre y mujer en un data.frame por la columna name
 View(frecuencias)
 colnames(frecuencias)<- c("nombre", "M", "V") #Aqui una vez juntados las dos tablas de frecuencias por la columna nombre
 frecuencias[is.na(frecuencias)] <- 0 #Al juntar las dos tablas hay valores que me salen como NA
                                       #Entonces hay lo que le estoy diciendo es que esos valores me los pongan a 0,
                                       #Cuando hago esto los hombres tienen como valor 1 y las mujeres 0.
 
 (frecuencias)
 
 frecuencias$genero_imp[frecuencias$M>frecuencias$V]="M" #Como ya he dicho antes los hombres tienen valor 1 y las mujeres 0
                                                    #entonces le estas diciendo que si la columna M es mayor que la V
                                                    #entonces en la nueva columna ponme "M"
 frecuencias$genero_imp[frecuencias$V>frecuencias$M]="V"#Lo contrario de lo de arriba.
 View(frecuencias)
 
 muestra11$nombre<-toupper(muestra11$nombre)
 frecuencias$nombre<-toupper(frecuencias$nombre)
 
 final<-full_join(muestra11, frecuencias, by="nombre")
 
 final<-final[-c(4,5)]
 View(final)
 