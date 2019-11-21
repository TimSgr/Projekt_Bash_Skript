#!/bin/bash
if [ "$#" -lt 2 ]; then
    echo "Bitte geben Sie eine Datei an von der ein Backup erstellt wurde und einen
    Speicherort für die neue Datei ";
    exit 1
else
ZIEL_ORDNER=$2
PFAD=$1
ORDNER=`dirname "$1"`
DATEI=`basename "$1"` 
#echo "$DATEI"
# echo "$ORDNER"
    if [ -d "$ORDNER" ]
    then    
        cd $ORDNER
        if [ -f "$DATEI" ]
        then  
            echo "Datei wird gesucht..."
            echo "Datei wird versucht zu entpacken..."
            #echo "$DATEI"
            mkdir -p $ZIEL_ORDNER   
            mv $DATEI $ZIEL_ORDNER
            # cd $ZIEL_ORDNER
            # mv $DATEI C /
            cd $ZIEL_ORDNER
            tar -xzf $DATEI
            echo "Dateien erfolgreich komprimiert in den Ordner $ZIEL_ORDNER"
           # mv $DATEI $ZIEL_ORDNER
        else 
            echo "Datei nicht gefunden"
        fi
    else 
        echo $ORDNER
        echo "Ordner nicht gefunden"
        echo "Ordner wird erstellt"
        cd $ZIEL_ORDNER
        mkdir -p $ZIEL_ORDNER 
        #mv $DATEI ~/$ZIEL_ORDNER

    fi
fi

            