Parfait 👍
Je refais **chaque exercice en utilisant des opérateurs ensemblistes** (`UNION`, `INTERSECT`, `EXCEPT`) **comme pour l’exemple précédent**, et en restant **compatible DB2**.

Je suppose les colonnes classiques :

* `EMPLOYEE(DEPT_NUM, POSTE, DATE_EMB, …)`
* `DEPT(DEPT_NUM, DEPT_NOM)`

---

## **1️⃣ Département qui ne comprend aucun employé**

### ✅ Avec `EXCEPT`

```sql
SELECT 
    DEPT_NUM,
    DEPT_NOM
FROM DEPT

EXCEPT

SELECT 
    D.DEPT_NUM,
    D.DEPT_NOM
FROM DEPT D
JOIN EMPLOYEE E
    ON D.DEPT_NUM = E.DEPT_NUM;
```

---

## **2️⃣ Postes attribués au 2ᵉ semestre (juillet–décembre) en 2021 et 2022**

👉 On récupère :

* postes du **S2 2021**
* postes du **S2 2022**
* puis on **fusionne** avec `UNION`

```sql
SELECT POSTE
FROM EMPLOYEE
WHERE DATE_EMB BETWEEN DATE('2021-07-01') AND DATE('2021-12-31')

UNION

SELECT POSTE
FROM EMPLOYEE
WHERE DATE_EMB BETWEEN DATE('2022-07-01') AND DATE('2022-12-31');
```

---

## **3️⃣ Liste des postes dans les départements 10, 20 et 30**

*(poste + numéro de département)*

👉 Utilisation de `UNION` entre plusieurs requêtes

```sql
SELECT POSTE, DEPT_NUM
FROM EMPLOYEE
WHERE DEPT_NUM = 10

UNION

SELECT POSTE, DEPT_NUM
FROM EMPLOYEE
WHERE DEPT_NUM = 20

UNION

SELECT POSTE, DEPT_NUM
FROM EMPLOYEE
WHERE DEPT_NUM = 30;
```

---

## **4️⃣ Numéros des départements où il n’y a PAS de poste ANALYSTE**

### ✅ Avec `EXCEPT`

```sql
SELECT DISTINCT DEPT_NUM
FROM EMPLOYEE

EXCEPT

SELECT DISTINCT DEPT_NUM
FROM EMPLOYEE
WHERE POSTE = 'ANALYSTE';
```

---

## **5️⃣ Postes des départements 10 et 20 qui existent dans l’un OU l’autre mais pas dans les deux**

👉 C’est une **différence symétrique**
➡️ `(A ∪ B) – (A ∩ B)`

### Étape finale en une requête :

```sql
(
    SELECT POSTE
    FROM EMPLOYEE
    WHERE DEPT_NUM = 10

    UNION

    SELECT POSTE
    FROM EMPLOYEE
    WHERE DEPT_NUM = 20
)

EXCEPT

(
    SELECT POSTE
    FROM EMPLOYEE
    WHERE DEPT_NUM = 10

    INTERSECT

    SELECT POSTE
    FROM EMPLOYEE
    WHERE DEPT_NUM = 20
);
```

---

## ✅ **Résumé pédagogique (très bon pour un examen)**

| Besoin                  | Opérateur                    |
| ----------------------- | ---------------------------- |
| Fusionner des résultats | `UNION`                      |
| Valeurs communes        | `INTERSECT`                  |
| Exclure des résultats   | `EXCEPT`                     |
| Différence symétrique   | `(UNION) EXCEPT (INTERSECT)` |

---

Si tu veux, je peux :

* te fournir **la version sans opérateurs ensemblistes** pour comparer
* ou adapter exactement aux **noms de colonnes de ton TP DB2**
