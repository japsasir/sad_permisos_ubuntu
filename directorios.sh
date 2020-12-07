#!/bin/bash
###---------------------------------- ###
### Script para directorios en Ubuntu ###
###---------------------------------- ###

# Configuramos el script para que muestre los comandos por consola
set -x

###-----Creamos los usuarios.-----###

# Creamos el usuario ATC1.
useradd -p practicas ATC1
# Creamos el usuario ATC2.
useradd -p practicas ATC2
# Creamos el usuario ATC3.
useradd -p practicas ATC3
# Creamos el usuario PTC1.
useradd -p practicas PTC1

## Creamos los grupos

# Creamos el grupo ATC. Recordemos que PTC no tendrá grupo.
groupadd ATC
groupadd ALL

# Añadimos los usuarios ATC1, ATC2, ATC3 al grupo ATC.
usermod -a -G ATC ATC1
usermod -a -G ATC ATC2
usermod -a -G ATC ATC3

# Añadimos todos los usuarios al grupo ALL
usermod -a -G ALL ATC1
usermod -a -G ALL ATC2
usermod -a -G ALL ATC3
usermod -a -G ALL PTC1
usermod -a -G ALL root
## Opcional: Comprobar que se ha aplicado correctamente con 'groups ATC1'

###-----Creamos los directorios. Introducimos un archivo de texto personalizado donde corresponde.-----###
mkdir /home/asignaturas
mkdir /home/asignaturas/tecnologia
mkdir /home/asignaturas/tecnologia/profesor
mkdir /home/asignaturas/tecnologia/profesor/notas
echo "Estas son las notas de los alumnos." > /home/asignaturas/tecnologia/profesor/notas/Notas.txt
mkdir /home/asignaturas/tecnologia/profesor/examenes
echo "Estos son los examenes de los alumnos." > /home/asignaturas/tecnologia/profesor/examenes/Examen.txt
mkdir /home/asignaturas/tecnologia/alumnos
mkdir /home/asignaturas/tecnologia/alumnos/apuntes
echo "Estos son los apuntes de los alumnos." > /home/asignaturas/tecnologia/alumnos/apuntes/Apuntes.txt
mkdir /home/asignaturas/tecnologia/alumnos/sugerencias
echo "Estas son las sugerencias de los alumnos." > /home/asignaturas/tecnologia/alumnos/sugerencias/Sugerencias.txt

###-----Asignamos permisos a los directorios.-----###

# Sintaxis: 'chgrp [opciones] nuevo_grupo nombre_de_objeto' Grupo asignado a carpeta.
# Sintaxis: 'chmod Tipo de permiso Ruta_Archivo' Permisos a archivo o carpeta.

# https://chmodcommand.com para obtener rápido los permisos de usuarios.
# chmod 660= Owner y grupo asignado pueden leer y escribir.
# chmod 664= Owner y grupo pueden leer y escribir. Otros pueden leer.
# chmod 700= Owner tiene control total. Nadie más toca nada. (Profesor)
# Chmod 777= Todos los permisos a todos los usuarios.
# Asignaturas
chgrp ALL -R /home/asignaturas
chmod 664 -R /home/asignaturas

# Tecnologia
chmod 664 /home/asignaturas/tecnologia

# Profesor, amo y señor de su carpeta a prueba de alumnos.
chown PTC1 -R /home/asignaturas/tecnologia/profesor
chmod 700 -R /home/asignaturas/tecnologia/profesor

# Alumnos
chgrp ALL /home/asignaturas/tecnologia/alumnos
chmod 777 -R

###-----Comprobación final.-----###

ls -l -R /home/asignaturas