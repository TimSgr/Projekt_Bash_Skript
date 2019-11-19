#!/bin/bash
echo "Geben Sie den Namen der Datei ein, für die Sie ein Backup erstellen möchten"
read DATEI
# if [ "$#" -ne 2 ]; then
#     echo "Sie müssen eine vorhandene Datei angeben";
#     echo "UND einen Ort wo das Backup gespeichert werden soll";
# else
    if [ -z "$DATEI" ];
        then echo "Bitte geben Sie den Namen einer Datei ein";
    else  echo "Datei wird gesucht...";
        if [ -f "$DATEI" ]
              then echo "Die Datei $DATEI existert und wird als Backup gespeichert..."
# fi
fi
fi