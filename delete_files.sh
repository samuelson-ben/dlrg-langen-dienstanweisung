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

# Dateien aus der Liste löschen
while IFS= read -r file; do
    if [ -f "$TARGET_DIR$file" ]; then
        rm "$TARGET_DIR$file"
        echo "Gelöscht: $file"
    else
        echo "Nicht gefunden: $file"
    fi
done < "$LIST_FILE"