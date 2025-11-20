# Fiche récap VSAM pour COBOL/JCL

---

## ⚙️ 1. Qu’est-ce que VSAM ?

**VSAM (Virtual Storage Access Method)** est une méthode d’accès aux fichiers sur IBM Mainframe.
C’est une **évolution des fichiers séquentiels classiques (PS)** : plus rapide, plus souple et capable de gérer de grandes bases de données.

---

## 🧱 2. Les types de fichiers VSAM

| Type de fichier | Nom complet                | Caractéristiques principales                                                                                          |
| --------------- | -------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| **KSDS**        | *Key Sequenced Data Set*   | Enregistrements triés selon une **clé primaire** (ex. numéro client). Permet **accès direct et séquentiel**.          |
| **ESDS**        | *Entry Sequenced Data Set* | Enregistrements stockés **dans l’ordre d’entrée**, sans clé. Accès **séquentiel ou par RBA** (Relative Byte Address). |
| **RRDS**        | *Relative Record Data Set* | Chaque enregistrement a un **numéro relatif (RRN)**. Accès **direct ou séquentiel**.                                  |
| **LDS**         | *Linear Data Set*          | Fichier binaire sans structure d’enregistrements, utilisé pour **bases de données ou systèmes (DB2, IMS)**.           |

---

## 📘 3. Concepts clés

| Concept                          | Définition                                                                                    |
| -------------------------------- | --------------------------------------------------------------------------------------------- |
| **Cluster**                      | Ensemble logique contenant un **Data Component (données)** et un **Index Component (index)**. |
| **Control Interval (CI)**        | Plus petite unité d’E/S VSAM (ex : 4 Ko). Contient plusieurs enregistrements.                 |
| **Control Area (CA)**            | Groupe de plusieurs CI.                                                                       |
| **Catalog**                      | Contient la description du fichier VSAM (comme une table des matières).                       |
| **RBA (Relative Byte Address)**  | Adresse physique d’un enregistrement dans le fichier (ESDS).                                  |
| **RRN (Relative Record Number)** | Position logique d’un enregistrement (RRDS).                                                  |

---

## 🔑 4. Accès aux fichiers VSAM

| Type d’accès           | Description                                | Exemple COBOL            |
| ---------------------- | ------------------------------------------ | ------------------------ |
| **Séquentiel**         | Lecture dans l’ordre des enregistrements   | `READ NEXT RECORD`       |
| **Direct (aléatoire)** | Lecture d’un enregistrement par clé ou RRN | `READ RECORD KEY IS ...` |
| **Dynamique**          | Mélange d’accès séquentiel et direct       | `ACCESS MODE IS DYNAMIC` |

---

## 🧮 5. JCL et allocation

Pour **créer un fichier VSAM**, on utilise le programme **IDCAMS** avec la commande `DEFINE CLUSTER` :

```jcl
//STEP1 EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
  DEFINE CLUSTER (NAME(FTEST.KSDS.FILE1) -
    INDEXED -
    KEYS(5 0) -
    RECORDSIZE(80 80) -
    VOLUMES(FDDBAS) -
    CYLINDERS(1,1)) -
  DATA (NAME(FTEST.KSDS.FILE1.DATA)) -
  INDEX (NAME(FTEST.KSDS.FILE1.INDEX))
/*
```

Et pour **supprimer** :

```jcl
DELETE FTEST.KSDS.FILE1 CLUSTER
```

---

## 💻 6. Utilisation en COBOL

### Déclaration :

```cobol
FD CLIENT-FILE
   RECORD CONTAINS 80 CHARACTERS
   RECORD KEY IS CLIENT-ID
   DATA RECORD IS CLIENT-REC.
01 CLIENT-REC.
   05 CLIENT-ID     PIC X(05).
   05 CLIENT-NAME   PIC X(30).
   05 CLIENT-CITY   PIC X(20).
```

### Accès :

```cobol
READ CLIENT-FILE
    KEY IS CLIENT-ID
    INVALID KEY DISPLAY "CLE NON TROUVEE".
```

---

## ⚡ 7. Avantages VSAM

✅ Lecture/écriture rapide
✅ Gestion automatique des espaces (CI, CA)
✅ Accès direct ou séquentiel
✅ Résilience en cas de panne
✅ Gestion centralisée via le *catalog*

---

## ⚠️ 8. Points d’attention

⚠️ Pas de **modification “en place”** d’un enregistrement (VSAM réécrit dans une autre zone).
⚠️ Une **clé dupliquée** est interdite dans un KSDS.
⚠️ La **taille du CI** et du **CA** influence la performance.
⚠️ Toujours **fermer proprement** les fichiers (CLOSE en COBOL ou DELETE en JCL).

