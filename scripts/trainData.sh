#!/usr/bin/env bash
set -ex

# Training
GPU_ID=0
DISPLAY_ID=$((GPU_ID*10+10))

# Carpeta donde se encuentran las imágenes OBJ
input_folder="./sample_obj"

# Carpeta donde está el modelo rp_dennis_posed_004_OBJ
model_folder="rp_dennis_posed_004_OBJ"

# # Comprobar si pyembree está instalado
# if ! python -c "import pyembree" &> /dev/null; then
#     echo "Error: pyembree no está instalado. Instálalo antes de continuar."
#     exit 1
# fi

# Iterar sobre cada archivo en la carpeta de entrada
for file in $input_folder/*.obj; do
    # Obtener el nombre del archivo sin la extensión
    filename=$(basename -- "$file")
    filename_no_ext="${filename%.*}"

    # Construir la ruta completa al modelo rp_dennis_posed_004_OBJ
    path_to_model="$model_folder/$filename_no_ext"

    # Ejecutar el script prt_util para cada archivo
    # python -m apps.prt_util -i "$path_to_model"
    echo "Ejecutando prt_util para $path_to_model"
done

echo "Proceso completado."