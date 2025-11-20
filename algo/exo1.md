# Exercice  Algorithmique

1. Ecrire un algo qui lit 3 entiers A,B et C et affiche les entiers compris entre A et B qui sont divisibles par C ainsi que leur nombre
exemple : 
pour : A=3,B=19 et C=4
On affiche les entiers : 4-8-12-16

- Résolution
```algo
AfficherSomme()
    a: entier = Lire(a)
    b: entier = Lire(b)
    c: entier = Lire(c)
    s: entier = 0
    i: entier = a

DEBUT
    Si b >= a :
        TantQue i < b :
            Si i MOD c = 0 :
                Ecrire(i)
                s = s + i
            FinSi
            i = i + 1
        FinTantQue
        Ecrire(s)
    FinSi
FIN
```

2. PGCD(A,B) égal PGCD(a-b,b) si A > B et PGCD(a,a)=a

- normal
```
CalculePGCD()
VAR A,B: entier
PGCD: entier
DEBUT
    Repeter 
        Lire(A)
    Jusqu'à A > 0
    Repeter 
        Lire(B)
    Jusqu'à B => 0
FIN
```
- récursive
```
CalculePGCD(a: entier, b: entier)
DEBUT
    Lire(a,b)
    Si a = b :
        CalculePGCD(a)
    SinonSi a > b :
        CalculePGCD(a-b, b)
    FinSi
FIN
```

3. 