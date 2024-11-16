#!/bin/bash

function verificar_ubicacion() {
    while true; do
        if [ -d "$1" ]; then
            echo "Ubicación válida: $1"
            break
        else
            echo "Ubicación no válida. Intenta de nuevo"
            read -p "Ingresa una ubicación válida: " ubicacion
            set -- "$ubicacion"
        fi
    done
}

read -p "Ingresa la ubicación: " ubicacion
verificar_ubicacion "$ubicacion"

cd "$ubicacion" || exit

find . -exec ls -ld {} \; > original.txt

find . -maxdepth 1 -type f -exec chmod 743 {} \;

find . -mindepth 2 -type f -exec chmod 542 {} \;

find . -exec ls -ld {} \; > final.txt

echo "Archivos generados con éxito."
