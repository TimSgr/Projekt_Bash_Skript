#!/bin/bash
echo "Geben Sie den Namen der Datei ein, für die Sie ein Backup erstellen möchten"
read DATEINAME ORT
# if [ "$#" -ne 2 ]; then
#     echo $#
    # echo "Sie müssen eine vorhandene Datei angeben";
    # echo "UND einen Ort wo das Backup gespeichert werden soll";
# else
    if [ -z "$DATEINAME" ];
            then echo "Bitte geben Sie den Namen einer Datei ein";
        else  echo "Datei wird gesucht...";
            if [ -f "$DATEINAME" ]
                 then echo "Die Datei $DATEINAME existert und es wird versucht sie im Ordner $ORT zu speichern..."
    fi
    fi
fi

    FILE=${DATEINAME%.*}
    EXTN=${DATEINAME##$FILE}
    cp $FILE{$EXTN,-$(date '+%Y-%m-%d')$EXTN}

if [ ! -d $ORT ]; then
  echo "Der Ordner $ORT existiert nicht"
  echo "Es wird ein neuer Ordner mit dem Namen $ORT erstellt"
  mkdir -p $ORT;
    else echo "Die Datei wird im Ordner $ORT gespeichert..."

fi