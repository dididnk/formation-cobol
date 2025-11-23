#!/bin/bash
echo "Compilation des programmes COBOL..."
cobc -x -o main PG13CH10.cbl YEARSAL.cbl

if [ $? -eq 0 ]; then
    ./main
else
    echo "Erreur de compilation!"
fi