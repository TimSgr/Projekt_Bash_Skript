#!/bin/bash
set -e
###Schritt 1  Überprüfen ob Eingaben richtig sind

if [ "$#" -lt 2 ]; then
    echo "Sie müssen mindestens eine vorhandene Datei angeben";
    echo "UND einen Ort wo das Backup gespeichert werden soll";
    exit 1
else

###Schritt 2 Datum einfügen
ARG_COUNT="$(("$#"-1))"

my_array=($*)

Array_size=${#my_array[@]}

TARGET_DIR=${my_array[$ARG_COUNT]}

i=0
while [[ $i -le $(($ARG_COUNT-1)) ]] 
do 
    DATEI=${my_array[$i]}


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
                 then echo "Überprüfen Sie Ihre Eingabe erneut"
            else if [[ -f "$DATEI" ]]
                 then echo "Die Datei $DATEI existert und es wird versucht sie im Ordner $TARGET_DIR.tar.gz zu speichern..."
                 #sleep 2
                        
                         #rm $NEUE_DATEI
                         
                         #echo "$NEUE_DATEI.tar"
                    
    #sleep 1
                        
                fi  
            fi
    fi

###Schritt 3 Neue Datei wird einer Variable zugewiesen und Existens des Ordners wird überprüft

    
    #echo $NEUE_DATEI
    if [[ $TARGET_DIR == *['!''?''='@\$%^\&*()_+]* ]]
        then echo "Unzulässiger Ordnername";
    else

        #sleep 2
                #if [ ! -d "$TARGET_DIR.tar.gz" ]
                #then mkdir $TARGET_DIR.tar.gz
               
                
###Schritt 4 Ordner wird erstellt wenn er noch nicht vorhanden ist und die Datei wird dahin verschoben

        echo "Es wird ein neuer Ordner mit dem Namen $TARGET_DIR erstellt..." 
        mkdir -p $TARGET_DIR;
      
        # mv $NEUE_DATEI ./$TARGET_DIR
        #mv $NEUE_DATEI ${temp_dir/temp/}
        
        #echo "$NEUE_DATEI.tar"
        echo "Der Ordner wurde erstellt und die Datei wurde gespeichert"
#        rm $NEUE_DATEI

#fi    
fi        
if [ -f "$NEUE_DATEI" ]
then
rm $NEUE_DATEI;
fi

i=$(( $i + 1 ))
#sleep 3
echo " "
# if [ ! -d "$TARGET_DIR-$(date '+%d-%m-%y').tar.gz"]
# then
#     tar -czf $TARGET_DIR-$(date '+%d-%m-%y').tar.gz $NEUE_DATEI  
# fi
# else 

done

tar cfz archive-$(date '+%d-%m-%y').tar.gz ${my_array[@]}  
mv archive-$(date '+%d-%m-%y').tar.gz $TARGET_DIR


# if [ -d $NEUE_DATEI ]
# then
#     rm $NEUE_DATEI;

# fi



fi
#rm -r ${temp_dir/temp/}