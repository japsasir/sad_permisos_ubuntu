# sad-permisos-ubuntu
Práctica cinco de la asignatura IAW de 2º de Asir.

> IES Celia Viñas (Almería) - Curso 2020/2021
Módulo: SAD - Seguridad y alta disponibilidad
Ciclo: CFGS Administración de Sistemas Informáticos en Red

**Archivos en el repositorio**
------------
1. Info del repositorio
2. Script para crear directorios con sus permisos correspondientes

**Pasos seguidos**
------------

***Creación de usuarios y grupos***

- Creamos los usuarios: PTC, ATC1, ATC2, ATC3
- Creamos el grupo ATC
- Asignamos los usuarios ATC1, ATC2, ATC3

***Creamos el sistema de carpetas y los ficheros txt***
****Sistema de carpetas****
- Carpeta asignaturas -Sin CREATOR_OWNER o SYSTEM (equivalente)
	- Carpeta tecnología -SIN ACL USUARIO, añade user PTC y grupo ATC
		- Carpeta profesor -ACL Administrtadores y PTC, todos derechos
			- Carpetas 'Notas' y 'Examenes' ACL heredada  de profesor.
		- Carpeta Alumnos-Administradores, PTC y ATC. Todos derchos.
			- Carpetas 'Apuntes' y 'Sugerencias'. ACL heredada
****Ficheros txt****
- Notas>Notas.txt
- Examen>Examen.txt
- Apuntes>Apuntes.txt
- Sugerencias>Sugerencias.txt