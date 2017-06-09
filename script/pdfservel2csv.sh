#!/bin/bash
#
#  Este  script toma  los datos  del  padron electoral  del servel  en
#  formato PDF y los transforma a formato de texto plano csv, el error
#  en el parseo de los datos es del 0.58% para el padron electoral del
#  2016 el cual contiene 13846209 registros
#
# USO:
#  pdfservel2csv.sh  [-s]  -o dest file1.pdf [file2.pdf ...]
#
#  -s : Genera csv [S]in header
#  -o : Si dest  es un directorio se generara un csv  por cada pdf, si
#       dest  es el  nombre  de un  archivo se  generara  solo un  csv
#       conteniendo todos los registros
#



DEST=""
USAGE="Uso: ./pdfservel2csv.sh  [-s] -o dest file1.pdf [file2.pdf ...]"
HEADER="NOMBRE;RUT;SEXO;DOMICILIO ELECTORAL;CIRCUNSCRIPCIÓN;MESA"

while getopts ":so:" opt; do
    case $opt in
        s )
            HEADER=""
            ;;
        o )
            DEST="$OPTARG"
            if [[ -d ${DEST} ]]; then
                ONEOUPUT="NO"
            else
                if touch $DEST 2> /dev/null ; then
                    ONEOUPUT="YES"
                else
                    echo "Opcion -$opt requiere un existente directorio o una ruta valida de archivo"
                    exit 1
                fi
            fi
            ;;
        \? )
            echo "Opcion invalida: -$OPTARG"
            echo "$USAGE"
            exit 1
            ;;
        : )
            echo "Opcion -$OPTARG require un argumento."
            echo "$USAGE"
            exit 1
            ;;
    esac

done


shift $(($OPTIND - 1))
if [[ $# -eq 0 ]]; then
    echo "Al parecer no ha especificado archivos para la conversión"
    echo "$USAGE"
fi


for file in "$@"; do
    if [[ ! -e $file ]]; then
        echo -e "Archivo: $file, \n No existe" >&2
        echo "$USAGE"
        exit 1
    fi
done

# clean_sed : Quita headers de los archivos PDF
# fix_sed   : pdftotext falla en formatear algunas lineas (filas aparecen en multiples lineas)
# tocsv_sed : Heurística para detectar/marcar las columnas del archivo,  (el orden en que se aplica es necesario)

clean_sed="/REPUBLICA/,/NOMBRE.*SEXO.*MESA$/d"
fix_sed="N;N;N;N; s/\n  */ /; P; D"
tocsv_sed="s/\s\{3,\}MUJ\s\{4,\}/\;MUJ\;\;/ ; s/\s\{3,\}VAR\s\{4,\}/\;VAR\;\;/ ; s/\s\{3\}MUJ\s\s\s/\;MUJ\;/ ; s/\s\{3\}VAR\s\s\s/\;VAR\;/ ; s/\s\{3,\}/\;/g"

if [ "$ONEOUPUT" = "NO" ]; then
    for file in "$@"; do
        outfile="$DEST/$(basename "$file" .pdf).txt"
        echo "Procesando archivo: $file"
        [ ! -z "$HEADER" ] && echo "$HEADER" > "$outfile"
        pdftotext -layout "$file" - | sed -e "$clean_sed" | sed -e "$fix_sed" | sed -e "$tocsv_sed" >> "$outfile"
    done
    echo "N"
elif [ "$ONEOUPUT" = "YES" ]; then
    [ ! -z "$HEADER" ] && echo "$HEADER" > "$DEST"
    for file in "$@"; do
        echo "Procesando archivo: $file"
        pdftotext -layout "$file" - | sed -e "$clean_sed" | sed -e "$fix_sed" | sed -e "$tocsv_sed" >> "$DEST"
    done
fi
