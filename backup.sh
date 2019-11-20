#!/bin/bash
set -e
###Schritt 1  Überprüfen ob Eingaben richtig sind

if [ "$#" -lt 2 ]; then
    echo "Sie müssen mindestens eine vorhandene Datei angeben";
    echo "UND einen Ort wo das Backup gespeichert werden soll";
    exit 1
else

###Schritt 2 Datum einfügen
Anzahl="$(("$#"-1))"
my_array=($*)
    Array_size=${#my_array[@]}
    zahl=${my_array[$Anzahl]}
    i=0
while [ $i -le $(($Anzahl-1)) ]; do
    nummer=${my_array[$i]}
	
    FILE=${nummer%.*}
    EXTN=${nummer##$FILE}
    cp $FILE{$EXTN,-$(date '+%d-%m-%y')$EXTN}
    Neue_Datei=$FILE-$(date '+%d-%m-%y')$EXTN

    if [ -z "$nummer" ];
            then echo "Bitte geben Sie den Namen einer Datei ein";
        else  echo "Datei wird gesucht...";
            sleep 1
           if [ -z "$EXTN" ]
                 then echo "Überprüfen Sie Ihre Eingabe erneut"
            else if [ -f "$nummer" ]
                 then echo "Die Datei $nummer existert und es wird versucht sie im Ordner $zahl zu speichern..."
                 sleep 2
                      if [ -d $zahl ]; then  
                         echo "Der Ordner $zahl existiert... und die Datei wurde darin gespeichert"
                         tar -rvf $Neue_Datei.tar 
                         mv $Neue_Datei.tar ./$zahl
                         rm $Neue_Datei
                         #echo "$Neue_Datei.tar"
                    
    sleep 1
    fi
    fi
    fi
    fi

###Schritt 3 Neue Datei wird einer Variable zugewiesen und Existens des Ordners wird überprüft

    
    #echo $Neue_Datei
    if [[ $zahl == *['!''?''='@\$%^\&*()_+]* ]]
        then echo "Unzulässiger Ordnername";
    else

        if [ ! -d $zahl ]; then
        echo "Der Ordner $zahl existiert nicht"
        sleep 2

###Schritt 4 Ordner wird erstellt wenn er noch nicht vorhanden ist und die Datei wird dahin verschoben

        echo "Es wird ein neuer Ordner mit dem Namen $zahl erstellt..." 
        mkdir -p $zahl;
        tar -rvf $Neue_Datei.tar 
        mv $Neue_Datei.tar ./$zahl
        #echo "$Neue_Datei.tar"
        echo "Der Ordner wurde erstellt und die Datei wurde gespeichert"
        rm $Neue_Datei

fi
fi
i=$(( $i + 1 ))
sleep 3
echo " "
done
fi