---

## 🧠 9. Résumé express à retenir

| Élément                           | À retenir                            |
| --------------------------------- | ------------------------------------ |
| **VSAM = méthode d’accès rapide** | Meilleur que PS pour grands fichiers |
| **KSDS**                          | Avec clé                             |
| **ESDS**                          | Sans clé                             |
| **RRDS**                          | Par numéro                           |
| **LDS**                           | Données binaires                     |
| **IDCAMS**                        | Programme d’administration           |
| **Cluster = Data + Index**        | Structure de base                    |
| **CI / CA**                       | Unités de stockage interne           |

---

## Notions de l'organisation

- `Séquentielle` : accès en ordre
- `Indexée` : accès par clé
- `Relative` : accès par numéro (rattaché par le fichier RRDS)
- `Directe` : accès aléatoire

---

## 🧱 Définition simple

> 🔹 Un **fichier plat** contient des données **organisées de façon linéaire**, en **lignes et colonnes implicites**, souvent séparées par un **caractère délimiteur** (virgule, point-virgule, tabulation, etc.)
> 🔹 Chaque ligne correspond à **un enregistrement**, et chaque enregistrement contient **des champs de données**.

---

## 🧩 1. Types de fichiers plats

### a) **Fichier plat délimité**

Les champs sont séparés par un délimiteur comme `,` ou `;`.

Exemple : fichier CSV (Comma-Separated Values)

```
ID,Nom,Prenom,Age,Ville
00001,Dupont,Marie,32,Paris
00002,Durand,Paul,27,Lyon
00003,Nguyen,Sophie,41,Bordeaux
```

### b) **Fichier plat à largeur fixe (Fixed-Length)**

Chaque champ occupe **une position précise** dans la ligne (format typique en mainframe et COBOL).

Exemple :

```
00001DUPONT     MARIE     032PARIS     
00002DURAND     PAUL      027LYON      
00003NGUYEN     SOPHIE    041BORDEAUX  
```

➡️ Ici :

* Positions 1–5 = ID
* Positions 6–15 = Nom
* Positions 16–25 = Prénom
* Positions 26–28 = Âge
* Positions 29–38 = Ville

---

## 🖥️ 2. Exemple en mainframe (JCL / COBOL)

### 🧾 JCL

```jcl
//SORTEXE JOB (SORTEXE),'SORT',MSGCLASS=C,CLASS=A
//STEP1   EXEC PGM=SORT
//SYSOUT  DD SYSOUT=*
//SORTIN  DD DSN=FTEST.CLIENTS.FLAT,DISP=SHR
//SORTOUT DD SYSOUT=*
//SYSIN   DD *
  SORT FIELDS=(1,5,CH,A)
/*
```

### 💡 Ici :

`FTEST.CLIENTS.FLAT` est un **fichier plat séquentiel (PS)**
→ type “flat file” : il contient des enregistrements à format fixe, sans index ni clé.

---

## 📦 3. Différence avec VSAM

| Critère       | Fichier plat                      | Fichier VSAM                          |
| ------------- | --------------------------------- | ------------------------------------- |
| Structure     | Simple, linéaire                  | Structuré (index, clé, etc.)          |
| Accès         | Séquentiel                        | Séquentiel ou direct                  |
| Performance   | Moins rapide                      | Plus rapide (grâce à l’index)         |
| Usage typique | Fichiers d’échange, logs, exports | Bases de données fichiers, production |
| Exemple       | CSV, PS                           | KSDS, ESDS, RRDS                      |

---

## 🎯 4. Quand utiliser un fichier plat ?

✅ Pour échanger des données entre systèmes (mainframe ↔ PC)
✅ Pour stocker des logs, exports ou sauvegardes simples
✅ Pour tester des programmes COBOL ou SORT
✅ Pour importer dans Excel ou SQL

---

### 🧠 En résumé

| Élément     | Fichier plat                              |
| ----------- | ----------------------------------------- |
| Format      | Simple texte brut                         |
| Structure   | Enregistrements à la suite                |
| Séparateurs | Virgule, point-virgule ou positions fixes |
| Accès       | Séquentiel                                |
| Exemple     | CSV, TXT, PS (mainframe)                  |

---

# Notions avancées

---

## 🧱 1️⃣ VSAM = *Virtual Storage Access Method*

* **Définition :**
  C’est une **méthode d’accès** aux fichiers utilisée sur les systèmes **IBM Mainframe**.
  Contrairement aux fichiers “plats” (PS – *Physical Sequential*), VSAM permet **un accès rapide et structuré** aux données.

