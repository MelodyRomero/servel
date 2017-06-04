#!/bin/bash

# USO:
#  pdfservel2csv.sh  [-s] [-u] -o dest file1.pdf [file2.pdf ...]
#
#  -s : No imprime header en el csv
#  -o : Si dest es un directorio el resultado se pondra dentro caso
#       contrario el resultado ira al archivo.
#


USAGE="pdfservel2csv.sh  [-s] [-u] -o dest file1.pdf [file2.pdf ...]"

DEST=""
HEADER="NOMBRE;RUT;SEXO;DOMICILIO ELECTORAL;CIRCUNSCRIPCIÓN;MESA"

while getopts ":so:" opt; do
    case $opt in
        s ) HEADER=""
            ;;
        o ) DEST="$OPTARG"
            [ -z "$DEST" ] && echo "dest debe ser un archivo o directorio" && exit 1
            ;;
        \? ) echo "$USAGE"
             exit 1
             ;;
    esac

done

shift $(($OPTIND - 1))

echo $DEST
echo $HEADER

if [ -d $DEST ]; then
    ONEOUPUT="NO"
else
    ONEOUPUT="YES"
fi

echo $ONEOUPUT
if [ "$ONEOUPUT" = "NO" ]; then
    for file in "$@"; do
        outfile="$DEST/$(basename "$file" .pdf).txt"
        echo "Procesando archivo: $file"
        [ ! -z "$HEADER" ] && echo "$HEADER" > "$outfile"
        pdftotext -layout "$file" - | sed -f clean.sed | sed -f fix.sed | sed -f tocsv.sed >> "$outfile"
    done
    echo "N"
elif [ "$ONEOUPUT" = "YES" ]; then
    [ ! -z "$HEADER" ] && echo "$HEADER" > "$DEST"
    for file in "$@"; do
        echo "Procesando archivo: $file"
        pdftotext -layout "$file" - | sed -f clean.sed | sed -f fix.sed | sed -f tocsv.sed >> "$DEST"
    done
fi
