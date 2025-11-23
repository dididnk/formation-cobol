# 📘 **Résumé complet : Le fichier d’impression en COBOL**

Dans COBOL, un **fichier d’impression** est un fichier **séquentiel en sortie**, destiné à produire une **mise en page propre** destinée à l’impression (papier ou spool JES, écran, PDF… selon le système).

Son utilisation est très courante dans :

* les états (reports)
* les factures
* les listings clients / salariés
* les statistiques
* les journaux d'activité
* les éditions comptables

---

# 🧩 1. Déclaration du fichier d’impression

Le fichier d’impression se déclare rarement comme un fichier normal :
Il utilise surtout **RECORDING MODE F** (fixed) ou **RECORDING MODE V** (variable).

Exemple classique :

```cobol
FD  FICH-PRN
    RECORDING MODE IS F
    BLOCK CONTAINS 0 RECORDS
    LABEL RECORDS ARE OMITTED.
01  LIGNE-PRN   PIC X(132).
```

Caractéristiques typiques :

| Élément            | Description                                           |
| ------------------ | ----------------------------------------------------- |
| **FD**             | Décrit le fichier d’impression                        |
| **RECORDING MODE** | F : longueur fixe / V : longueur variable             |
| **RECORD LENGTH**  | Longueur d’une ligne imprimée (ex: 80, 100, 132 cols) |
| **PIC X(n)**       | Une ligne = n caractères                              |
| **BLOCK CONTAINS** | Souvent 0 pour laisser l’OS choisir                   |

---

# 🧩 2. Le point essentiel : le *Line Printer* (132 colonnes)

Historiquement, les imprimantes mainframe IBM utilisaient **132 colonnes**, ce qui explique :

```
01 LIGNE-PRN PIC X(132).
```

Même aujourd’hui, beaucoup d'applications COBOL gardent cette convention.

---

# 🧩 3. Comment écrire dans un fichier d’impression ?

### 3.1. On construit la ligne en mémoire

```cobol
MOVE SPACES TO LIGNE-PRN
MOVE "LISTE DES CLIENTS" TO LIGNE-PRN(10:18)
```

### 3.2. Puis on écrit :

```cobol
WRITE LIGNE-PRN.
```

---

# 🧩 4. Le contrôle de lignes (Line Control)

Dans COBOL z/OS, la clause **WRITE AFTER** ou **WRITE BEFORE** permet de contrôler les sauts :

```cobol
WRITE LIGNE-PRN AFTER ADVANCING 1 LINE.
WRITE LIGNE-PRN AFTER ADVANCING 2 LINES.
WRITE LIGNE-PRN AFTER ADVANCING PAGE.
```

### Valeurs possibles :

| Syntaxe                   | Effet                |
| ------------------------- | -------------------- |
| `AFTER ADVANCING 1 LINE`  | ligne suivante       |
| `AFTER ADVANCING n LINES` | saute n lignes       |
| `AFTER ADVANCING PAGE`    | nouvelle page        |
| `BEFORE ADVANCING`        | même principe, avant |

---

# 🧩 5. Le *Report Writer* (RW) : génération automatique de rapports

COBOL possède un sous-langage appelé **REPORT SECTION**, permettant de définir :

* en-têtes
* pieds de page
* regroupements
* calculs automatiques
* totaux par groupe
* totaux généraux

Exemple (rare mais très puissant) :

```cobol
RD ETAT
   PAGE LIMITS 1 THROUGH 55
   HEADING 1
   DETAIL 3.
```

Le Report Writer n'est pas toujours installé sur les compilateurs modernes, mais sur mainframe il est encore utilisé.

---

# 🧩 6. Champs particuliers utilisés dans les fichiers d'impression

### 6.1. Champs numériques convertis en caractères

Avant d'écrire une ligne, les données numériques doivent être mises en **PIC X(n)**.

Exemple :

```cobol
MOVE MONTANT-NUM TO LIGNE-PRN(50:10).
```

### 6.2. Utilisation de `EDITED PICTURE`

Pour l'impression, les images éditées sont très utiles :

```
PIC ZZ,ZZ9.99
PIC $$$,$$9
PIC 9999B99
```

Elles permettent d’obtenir automatiquement :

* séparateurs (virgule, point, espace)
* alignement
* suppression des zéros non significatifs
* signes +/– en position

---

# 🧩 7. Lecture VS écriture : différences clés

| Fonction           | Fichier d'entrée  | Fichier d'impression   |
| ------------------ | ----------------- | ---------------------- |
| Lecture (`READ`)   | Oui               | Rare (quasi jamais)    |
| Écriture (`WRITE`) | Rare              | Toujours               |
| Structure interne  | Champs structurés | Une ligne = texte brut |
| Usage              | Traitement        | Édition, présentation  |

Un fichier d’impression est **un fichier plat**, chaque ligne est purement textuelle.

---

# 🧩 8. Exemples d'organisation

### Organisation séquentielle (la plus courante) :

```
ORGANIZATION IS SEQUENTIAL
```

### Sans étiquettes (labels) :

```
LABEL RECORDS ARE OMITTED
```

### En spool JES (z/OS)

L’impression est dirigée vers un **DD SYSOUT=* dans le JCL**, pas vers un fichier physique.

---

# 🧩 9. Exemple complet et propre d’un fichier d’impression COBOL

```cobol
       SELECT ETAT-PRN ASSIGN TO "etat.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       FD ETAT-PRN
           RECORDING MODE IS F.
       01 LIGNE-PRN PIC X(132).

       PROCEDURE DIVISION.
       ECRITURE-ETAT.

           MOVE ALL "-" TO LIGNE-PRN
           WRITE LIGNE-PRN

           MOVE "RAPPORT DES VENTES" TO LIGNE-PRN(10:20)
           WRITE LIGNE-PRN AFTER ADVANCING 2 LINES

           MOVE SPACES TO LIGNE-PRN
           MOVE "ID"       TO LIGNE-PRN(1:2)
           MOVE "NOM"      TO LIGNE-PRN(10:10)
           MOVE "MONTANT"  TO LIGNE-PRN(30:10)
           WRITE LIGNE-PRN
```

---

# 🧩 10. Bonnes pratiques pour un fichier d’impression

### ✔ Toujours effacer la ligne avant de la remplir

`MOVE SPACES TO LIGNE-PRN`

### ✔ Gérer les alignements

* colonnes fixes
* zones de texte
* zones numériques à droite

### ✔ Séparer entêtes / détails / totaux

### ✔ Utiliser `AFTER ADVANCING` pour sauter des lignes

### ✔ Vérifier la longueur de ligne (80, 100, 132…)

---

# 🎯 **Résumé ultra-rapide**

| Concept            | Essentiel                                  |
| ------------------ | ------------------------------------------ |
| Fichier impression | Séquentiel, texte uniquement               |
| Longueur           | 80 ou 132 colonnes                         |
| Écriture           | `WRITE` + éventuellement `AFTER ADVANCING` |
| Structure          | généralement 1 seul champ PIC X(n)         |
| Mise en page       | manuelle ou automatique avec Report Writer |
| Usage              | Éditions, rapports, listes, états          |

---