* **Avantage :**
  Il offre :

  * un **accès direct** ou **séquentiel** aux enregistrements,
  * une **meilleure gestion de la mémoire**,
  * et une **fiabilité accrue** (récupération, catalogage, indexation).

> 🔹 En résumé : VSAM = gestion de fichiers performante et optimisée, adaptée aux très grands volumes de données.

---

## 🔑 2️⃣ KSDS — *Key Sequenced Data Set*

* **Principe :**
  Les **enregistrements sont triés par une clé** (champ clé défini à la création).
  L’accès peut se faire :

  * **séquentiellement** (dans l’ordre des clés),
  * ou **directement** (par une clé précise).

* **Structure interne :**

  * **INDEX** : pour localiser rapidement la clé recherchée.
  * **DATA** : pour stocker les enregistrements eux-mêmes.
    Ensemble, ils forment un **cluster**.

> 🧠 Exemple : Fichier client trié par numéro de client.

---

## 🧾 3️⃣ ESDS — *Entry Sequenced Data Set*

* **Principe :**
  Les enregistrements sont stockés **dans l’ordre d’entrée (insertion)**, sans clé.
  Chaque enregistrement reçoit une **adresse relative (RBA : Relative Byte Address)**.

* **Accès :**

  * **Séquentiel** (dans l’ordre d’insertion),
  * ou **direct** si on connaît la RBA exacte.

> 🧠 Exemple : journal de logs, où l’ordre d’arrivée des données est important.

---

## 🔢 4️⃣ RRDS — *Relative Record Data Set*

* **Principe :**
  Chaque enregistrement possède un **numéro de position** (RRN : *Relative Record Number*).
  L’accès se fait donc :

  * **directement par numéro**,
  * ou **séquentiellement**.

> 🧠 Exemple : fichier d’inventaire avec un enregistrement n°1, n°2, n°3, etc.

---

## 💾 5️⃣ LDS — *Linear Data Set*

* **Principe :**
  Fichier VSAM **sans structure d’enregistrement** : il contient uniquement des **données binaires**.
  C’est le programme qui définit comment interpréter ces données.

* **Usage :**

  * fichiers d’images, de bases de données,
  * ou espace mémoire utilisé par **DB2**, **CICS**, ou **z/OS UNIX**.

> 🧠 Exemple : stockage binaire brut pour une base de données.

---

## 🧰 6️⃣ IDCAMS — *Integrated Data Control Access Method Services*

* **Rôle :**
  C’est un **programme utilitaire** pour **administrer les fichiers VSAM**.
  Il permet de :

  * Créer / Supprimer un cluster VSAM,
  * Lister le contenu d’un catalogue,
  * Copier / Renommer / Réorganiser des datasets,
  * Définir des catalogues utilisateurs (USERCATALOG).

* **Exemple de commande :**

  ```JCL
  //STEP1 EXEC PGM=IDCAMS
  //SYSIN DD *
      DEFINE CLUSTER(NAME(MY.DATA.KSDS) -
      INDEXED KEYS(10 0) RECORDSIZE(100 200) -
      VOLUME(VOL001) CYLINDERS(10,2))
  /* 
  ```

---

## 📦 7️⃣ Cluster = Data + Index

* Un **cluster** est l’unité de base du VSAM.
  Il regroupe :

  * un **composant DATA** : les enregistrements,
  * un **composant INDEX** : la table de clés.

> Le cluster simplifie la gestion car il relie les deux éléments sous un même nom logique.

---

## ⚙️ 8️⃣ CI / CA — *Control Interval* et *Control Area*

* **CI (Control Interval)**
  → C’est la **plus petite unité de stockage** dans VSAM.
  Il contient plusieurs enregistrements logiques + un petit espace libre pour les insertions.
  (Taille typique : 4K ou 8K octets)

* **CA (Control Area)**
  → Ensemble de plusieurs **CIs**.
  Quand un CI est plein, VSAM en alloue un autre dans la même CA.
  Quand la CA est pleine, une nouvelle CA est allouée.

> 🧠 Ces mécanismes permettent une **allocation dynamique** et un **accès rapide**, sans réécrire tout le fichier.

---

## 🧩 En résumé global :

