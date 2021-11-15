# Tarea (Task) 1. Taller R de Estadistica y Programacion.
# Taller elaborado por:
# Pablo Andres Ojeda Gomez, con codigo 202012899;
# Diana Lucia Sanchez Ruiz, con codigo 202013592;
# Gabriel Perdomo Olmos, con codigo 202013093.
# Version de R 4.1.1

# Configuraciones iniciales
rm(list = ls())
if(!require(pacman)) install.packages("pacman") ; require(pacman)
p_load(rio,tidyverse,skimr, qpcR, readxl)
Sys.setlocale("LC_CTYPE", "en_US.UTF-8")


#--------------------------
#-------- PUNTO 1 ---------
#--------------------------

#Creamos la lista vacía
chip <- list ()

#Listamos todos los archivos xls en el directorio actual
#Argumento para definir 
listxls <- list.files(pattern="*.xls", recursive = TRUE)

#Comando inspirado por la página StackOverflow. Link:
browseURL("https://stackoverflow.com/questions/32888757/how-can-i-read-multiple-excel-files-into-r")

#Creamos un loop para leer los archivos de excel.
for (k in 1:length(listxls)){
  chip[[k]] = import(file = listxls[k])
}

#--------------------------
#-------- PUNTO 2 ---------
#--------------------------

#Creamos la función que nos saque el valor de Pago para Educación 
f_extrac = function(i,lista,categoria){
  lista_i = lista[[i]] 
  colnames(lista_i) = lista_i[7,]
  pago = lista_i %>% subset(NOMBRE==categoria) %>% select(`PAGOS(Pesos)`)
  return(pago)
}
f_extrac(i = 10 , lista = chip , categoria = "EDUCACIÓN")

#Ahora, le agregamos a la función que nos saque el código DANE y el periodo
f_extrac = function(i,lista,categoria){
  
#Creamos el dataframe
df = data.frame(pago=NA,codigo_dane=NA,periodo=NA)  
lista_i = lista[[i]] 
  
#Extraemos el código, el periodo y el valor del pago
df$codigo_dane = colnames(lista_i)[1]
  
df$periodo = lista_i[2,1]
  
colnames(lista_i) = lista_i[7,]
df$pago = lista_i %>% subset(NOMBRE==categoria) %>% select(`PAGOS(Pesos)`)
  
  return(df)  
}
f_extrac(i = 10 , lista = chip , categoria = "EDUCACIÓN")
