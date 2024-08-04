#!/bin/bash

# Dirección para comprobar la conectividad
CHECK_HOST="google.com"

# Archivo .http a ejecutar
HTTP_FILE="main.http"

# Función para comprobar conectividad
check_connectivity() {
    if ping -c 1 $CHECK_HOST &> /dev/null
    then
        return 0
    else
        return 1
    fi
}

# Comprobar la conectividad y ejecutar el archivo .http si está conectado
if check_connectivity
then
    echo "Conectado a la red. Ejecutando $HTTP_FILE..."
    # Aquí puedes poner el comando para ejecutar el archivo .http.
    # Por ejemplo, si usas HTTPie:
    http -v < $HTTP_FILE
else
    echo "No estás conectado a una red."
fi
