# 📁 **La notion des fichiers en COBOL**

En COBOL, les **fichiers** (FILES) sont utilisés pour lire, écrire, mettre à jour ou supprimer des données stockées sur des supports externes (disques, bases VSAM, etc.). Ils constituent un élément central du traitement batch.

---

## 🔹 **1. Types de fichiers en COBOL**

COBOL supporte principalement trois types :

### **1.1 Séquentiels (SEQ)**

* Les enregistrements sont lus/écrits dans un ordre précis.
* Couramment utilisés pour les rapports ou les listes.
* Lecture linéaire du début à la fin.

### **1.2 Indexés (ISAM / VSAM KSDS)**

* Accès aux données via une clé primaire (KEY).
* Accès direct ou séquentiel.
* Permet de rechercher un enregistrement sans parcourir tout le fichier.

### **1.3 Accès direct (Relative / RRDS)**

* Chaque enregistrement a un numéro (RRN).
* Accès direct avec ce numéro.

---

## 🔹 **2. Déclaration des fichiers**

Dans COBOL, les fichiers sont déclarés dans deux divisions :

### **2.1 ENVIRONMENT DIVISION → INPUT-OUTPUT SECTION**

Permet de **lier le nom COBOL du fichier** au fichier physique.

```cobol
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FICHIER-CLIENT
        ASSIGN TO "CLIENTS.DAT"
        ORGANIZATION IS SEQUENTIAL.
```

### **2.2 DATA DIVISION → FILE SECTION**

Structure de chaque enregistrement.

```cobol
DATA DIVISION.
FILE SECTION.

FD FICHIER-CLIENT.
01 CLIENT-REC.
   05 ID-CLIENT      PIC 9(5).
   05 NOM-CLIENT     PIC A(20).
   05 AGE-CLIENT     PIC 9(3).
```

---

## 🔹 **3. Ouverture et fermeture des fichiers**

Avant toute opération, le fichier doit être **ouvert**.

```cobol
OPEN INPUT FICHIER-CLIENT.
OPEN OUTPUT FICHIER-CLIENT.
OPEN I-O FICHIER-CLIENT.
```

Et ensuite fermé :

```cobol
CLOSE FICHIER-CLIENT.
```

---

## 🔹 **4. Opérations principales**

### **4.1 READ (lecture)**

```cobol
READ FICHIER-CLIENT
    AT END MOVE 'O' TO FIN-FICHIER.
```

### **4.2 WRITE (écriture)**

```cobol
WRITE CLIENT-REC.
```

### **4.3 REWRITE (mise à jour)**

Utilisé pour modifier un enregistrement **déjà lu** (accès indexé).

```cobol
REWRITE CLIENT-REC.
```

### **4.4 DELETE (suppression)**

Uniquement pour fichiers indexés.

```cobol
DELETE FICHIER-CLIENT.
```

---

## 🔹 **5. Modes d’accès**

Selon le type de fichier :

### ✔ **SEQUENTIAL**

* `ACCESS MODE IS SEQUENTIAL`

### ✔ **INDEXED**

* `ACCESS MODE IS RANDOM` (clé)
* `ACCESS MODE IS SEQUENTIAL`
* `ACCESS MODE IS DYNAMIC` (les deux)

### ✔ **RELATIVE**

* `RELATIVE KEY IS ...`

---

## 📌 **Les modes d'accès aux fichiers en COBOL : explications détaillées**

Le **mode d’accès** détermine *comment* le programme COBOL va parcourir le fichier :

* séquentiellement,
* directement via une clé,
* ou en combinant les deux.

Il est défini dans la clause :

```cobol
ACCESS MODE IS ...
```

---

### 🔷 1. **Accès séquentiel (SEQUENTIAL)**

Ce mode est utilisé lorsque les enregistrements doivent être lus **dans l’ordre**, du premier au dernier.

#### ✔ Utilisation

* Lecture de rapport
* Parcours complet d’un fichier
* Fichiers triés ou non, mais ordre imposé

