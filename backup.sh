#!/bin/bash
set -e
###Schritt 1  Überprüfen ob Eingaben richtig sind

if [ "$#" -ne 2 ]; then
    echo "Sie müssen eine vorhandene Datei angeben";
    echo "UND einen Ort wo das Backup gespeichert werden soll";
    exit 1
else

###Schritt 2 Datum einfügen
    FILE=${1%.*}
    EXTN=${1##$FILE}
    cp $FILE{$EXTN,-$(date '+%d-%m-%y')$EXTN}

    if [ -z "$1" ];
            then echo "Bitte geben Sie den Namen einer Datei ein";
        else  echo "Datei wird gesucht...";
            sleep 1
            echo "$EXTN"
           if [ -z "$EXTN" ]
                 then echo "Überprüfen Sie Ihre Eingabe erneut"
            else if [ -f "$1" ]
                 then echo "Die Datei $1 existert und es wird versucht sie im Ordner $2 zu speichern..."
    sleep 1
    fi
    fi
    fi

###Schritt 3 Neue Datei wird einer Variable zugewiesen und Existens des Ordners wird überprüft

    Neue_Datei=$FILE-$(date '+%d-%m-%y')$EXTN

if [[ $2 == *['!''?''='@\$%^\&*()_+]* ]]
then echo "Unzulässiger Ordnername";
else

    if [ ! -d $2 ]; then
    echo "Der Ordner $2 existiert nicht"
    sleep 2

###Schritt 4 Ordner wird erstellt wenn er noch nicht vorhanden ist und die DAtei wird dahin verschoben

    echo "Es wird ein neuer Ordner mit dem Namen $2 erstellt..." 
    mkdir -p $2;
    tar -rvf $Neue_Datei.tar $Neue_Datei
    echo "Der Ordner wurde erstellt und die Datei wurde gespeichert"
    else echo "Der Ordner $2 existiert und die Datei wurde darin gespeichert..."
fi
fi
fi
mv $Neue_Datei.tar ./$2
rm $Neue_Datei