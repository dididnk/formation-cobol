#!/bin/bash
echo "Compilation des programmes COBOL..."
cobc -x -o main-program MAIN-PROG.cbl CALC-SOMME.cbl

if [ $? -eq 0 ]; then
    echo "Compilation réussie!"
    echo "Execution du programme..."
    ./main-program
else
    echo "Erreur de compilation!"
fi