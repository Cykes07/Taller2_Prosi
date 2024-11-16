#!/bin/bash

# Función para verificar si la ubicación ingresada es válida
function verificar_ubicacion() {
    while true; do
        if [ -d "$1" ]; then
            echo "Ubicación válida: $1"
            break
        else
            echo "La ubicación ingresada no es válida. Por favor, intenta nuevamente."
            read -p "Ingresa una ubicación válida: " ubicacion
            set -- "$ubicacion"
        fi
    done
}

# Solicitar ubicación al usuario
read -p "Ingresa la ubicación: " ubicacion
verificar_ubicacion "$ubicacion"

# Cambiar a la ubicación indicada
cd "$ubicacion" || exit

# Crear archivo original.txt con listado inicial
find . -exec ls -ld {} \; > original.txt

# Cambiar permisos para los archivos en el directorio actual
find . -maxdepth 1 -type f -exec chmod 743 {} \;

# Cambiar permisos para los archivos en los subdirectorios
find . -mindepth 2 -type f -exec chmod 542 {} \;

# Crear archivo final.txt con listado modificado
find . -exec ls -ld {} \; > final.txt

echo "Proceso completado. Los resultados están en original.txt y final.txt."
