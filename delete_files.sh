#!/bin/bash

# Verzeichnis, aus dem die Dateien gelöscht werden sollen
TARGET_DIR="./"

# Datei mit der Liste der zu löschenden Dateien
LIST_FILE="delete_list.txt"

# Überprüfen, ob die Liste existiert
if [ ! -f "$LIST_FILE" ]; then
    echo "Die Datei $LIST_FILE existiert nicht!"
    exit 1
fi

# Prüfen, ob das Argument "keeppdf" übergeben wurde
KEEP_PDF=false
if [ "$1" == "keeppdf" ]; then
    KEEP_PDF=true
fi

# Dateien aus der Liste löschen
while IFS= read -r file; do
    # Überprüfen, ob die Datei existiert
    if [ -f "$TARGET_DIR$file" ]; then
        # Falls keeppdf aktiviert ist, PDF-Dateien überspringen
        if $KEEP_PDF && [[ "$file" == *.pdf ]]; then
            echo "Übersprungen (PDF): $file"
            continue
        fi
        rm "$TARGET_DIR$file"
        echo "Gelöscht: $file"
    else
        echo "Nicht gefunden: $file"
    fi
done < "$LIST_FILE"