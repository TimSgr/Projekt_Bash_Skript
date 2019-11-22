#!/bin/bash

### Anzahl der eingegebenen Argumente wird überprüft
if [ "$#" -lt 2 ] 
then
    echo "Bitte geben Sie eine Datei an von der ein Backup erstellt wurde und einen
    Speicherort für die neue Datei ";
    exit 1
else

### Eingegebene Argumente werden Variablen zugewiesen 
ZIEL_ORDNER=$2
PFAD=$1

ORDNER=`dirname "$1"`
DATEI=`basename "$1"` 
    
### Existenz des Pfades,der Datei und des Zielordners werden überprüft
### wenn diese vorhanden sind, wird versucht zu entpacken
    if [ -d "$ORDNER" ]
    then    
        cd $ORDNER
        if [ -f "$DATEI" ]
        then  
            echo "Datei wird gesucht..."
            echo "Datei wird versucht zu entpacken..."
            
            mkdir -p $ZIEL_ORDNER   
            mv $DATEI $ZIEL_ORDNER 2>/dev/null
            cd $ZIEL_ORDNER
            
            FILE=${DATEI%.*}
            EXTN=${DATEI##$FILE}
            if [ $EXTN != "tar.gz" ]
            then    
                echo "Datei kann nicht entpackt werden"
            else
                tar -xzf $DATEI 2>/dev/null
            fi  

            if [ $ZIEL_ORDNER == "." ]
            then
                echo "Dateien erfolgreich komprimiert in den Ordner $ORDNER"
            
            else if [[ $TARGET_DIR == *['!''?''='@\$%^\&*()+]* ]]
            then 
                echo "Unzulässiger Ordnername";
            
            else    
                echo "Dateien erfolgreich komprimiert in den Ordner $ZIEL_ORDNER"
            fi
        else 
            cd $ZIEL_ORDNER
            echo "Datei nicht gefunden"    
        fi
    
    else 
        
        if [ $ZIEL_ORDNER == "." ]
        then
            cd $ORDNER
            tar -xzf $DATEI 2>/dev/null

###Falls der Zielordner nicht vorhanden ist, wird er erstellt und das
###Archiv wird dahin entpackt        
        else
            echo $ZIEL_ORDNER
            echo "Ordner nicht gefunden"
            echo "Ordner wird erstellt"
            mkdir -p $ZIEL_ORDNER 
            cd $ZIEL_ORDNER
            tar -xzf $DATEI 2>/dev/null
        fi
    fi
fi
find . -empty -type d -delete

            