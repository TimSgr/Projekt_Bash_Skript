#!/bin/bash

###Schritt 1  Argumente auslesen
if [ "$#" -ne 2 ]; then
    echo $#
    echo "Sie müssen eine vorhandene Datei angeben";
    echo "UND einen Ort wo das Backup gespeichert werden soll";
else 
    if [ -z "$1" ];
            then echo "Bitte geben Sie den Namen einer Datei ein";
        else  echo "Datei wird gesucht...";
            sleep 1
            if [ -f "$1" ]
                 then echo "Die Datei $1 existert und es wird versucht sie im Ordner $2 zu speichern..."
    sleep 1
    fi
    fi

    FILE=${1%.*}
    EXTN=${1##$FILE}
    cp $FILE{$EXTN,-$(date '+%d-%m-%y')$EXTN}

    Neue_Datei=$FILE-$(date '+%d-%m-%y')$EXTN

    # echo $Neue_Datei
if [ ! -d $2 ]; then
  echo "Der Ordner $2 existiert nicht"
  sleep 2
  echo "Es wird ein neuer Ordner mit dem Namen $2 erstellt..."
  mkdir -p $2;
  echo "Der Ordner wurde erstellt und die Datei wurde gespeichert"
    else echo "Die Datei wird im Ordner $2 gespeichert..."
mv $Neue_Datei /$2

fi
fi