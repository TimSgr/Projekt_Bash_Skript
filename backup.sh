#!/bin/bash
echo "Geben Sie den Namen der Datei ein, für die Sie ein Backup erstellen möchten"
read DATEINAME ORT
if [ -z "$DATEINAME" ];
        then echo "Bitte geben Sie den Namen einer Datei ein";
    else  echo "Datei wird gesucht...";
        if [ -f "$DATEINAME" ]
              then echo "Die Datei $DATEINAME existert und es wird versucht sie im Ordner $ORT zu speichern..."
fi
fi

    FILE=${DATEINAME%.*}
    EXTN=${DATEINAME##$FILE}
    cp $FILE{$EXTN,-$(date '+%Y-%m-%d')$EXTN}