| Élément     | Description courte                       | Exemple typique                     |
| ----------- | ---------------------------------------- | ----------------------------------- |
| **VSAM**    | Méthode d’accès rapide et fiable         | Fichiers volumineux sur z/OS        |
| **KSDS**    | Fichier avec clé d’accès                 | Fichier client (clé = N° client)    |
| **ESDS**    | Fichier séquentiel sans clé              | Journal de logs                     |
| **RRDS**    | Fichier à numéros d’enregistrement fixes | Fichier d’inventaire                |
| **LDS**     | Données binaires sans structure          | Fichiers système                    |
| **IDCAMS**  | Utilitaire de gestion VSAM               | Création et suppression de clusters |
| **Cluster** | Ensemble DATA + INDEX                    | Unité logique VSAM                  |
| **CI / CA** | Blocs internes de stockage               | Optimisation des accès disques      |

---

## 🧱 1️⃣ Le principe de l’espace libre (*Free Space*)

Quand on **crée un fichier VSAM (KSDS)** avec IDCAMS, on peut définir des **paramètres de gestion d’espace libre** grâce à ces deux options :

```text
FREESPACE(%) : (CI, CA)
```

➡️ Exemple :

```text
FREESPACE(10,5)
```

signifie :

* **10 %** d’espace libre laissé dans chaque **Control Interval (CI)**,
* **5 %** d’espace libre laissé dans chaque **Control Area (CA)**.

---

### 🔍 Pourquoi laisser de l’espace libre ?

Parce qu’un fichier KSDS est **ordonné par clé**, donc :

* Lorsqu’on insère un nouvel enregistrement avec une clé **intermédiaire** (pas à la fin du fichier),
  VSAM doit **l’insérer au bon endroit** pour conserver l’ordre des clés.
* Si le bloc (CI) où il doit être inséré est **plein**, il faut **faire de la place**.

C’est là qu’intervient le **split** 👇

---

## ⚙️ 2️⃣ Le mécanisme de “split” (déchirement de bloc)

Quand un **CI (Control Interval)** est plein et qu’un nouvel enregistrement doit y être inséré :

### 👉 Étape 1 : Split du CI

* Le CI plein est **divisé en deux** :

  * Une moitié des enregistrements reste dans le CI initial.
  * L’autre moitié est déplacée vers un **nouveau CI**.
* L’espace libre est **réinitialisé** dans les deux CIs.

🧠 Ce processus est appelé un **CI Split (Control Interval Split)**.

---

### 👉 Étape 2 : Split du CA (si nécessaire)

Si **tous les CIs** d’une **CA (Control Area)** sont pleins :

* VSAM crée une **nouvelle CA**.
* Il redistribue une partie des enregistrements de l’ancienne vers la nouvelle.

🧠 C’est un **CA Split (Control Area Split)**.

---

## 🧩 3️⃣ Exemple illustré

Imaginons un fichier KSDS contenant des clients triés par clé :

| Clé client         | CI1 | CI2 | CI3 |
| ------------------ | --- | --- | --- |
| 001, 002, 003, 004 | ✅   |     |     |

➡️ Si tu veux insérer un client **002A**, il doit aller **entre 002 et 003**.
Mais le **CI1** est plein ! 😅

VSAM fera alors :

1. Un **CI Split** :

   * CI1 garde la moitié basse (001, 002)
   * CI2 reçoit la moitié haute (003, 004)
2. Insère ensuite 002A dans le CI1.

---

## 📉 4️⃣ Conséquences des splits

### ✅ Avantages :

* Maintien automatique de l’ordre des clés.
* Pas besoin de réécrire tout le fichier.

### ⚠️ Inconvénients :

* Les splits consomment du **temps CPU et E/S disque**.
* Le fichier devient **fragmenté**, ralentissant les accès à long terme.
* Si le FREESPACE est trop faible, les splits seront **fréquents**.

---

## 💡 5️⃣ Bonnes pratiques

* Définir **FREESPACE(10,5)** ou **(20,10)** selon le taux prévu d’insertion.
* Réorganiser périodiquement le fichier avec :

  ```JCL
  REPRO INDATASET(OLD.KSDS) OUTDATASET(NEW.KSDS)
  ```

  → pour **éliminer la fragmentation**.
* Utiliser **IDCAMS LISTCAT** pour surveiller l’état du cluster.

---

## 🧠 6️⃣ Résumé visuel

| Élément          | Description                        | Exemple             |
| ---------------- | ---------------------------------- | ------------------- |
| **Free Space**   | Zone réservée à l’insertion future | FREESPACE(10,5)     |
| **CI Split**     | Division d’un bloc plein           | Un CI devient deux  |
| **CA Split**     | Division d’une zone pleine         | Une CA devient deux |
| **Avantage**     | Pas de réécriture complète         | Accès rapide        |
| **Inconvénient** | Fragmentation + coût CPU           | Nécessite REPRO     |

---

