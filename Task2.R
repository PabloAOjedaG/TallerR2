# Tarea (Task) 1. Taller R de Estadistica y Programacion.
# Taller elaborado por:
# Pablo Andres Ojeda Gomez, con codigo 202012899;
# Diana Lucia Sanchez Ruiz, con codigo 202013592;
# Gabriel Perdomo Olmos, con codigo 202013093.
# Version de R 4.1.1

# Configuraciones iniciales
rm(list = ls())
if(!require(pacman)) install.packages("pacman") ; require(pacman)
p_load(rio,tidyverse,skimr, qpcR)
Sys.setlocale("LC_CTYPE", "en_US.UTF-8")


#--------------------------
#-------- PUNTO 1 ---------
#--------------------------

chip <- list ()

#listar todos los archivos xls en el directorio actual
 #argumento para definir i
listxls<-dir(pattern="xls")
 # se crea una lista con los archivos

# se crea un loop para leer los archivos de excel.
for (k in 1:length(listxls)){
  chip[[k]] <- read.csv(listxls[k])
}
str(chip[[1]]) 
