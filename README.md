Dies ist ein Programm zum Erstellen einer Backup-Datei, bei der der neuen Datei ein Erstelldatum angehängt wird 
vor der Dateiendung (z.B. test-20.11.19.txt). Dies verhindert mögliche Probleme wegen eines identischen Dateinamens und 
ist auch besser zur Übersicht.
Um das Programm nutzen zu können, muss man lediglich folgenden Code eingeben:
## bash backup.sh *Dateiname* *Ordnername* ##
## Beispiel:  bash backup.sh test.txt Dateien ##

Das Programm überprüft dann, ob die Datei, von der ein Backup erstellt werden soll, existiert und ob der Zeilordner existiert,
und wenn letzteres nicht zurtifft, wird der Zeilordner erstellt. 