#### ✔ Déclaration

```cobol
ORGANIZATION IS SEQUENTIAL
ACCESS MODE IS SEQUENTIAL.
```

#### ✔ Lecture

```cobol
READ FICHIER
    AT END MOVE 'O' TO EOF.
```

#### 🔎 Caractéristiques

* On **ne peut pas sauter** un enregistrement.
* Après un READ, on lit toujours le **prochain**.
* Utilisé surtout pour fichiers de type texte.

---

## 🔷 2. **Accès direct (RANDOM)** — pour fichiers indexés ou relatifs

Le programme accède à un enregistrement **précis**, sans lire les précédents.

#### ✔ Utilisation

* Rechercher un client via son ID
* Modifier un enregistrement précis
* Vérifier si une clé existe

#### ✔ Déclaration

Pour un fichier indexé :

```cobol
ORGANIZATION IS INDEXED
ACCESS MODE IS RANDOM
RECORD KEY IS CLE-CLIENT.
```

Pour un fichier relatif :

```cobol
ORGANIZATION IS RELATIVE
ACCESS MODE IS RANDOM
RELATIVE KEY IS NUM-RELA.
```

#### ✔ Lecture

Pour un fichier indexé :

```cobol
MOVE 15000 TO CLE-CLIENT.
READ FICHIER-CLIENT
    INVALID KEY DISPLAY "Client introuvable".
```

Pour un fichier relatif :

```cobol
MOVE 300 TO NUM-RELA.
READ FICHIER-RELATIF
    INVALID KEY DISPLAY "Enregistrement absent".
```

#### 🔎 Caractéristiques

* Accès **très rapide** grâce à la clé.
* Pas besoin de lire tout le fichier.
* Oblige à fournir la clé avant chaque READ ou WRITE.

---

## 🔷 3. **Accès dynamique (DYNAMIC)** — combinaison des deux

On peut accéder :

* séquentiellement
  **ou**
* directement via une clé

dans un même programme.

#### ✔ Utilisation

Cas très fréquent, par exemple :

* Lecture séquentielle
* Puis recherche d’un enregistrement précis
* Ou mise à jour ciblée après lecture séquentielle

#### ✔ Déclaration

```cobol
ORGANIZATION IS INDEXED
ACCESS MODE IS DYNAMIC
RECORD KEY IS CLE-CLIENT.
```

#### 📌 Exemple de combinaisons possibles

#### Lecture séquentielle

```cobol
READ FICHIER NEXT
    AT END MOVE 'O' TO EOF.
```

#### Lecture directe

```cobol
MOVE 100 TO CLE-CLIENT.
READ FICHIER
    INVALID KEY DISPLAY "Introuvable".
```

#### 🔎 Caractéristiques

* Très flexible
* Idéal pour les traitements complexes

---

## 🔷 4. **Accès EXTEND** (uniquement à l’ouverture)

Ce n’est pas un *mode d’accès*, mais un **mode d’ouverture** permettant d’ajouter à la fin du fichier.

```cobol
OPEN EXTEND FICHIER.
WRITE ENREG.
```

Utilisé pour ajouter des lignes sans écraser le contenu existant.

---

# 📌 **Résumé général par type de fichier**

| Type de fichier         | Accès possibles             | Notes                             |
| ----------------------- | --------------------------- | --------------------------------- |
| **SEQUENTIAL**          | SEQUENTIAL                  | Pas de RANDOM                     |
| **INDEXED (VSAM KSDS)** | SEQUENTIAL, RANDOM, DYNAMIC | Le plus flexible                  |
| **RELATIVE (RRDS)**     | RANDOM, SEQUENTIAL, DYNAMIC | Accès via numéro d'enregistrement |

---

# 📘 Exemple complet de FILE-CONTROL + FILE SECTION (INDEXED, DYNAMIC)

