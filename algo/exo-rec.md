# Exercice sur les fonctions recursives

1. Calculer le nombre de fois qu'un entier x se retrouve dans un tableau T de taille N

**Version 1**
```
AlgoOccurenceX_V1(T: tab_entier, N: entier, x: entier)
DEBUT
    Si N = 0 Alors
        AlgoOccurenceX := 0
    Sinon Si T[N] = X Alors
        AlgoOccurenceX := AlgoOccurenceX(T, N-1, x) + 1
    Sinon
        AlgoOccurenceX := AlgoOccurenceX(T, N-1, x)
    FinSi

FIN
```
**Version 2**
--------

```
AlgoOccurenceX_V2(T: tab_entier, N: entier, x: entier)

DEBUT
    Si N = 0 Alors
        AlgoOccurenceX_V2 := 0
    Sinon
        u := AlgoOccurenceX_V2(T, N-1, x)
        Si T[N] = X Alors
            AlgoOccurenceX_V2 := u + 1
        Sinon
            AlgoOccurenceX_V2 := u
        FinSi
    FinSi
FIN
```

2. Inverser les éléments du tableau 

```
inverser(T: tab_entier, d,f : entiers)
DEBUT
    Si d > f Alors
        inverser := T[d]
    Sinon
        T := permuter(T, T[d], T[f])
        inverser := inverser(T, d+1, f-1)
    FinSi
FIN
```

3. Dernier élément positif dans le tableau

```
RDP(T: tab_entier, x: entier)
DEBUT
    Si x = 0 Alors
        RDP := 0
    Sinon Si T[x] > 0 Alors
        RDP := x
    Sinon
        RDP := RDP(T, x-1)
    FinSi
FIN
```

3. Fonction palindrome

```
palindrome(T: tab_entier, x: entier)
DEBUT
    Si x = 0 Alors
        palindrome := 0
    Sinon Si T[x] > 0 Alors
        palindrome := x
    Sinon
        palindrome := palindrome(T, x-1)
    FinSi
FIN
```

4. Tableau pair via médianne

```
toutEtPair(T: tab_entier, N : entier) : Booléen
DEBUT
    Si N = 0 Alors
        toutEtPair := Vrai
    Sinon
        m := N/2
        Si ( T[m] MOD 2 = 0 ) Alors
            toutEtPair := toutEtPair(T, m - 1) ET toutEtPair(T, m + 1)
        Sinon
            toutEtPair := Faux
    FinSi
FIN
```

5. Fonction qui renvoie de la division euclidienne de A et B pour tout B <> 0 sans utiliser / 

```
moduloBis(A, B : Entier) : Entier
DEBUT
    Si A = 0 Alors
        moduloBis := 0
    SinonSi A < B Alors
        moduloBis := A
    Sinon
        moduloBis(A-B, B)
    FinSi
F    IN
```