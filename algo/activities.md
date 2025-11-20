# Exercices des activités

**Exercice 1**

````
AlgoExo1()
    N, V, Max, Min : Entier
DEBUT
    Repeter
        Lire(N)
    Jusqu`à ce que (N > 0) et (N < 100)

    Var T : Type_TAB = tableau [1 .. N] de entier
    Lire(V)
    T[1] := V
    Max := T[1]
    Min := Max

    Pour i de 2 à N Faire
        Lire(V)
        T[i] = V
        If T[i] > V Faire
            Max := T[i]
        FinSI
        Si T[i] < V Faire
            Min := V
        FinSi
    FinPour
    Ecrire('Le minimum égal = ', Min)
    Ecrire('Le maximum égal = ', Max)
FIN
````

**Exercice 2**

````
AlgoExo2()
    N, V : Entier
DEBUT
    Repeter
        Lire(N)
    Jusqu`à ce que (N > 0) et (N < 100)

    Var T : Type_TAB = tableau [1 .. N] de entier
    Lire(V)
    T[1] := V
    Max := T[1]
    Min := Max

    Pour i de 2 à N Faire
        Lire(V)
        T[i] = V
        If T[i] > V Faire
            Max = T[i]
        SinonSi T[i] < V Faire
            Min = V
        FinSi
    FinPour
    Ecrire('Le minimum égal = ', Min)
    Ecrire('Le maximum égal = ', Max)
FIN
````

**Exercice 7**

```
AlgoExo7()
    Var T1 : Type_TAB = tableau [1 .. N1] de Entier
    Var T2 : Type_TAB = tableau [1 .. N2] de Entier
    N3 : Entier = N1+N2
    Var T3 : Type_TAB = tableau [1 .. N3] de Entier

    val, x, y : Entier = 1
    z : Entier = N3
DEBUT
    TantQue z >= 1 faire
        Si T1[N1] >= T2[N2] Alors
            T3[N3] := T1[N1]  
            N1 := N1 - 1
            z := z - 1
        Sinon
            N2 := N2 - 1
        FinSi
    FinTantQue
FIN
```


**Exercice : ADN**

```
AlgoExo7()
    Var A : Type_TAB = tableau [1 .. N1] de caractère
    Var M : Type_TAB = tableau [1 .. N2] de caractère
    i, j, d, f : Entier : 1
    v : bool : Vrai
DEBUT
    TantQue i < N1 et v Faire
        Si M[j] = A[i] Faire
            j := j + 1
            d := i
        FinSi 
    FinTantQue
FIN
```