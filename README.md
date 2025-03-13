# DLRG Langen Dienstanweisung (Erneuerung)

## delete_files script

### usage

#### set files for deletion

1. open `delete_list.txt`
2. append or remove a filename to list (every line one filename)
3. caution: let a blank line at the end of the file or the last filename will be ignored

#### using in command prompt

- Unix\
  `bash delete_files.sh`

- Windows\
  `delete_files.bat`

### optional arguments

- keeppdf
  - deletes given files without deleting files with `.pdf` fileextension
