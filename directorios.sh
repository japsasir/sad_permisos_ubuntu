#!/bin/bash
###---------------------------------- ###
### Script para directorios en Ubuntu ###
###---------------------------------- ###

# Configuramos el script para que muestre los comandos por consola
set -x

## Creamos los usuarios.

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

# Añadimos los usuarios ATC1, ATC2, ATC3 al grupo ATC.
usermod -a -G ATC ATC1
usermod -a -G ATC ATC2
usermod -a -G ATC ATC3

## Opcional: Comprobar que se ha aplicado correctamente con
# groups ATC1

