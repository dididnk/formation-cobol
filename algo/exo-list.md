# Exercice sur les listes chînées

## Exco 2

1. Proposez une structure dynamique pour représenter un ensemble simple de valeurs. Par exemple : E={3,-6,1, 34}
 - a. Ecrire une procédure Union (E1, E2, E3) qui détermine l’union des deux ensembles E1 et E2 dans l’ensemble E3.
-  b. Ecrire une procédure Intersection (E1, E2, E3) qui détermine l’intersection des deux ensembles E1 et E2 dans l’ensemble E3.
- c. Ecrire une procédure Inclusion (E1, E2, INCLU) qui détermine, dans la variable booléenne INCLUS, si l’ensemble E1 est inclue dans E2 ou non.
2. Proposez une structure dynamique pour représenter un Multiensemble de valeurs. Par exemple : E={6,1,2,1,-9,6,1} Reprenez les 3 dernières questions avec cette nouvelle structure.



```
AlgoExo2():
simple_Ens : ^Elmt

Elmt = enreg
    val : entier
    Next : ^Elmt
Fenreg

E1, E2, E3 : List<Elmt>
p1, p2 : ^Elmt

DEBUT
    p1 : E1
    p2 : E2
    TantQue ^p1.Next <> NIL ou ^p2.Next <> NIL Faire
        Si (^p1.Next <> NIL) ET ValNonExiste(p2, p1.val) Faire
            ^E.val := ^p1.val
            ^E.Next := ^p1.Next
            ^p1 := ^p1.Next
        FinSi
        Si (^p2.Next <> NIL) ET ValNonExiste(p2, p1.val) Faire
            ^E.val := ^p2.val
            ^E.Next := ^p2.Next
            ^p2 := ^p2.Next
        FinSi
    Fait
FIN

```


````
AlgoFileExo3()

DEBUT

FIN

````