```cobol
FILE-CONTROL.
    SELECT FICHIER-CLIENT
        ASSIGN TO "CLIENTS.DAT"
        ORGANIZATION IS INDEXED
        ACCESS MODE IS DYNAMIC
        RECORD KEY IS CLE-CLIENT
        FILE STATUS IS WS-FS.

FD FICHIER-CLIENT.
01 CLIENT-REC.
   05 CLE-CLIENT    PIC 9(5).
   05 NOM-CLIENT    PIC A(20).
   05 SOLDE         PIC 9(6)V9(2).
```

---

## 🔹 **6. Gestion de fin de fichier**

Très important :

```cobol
READ FICHIER-CLIENT
    AT END SET EOF-SW TO TRUE.
```

---

## 📝 **Résumé global**

| Élément            | Description                                   |
| ------------------ | --------------------------------------------- |
| **Déclaration**    | FILE-CONTROL + FILE SECTION                   |
| **Ouverture**      | OPEN en INPUT / OUTPUT / EXTEND / I-O         |
| **Opérations**     | READ, WRITE, REWRITE, DELETE                  |
| **Type d’accès**   | Séquentiel, Direct, Indexé                    |
| **Fin de fichier** | AT END lors d’un READ                         |
| **Utilité**        | Traitement batch, gestion de données externes |

---

# 📌 Exemple pour comprendre

### 🔸 En accès séquentiel

Tu dois lire les enregistrements **dans l’ordre** :

* 1
* puis 2
* puis 3
* puis 4
* etc.

Tu ne peux pas sauter directement au n° 50.

---

### 🔸 En accès random

Tu peux faire ceci :

```cobol
MOVE 50 TO CLE-CLIENT.
READ FICHIER-CLIENT.
```

⛳ Directement, sans lire les 49 premiers.

Puis ensuite :

```cobol
MOVE 3 TO CLE-CLIENT.
READ FICHIER-CLIENT.
```

⛳ On saute du 50 au 3 directement.

---

# 📘 Résumé simple

| Mode d'accès   | Fonction                           | Ordre imposé ? |
| -------------- | ---------------------------------- | -------------- |
| **SEQUENTIAL** | lire dans l’ordre                  | Oui            |
| **RANDOM**     | accéder à un enregistrement précis | Non            |
| **DYNAMIC**    | combiner les 2                     | Non (flexible) |

---

# ✔ Donc la réponse simple :

**On dit RANDOM parce que l’ordre des accès est libre, non imposé.
Ce n’est pas “au hasard”, c’est “direct, adressable”.**

---

## Les opérations

Voici **un résumé détaillé et clair des opérations sur les fichiers en COBOL**, dans le même style que précédemment — simple, structuré et pédagogique.

---

# 📁 **Résumé détaillé des opérations sur les fichiers en COBOL**

Après avoir déclaré et ouvert un fichier, COBOL permet 4 opérations principales :
👉 **READ**, **WRITE**, **REWRITE**, **DELETE**
(+ CLOSE et START selon le type de fichier)

Ces opérations dépendent du **type de fichier** et du **mode d’accès**.

---

# 🔷 1. **READ — Lire un enregistrement**

La lecture varie selon le type d’accès.

---

## ✔ 1.1 Lecture séquentielle

Utilisée pour fichiers **séquentiels** ou **indexés/relatifs en mode SEQUENTIAL/DYNAMIC**.

```cobol
READ FICHIER
    AT END MOVE 'O' TO EOF.
```

### 🔎 Comportement :

* Le système lit le **prochain** enregistrement.
* Impossible de revenir en arrière.
* AT END est déclenché quand on arrive à la fin.

---

## ✔ 1.2 Lecture directe (RANDOM)

On donne une clé avant le READ :

```cobol
MOVE 12345 TO CLE-CLIENT.
READ FICHIER
    INVALID KEY DISPLAY "Introuvable".
```

### 🔎 Comportement :

* L’enregistrement correspondant à la clé est lu.
* INVALID KEY si la clé n’existe pas.

---

## ✔ 1.3 START (pour fichiers indexés)

START n’est **pas une lecture**, mais un positionnement.

