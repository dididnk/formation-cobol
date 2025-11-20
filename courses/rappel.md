# RAPPEL

---
## Différence entre un PS, un PO(PDS) et un membre


## 🧱 1️⃣ PS — *Physical Sequential Dataset*

### 📘 Définition :

Un **PS** (*Physical Sequential*) est un **fichier séquentiel**, c’est-à-dire un dataset **classique**, lu **de façon linéaire, du début à la fin**.

### 📄 Exemple :

```
FTEST.DEV.MODEL
```

👉 C’est un **fichier unique**, sans sous-éléments.
Tu peux le comparer à un fichier texte (`.txt`) sur ton ordinateur.

### 📌 Caractéristiques :

* Organisation : `DSORG=PS`
* Lecture séquentielle uniquement.
* Contient **une seule suite d’enregistrements**.
* Typiquement utilisé pour :

  * Sauvegarder des logs
  * Transférer des données
  * Fichiers d’entrée/sortie de programmes

### 🔍 Exemple de définition :

```jcl
//DEVFILE DD DSN=FTEST.DEV.MODEL,DISP=NEW,
//            UNIT=SYSDA,SPACE=(TRK,(1,1)),
//            DCB=(RECFM=FB,LRECL=80,BLKSIZE=800,DSORG=PS)
```

---

## 📂 2️⃣ PO — *Partitioned Dataset (PDS)*

### 📘 Définition :

Un **PO** (*Partitioned Organization*) est un dataset **partitionné**, c’est-à-dire un **conteneur** qui regroupe plusieurs sous-fichiers appelés **membres**.

C’est comme un **dossier** contenant plusieurs fichiers.

### 📄 Exemple :

```
FTEST.TSOJCL.PROC
```

👉 C’est un **PDS**, et il peut contenir des membres comme :

```
FTEST.TSOJCL.PROC(PROC1)
FTEST.TSOJCL.PROC(PROC2)
```

### 📌 Caractéristiques :

* Organisation : `DSORG=PO`
* Chaque membre est identifié par un nom unique.
* Utilisé pour :

  * Stocker des **JCL**, **PROC**, **programmes source (COBOL, ASM)**, **macros**, etc.

### 🔍 Exemple de définition :

```jcl
//LIBTEST DD DSN=FTEST.TSOJCL.PROC,DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,SPACE=(TRK,(2,1,1)),
//            DCB=(RECFM=FB,LRECL=80,BLKSIZE=800,DSORG=PO)
```

---

## 📄 3️⃣ Membre

### 📘 Définition :

Un **membre** est un **fichier individuel contenu dans un PDS (PO)**.
Il ne peut **pas exister seul** : il est toujours à l’intérieur d’un dataset PO.

### 📄 Exemple :

```
FTEST.TSOJCL.PROC(PROC1)
```

👉 Ici :

* `FTEST.TSOJCL.PROC` → le **PDS**
* `PROC1` → le **membre**

### 📌 Utilisation :

* Tu édites un membre avec ISPF (option 2 → Edit)
* Tu exécutes un membre JCL avec `SUBMIT`
* Tu peux mettre plusieurs JCL dans un même PDS, chacun dans son propre membre

---

## 🧩 Récap visuel :

| Élément      | Type                     | Exemple                    | Contenu / Rôle                                  |
| ------------ | ------------------------ | -------------------------- | ----------------------------------------------- |
| **PS**       | Fichier séquentiel       | `FTEST.DEV.FILE`           | Un seul flux de données (ex : fichier d’entrée) |
| **PO (PDS)** | Dossier (bibliothèque)   | `FTEST.TSOJCL.PROC`        | Conteneur de membres (JCL, PROC, macros, etc.)  |
| **Membre**   | Sous-fichier dans un PDS | `FTEST.TSOJCL.PROC(PROC1)` | Un fichier individuel à l’intérieur du PDS      |

---

## 🧠 Analogie simple :

| Environnement moderne     | Mainframe |
| ------------------------- | --------- |
| Dossier                   | PDS (PO)  |
| Fichier dans le dossier   | Membre    |
| Fichier texte indépendant | PS        |

---


## Différence entre un PS, un PO(PDS) et un membre

### 1️⃣ JOBLIB

* **Objectif :** Fournir **des programmes ou exécutables** pour toutes les étapes (`STEP`) du job.
* **Portée :** S’applique **à toutes les étapes du JOB**.
* **Contenu :** Bibliothèques **de programmes compilés** (Load Libraries).
* **Exemple :**

```jcl
//JOB1  JOB ...
//JOBLIB DD DSN=MY.LOAD.LIB,DISP=SHR
//STEP1 EXEC PGM=PROG1
//STEP2 EXEC PGM=PROG2
```

> `PROG1` et `PROG2` seront recherchés dans `MY.LOAD.LIB`.

---

### 2️⃣ JCLLIB

* **Objectif :** Fournir **des procédures JCL (PROC)** à utiliser dans le job.
* **Portée :** S’applique aux **PROC appelées dans le job** via `EXEC PGM=...` ou `EXEC PROC=...`.
* **Contenu :** Bibliothèques **de procédures JCL** (PDS contenant des membres PROC).
* **Exemple :**

```jcl
//JOB1 JOB ...
//JCLLIB ORDER=(MY.JCL.PROC1,MY.JCL.PROC2)
//STEP1 EXEC PROC=MYPROC
```

> `MYPROC` sera recherché dans les PDS listés dans `JCLLIB`.

---

#### 🧩 Récapitulatif

| Élément    | Contenu                              | Portée                              | Exemple d’utilisation           |
| ---------- | ------------------------------------ | ----------------------------------- | ------------------------------- |
| **JOBLIB** | Programmes compilés (Load Libraries) | Toutes les étapes du JOB            | Pour fournir PROG1, PROG2…      |
| **JCLLIB** | Procédures JCL (PDS avec PROC)       | Pour les PROC utilisées dans le JOB | Pour appeler `EXEC PROC=MYPROC` |

---

En bref :

> **JOBLIB = où chercher les programmes exécutables**
> **JCLLIB = où chercher les procédures JCL**

---



