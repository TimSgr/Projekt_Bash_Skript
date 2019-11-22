#!/bin/bash
set -e
###Schritt 1  Überprüfen ob Eingaben richtig sind

if [ "$#" -lt 2 ]; then
    echo "Sie müssen mindestens eine vorhandene Datei angeben";
    echo "UND einen Ort wo das Backup gespeichert werden soll";
    exit 1
fi

if [[ $TARGET_DIR == *['!''?''='@\$%^\&*()+]* ]]
    then 
        echo "Unzulässiger Ordnername";
        exit 1;
fi    

###Schritt 2 Datum einfügen
ARG_COUNT="$(("$#"-1))"

MY_ARRAY=($*)

Array_size=${#MY_ARRAY[@]}

TARGET_DIR=${MY_ARRAY[$ARG_COUNT]}

i=0
while [[ $i -le $(($ARG_COUNT-1)) ]] 
do 
    DATEI=${MY_ARRAY[$i]}
    FILE=${DATEI%.*}
    EXTN=${DATEI##$FILE}
    
    cp $FILE{$EXTN,-$(date '+%d-%m-%y')$EXTN}
    
    NEUE_DATEI=$FILE-$(date '+%d-%m-%y')$EXTN

    if [ -z "$DATEI" ];
    then 
        echo "Bitte geben Sie den Namen einer Datei ein"
        else  echo "Datei wird gesucht...";
            #sleep 1
           if [[ -z "$EXTN" ]]
                 then 
                    echo "Überprüfen Sie Ihre Eingabe erneut"
            else if [[ -f "$DATEI" ]]
                 then 
                    echo "Die Datei $DATEI existert und es wird versucht sie im Ordner $TARGET_DIR.tar.gz zu speichern..."
                        
                fi  
            fi
    fi

      
    
                
###Schritt 4 Ordner wird erstellt wenn er noch nicht vorhanden ist und die Datei wird dahin verschoben

        echo "Es wird ein neuer Ordner mit dem Namen $TARGET_DIR erstellt..." 
        mkdir -p $TARGET_DIR;
        
        echo "Der Ordner wurde erstellt und die Datei wurde gespeichert"
    
    if [ -f "$NEUE_DATEI" ]
    then
        rm $NEUE_DATEI;
    fi

i=$(( $i + 1 ))
echo " "
done

tar cfz archive-$(date '+%d-%m-%y').tar.gz ${MY_ARRAY[@]}  
mv archive-$(date '+%d-%m-%y').tar.gz $TARGET_DIR
