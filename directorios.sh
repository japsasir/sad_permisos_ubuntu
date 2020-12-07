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

# Creamos el grupo ATC, el grupo PTC y el grupo ALL. El grupo PTC se crea para cumplir con 'profesores y administradores'
groupadd PTC
groupadd ATC
groupadd ALL

# Añadimos los usuarios PTC y root al grupo PTC
usermod -a -G PTC PTC1
usermod -a -G PTC root

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
# chmod 740= Owner tiene control total.
# chmod 740= Owner tiene control total. Grupo puede leer.
# chmod 720= Owner tiene control total. Grupo puede escribir.
# chmod 770= Owner y grupo tienen control total.
# chmod 777= Todos los permisos a todos los usuarios. ¡Peligro!

# Asignaturas. Propietario PTC1, grupo ALL. 
chown PTC1 -R /home/asignaturas
chgrp ALL -R /home/asignaturas
chmod 664 -R /home/asignaturas

# Profesor, dueño de las carpetas. Su carpeta es prueba de alumnos.
chgrp PTC -R /home/asignaturas/tecnologia/profesor
chmod 770 -R /home/asignaturas/tecnologia/profesor

# Alumnos pueden leer apuntes sin modificar. Pueden crear sugerencias sin ver el resto.
chmod 740 -R /home/asignaturas/tecnologia/alumnos/apuntes
chmod 700 -R /home/asignaturas/tecnologia/alumnos/sugerencias

###-----Comprobación final.-----###

ls -l -R /home/asignaturas