```cobol
MOVE 20000 TO CLE-CLIENT.
START FICHIER
    KEY >= CLE-CLIENT
    INVALID KEY DISPLAY "Position impossible".
```

Ensuite :

```cobol
READ FICHIER NEXT RECORD.
```

### 🔎 Utile pour :

* commencer une lecture séquentielle **à partir d’une clé donnée**.

---

# 🔷 2. **WRITE — Écrire un enregistrement**

Utilisé pour fichiers en **OUTPUT**, **EXTEND**, ou **I-O**.

```cobol
MOVE "Emmanuel" TO NOM.
WRITE CLIENT-REC.
```

### 🔎 Spécificités :

* Le format doit correspondre au FD.
* Dans un fichier indexé :

  * la clé doit être **unique**
  * sinon : `INVALID KEY`

---

# 🔷 3. **REWRITE — Modifier un enregistrement existant**

Uniquement pour **fichiers indexés ou relatifs** avec accès I-O.

```cobol
READ FICHIER.   * On doit avoir lu l’enregistrement
MOVE 450.20 TO SOLDE.
REWRITE CLIENT-REC
    INVALID KEY DISPLAY "Erreur de mise à jour".
```

### 🔎 Conditions obligatoires :

* Le dernier READ doit avoir **réussi**.
* On modifie **l’enregistrement qui vient d’être lu**.
* La clé peut être changée **si le système l’autorise**, sinon INVALID KEY.

---

# 🔷 4. **DELETE — Supprimer un enregistrement**

Uniquement pour fichiers **indexés ou relatifs**.

```cobol
MOVE 15000 TO CLE-CLIENT.
READ FICHIER.
DELETE FICHIER.
```

### 🔎 Conditions :

* On doit d’abord lire l’enregistrement.
* Supprime l’entrée dans l’index.

---

# 🔷 5. **CLOSE — Fermer le fichier**

Obligatoire.

```cobol
CLOSE FICHIER.
```

### 🔎 Effets :

* Libère les buffers.
* Réécrit les index si fichier indexé.
* Obligatoire avant de rouvrir un fichier sous un autre mode.

---

# 🔷 6. **START — Positionnement dans un fichier indexé** (plus détaillé)

Permet de se positionner **avant une lecture séquentielle**.

### Exemple avec comparaison :

```cobol
START FICHIER
    KEY >= CLE-CLIENT.
```

Comparaisons possibles :

* `=`
* `>`
* `>=`

Il ne lit **pas**, il se contente de placer le pointeur.

---

# 📌 RÉCAPITULATIF (tableau clair)

| Opération   | Description                   | Types de fichiers | Mode requis                 |
| ----------- | ----------------------------- | ----------------- | --------------------------- |
| **READ**    | Lire un enregistrement        | Tous              | SEQUENTIAL, RANDOM, DYNAMIC |
| **WRITE**   | Ajouter un enregistrement     | Tous              | OUTPUT, EXTEND, I-O         |
| **REWRITE** | Modifier un enregistrement lu | INDEXED, RELATIVE | I-O                         |
| **DELETE**  | Supprimer un enregistrement   | INDEXED, RELATIVE | I-O                         |
| **START**   | Positionner le pointeur       | INDEXED           | RANDOM ou DYNAMIC           |
| **CLOSE**   | Fermer le fichier             | Tous              | —                           |

---

# 📘 Exemple simple rassemblant toutes les opérations

```cobol
OPEN I-O FICHIER-CLIENT.

* Ajout
WRITE CLIENT-REC.

* Lecture séquentielle
READ FICHIER-CLIENT
    AT END SET EOF TO TRUE.

* Accès direct
MOVE 1000 TO CLE-CLIENT.
READ FICHIER-CLIENT
    INVALID KEY DISPLAY "Introuvable".

* Modification
REWRITE CLIENT-REC.

* Suppression
DELETE FICHIER-CLIENT.

CLOSE FICHIER-CLIENT.
```

---
