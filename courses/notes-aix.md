# Résumé du processus AIX (Alternate Index) dans VSAM

---

### 1️⃣ **Création du KSDS avec données (ENTDATA)**

➡️ **Rôle :** C’est le fichier principal (cluster) contenant les enregistrements VSAM.
➡️ **Importance :**

* Il contient la clé primaire (key)
* Les données sont stockées de façon ordonnée selon cette clé

📌 **Pourquoi indispensable ?**
Un AIX ne peut exister que s’il a un fichier **KSDS** à indexer. C’est la base.

---

### 2️⃣ **Création de l'AIX (Alternate Index)**

➡️ **Rôle :** Fichier d’index secondaire permettant d’accéder au KSDS via une **autre clé** (ex : numéro client, code métier, etc.).

➡️ **Importance :**

* Permet des lectures par autre critère que la clé primaire
* Utile dans les recherches multi-clés

📌 **Dépendance :**
L’AIX **référence le KSDS**, donc le KSDS doit exister avant.

---

### 3️⃣ **Création du PATH**

➡️ **Rôle :** C'est un objet logique qui sert de **pont** entre le programme et l’AIX.

➡️ **Importance :**

* Permet aux applications d’accéder au KSDS **via l’AIX**
* Le programme ouvre le PATH, et VSAM redirige vers le KSDS à travers l’AIX

📌 **Dépendance :**
Le PATH **pointe sur l’AIX**, donc l’AIX doit exister avant.

---

### 4️⃣ **Exécution de BLDINDEX**

➡️ **Rôle :** Construire physiquement l’index alternatif en liant les données KSDS à l’AIX.

➡️ **Importance :**

* Remplit l’AIX avec les valeurs dérivées du KSDS
* Sans BLDINDEX, l’AIX est vide → pas d’accès possible via la clé secondaire

📌 **Dépendance :**

* Le KSDS doit déjà contenir des données
* L’AIX doit être défini
* Le PATH existe pour permettre les accès

---

### 🔗 **Relation entre les composants**

| Étape | Objet    | Rôle                           | Dépend de         |
| ----- | -------- | ------------------------------ | ----------------- |
| 1     | KSDS     | Contient les données           | —                 |
| 2     | AIX      | Index secondaire sur KSDS      | KSDS              |
| 3     | PATH     | Accès logique via AIX          | KSDS + AIX        |
| 4     | BLDINDEX | Remplit l’AIX à partir du KSDS | KSDS + AIX + PATH |

---

### ✅ **Phrase de conclusion**

En résumé, le KSDS contient les données avec une clé principale, l’AIX fournit un accès secondaire, le PATH sert de passerelle d'accès via cette nouvelle clé, et BLDINDEX construit réellement l’index pour rendre cette recherche possible. Chaque étape dépend de la précédente car l’AIX et le PATH sont des extensions logiques du KSDS.

---

Voici un schéma visuel simple pour illustrer le flux KSDS → AIX → PATH → BLDINDEX :

```
+------------------------+
|        KSDS            |  <-- Fichier principal contenant les données
| (Key primaire)         |
+------------------------+
           |
           |  Référence secondaire (nouvelle clé)
           v
+------------------------+
|         AIX            |  <-- Index alternatif
| (Key secondaire)       |
+------------------------+
           |
           |  Accès logique via PATH
           v
+------------------------+
|        PATH            |  <-- Objet d’accès pour le programme
| (Pont KSDS ↔ AIX)      |
+------------------------+
           |
           |  Rempli physiquement par
           v
+------------------------+
|      BLDINDEX          |  <-- Commande IDCAMS qui construit l’AIX
+------------------------+
```

### 🔹 Légende :

* **KSDS** : Données principales avec clé primaire
* **AIX** : Index secondaire pour un autre critère de recherche
* **PATH** : Permet aux programmes d’accéder aux données via l’AIX
* **BLDINDEX** : Commande qui lie l’AIX au KSDS en remplissant l’index

---