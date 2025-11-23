# Tableau multidimension
---
***Exemple du cours***

```cobol
01  TABLE-TEST.
    05  VAR1 OCCURS 10 TIMES.
        10  VAR2 PIC A(10).
        10  VAR3 OCCURS 5 TIMES.
            15  WS-D PIC X(6).
```

***Structure du tableau COBOL***

| **Niveau** | **Nom du champ** | **Clause OCCURS** | **Type / Taille** | **Rôle / Description**                                       |
| ---------- | ---------------- | ----------------- | ----------------- | ------------------------------------------------------------ |
| 01         | **TABLE-TEST**   | —                 | —                 | Table principale (structure globale)                         |
| 05         | **VAR1**         | `OCCURS 10 TIMES` | —                 | Bloc répété 10 fois → correspond à 10 groupes                |
| 10         | **VAR2**         | —                 | `PIC A(10)`       | Chaîne de 10 caractères (propre à chaque VAR1)               |
| 10         | **VAR3**         | `OCCURS 5 TIMES`  | —                 | Sous-table contenant 5 éléments à l’intérieur de chaque VAR1 |
| 15         | **WS-D**         | —                 | `PIC X(6)`        | Élément de 6 caractères présent dans chaque VAR3             |

---

***Représentation visuelle simplifiée***

```
TABLE-TEST
 ├─ VAR1(1)
 │   ├─ VAR2(1)
 │   ├─ WS-D(1,1)
 │   ├─ WS-D(1,2)
 │   ├─ WS-D(1,3)
 │   ├─ WS-D(1,4)
 │   └─ WS-D(1,5)
 ├─ VAR1(2)
 │   ├─ VAR2(2)
 │   └─ WS-D(2,1..5)
 ...
 └─ VAR1(10)
     ├─ VAR2(10)
     └─ WS-D(10,1..5)
```

---


### 📊 Résumé du contenu total

| Élément | Niveau supérieur | Nombre d’occurrences | Total cumulé                      |
| ------- | ---------------- | -------------------- | --------------------------------- |
| VAR1    | TABLE-TEST       | 10                   | 10                                |
| VAR2    | VAR1             | 1 par VAR1           | 10 × 1 = **10**                   |
| VAR3    | VAR1             | 5 par VAR1           | 10 × 5 = **50**                   |
| WS-D    | VAR3             | 1 par VAR3           | 10 × 5 × 1 = **50 WS-D** au total |

---

### 🧠 Exemple d’accès aux données

| Expression COBOL | Signification              | Exemple concret                |
| ---------------- | -------------------------- | ------------------------------ |
| `VAR2(3)`        | 3ᵉ VAR1 → sa variable VAR2 | Élément texte du 3ᵉ groupe     |
| `WS-D(3,1)`      | 3ᵉ VAR1, 1ᵉ WS-D du VAR3   | Premier WS-D du 3ᵉ groupe      |
| `WS-D(10,5)`     | 10ᵉ VAR1, 5ᵉ WS-D          | Dernier WS-D du tableau global |

---

### 🧩 Représentation visuelle simplifiée

```
TABLE-TEST
 ├─ VAR1(1)
 │   ├─ VAR2(1)
 │   ├─ WS-D(1,1)
 │   ├─ WS-D(1,2)
 │   ├─ WS-D(1,3)
 │   ├─ WS-D(1,4)
 │   └─ WS-D(1,5)
 ├─ VAR1(2)
 │   ├─ VAR2(2)
 │   └─ WS-D(2,1..5)
 ...
 └─ VAR1(10)
     ├─ VAR2(10)
     └─ WS-D(10,1..5)
```

---
