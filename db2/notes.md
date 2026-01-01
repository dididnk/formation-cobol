# ✅ **Résumé du cours DB2 sous z/OS**

DB2 est un **SGBD relationnel** (RDBMS) optimisé pour les environnements **mainframe z/OS**, utilisé dans les grandes entreprises pour garantir performance, disponibilité et sécurité.

---

# 1️⃣ **Architecture générale de DB2 z/OS**

DB2 est composé de plusieurs sous-systèmes :

### **• MSTR (Master Address Space)**

* Gère les fonctions critiques : récupération (recovery), logs, commandes DB2.
* Supervise les autres sous-systèmes.

### **• DBM1 (Database Manager)**

* Gère la mémoire, les buffers, la gestion des pages, le cache.
* Traite les accès aux tables, aux index, etc.

### **• DIST (Distributed Data Facility / DDF)**

* Permet l’accès à DB2 depuis le réseau (applications distantes).
* Supporte DRDA, JDBC, ODBC.

### **• IRLM (Lock Manager)**

* Gère les verrous pour les accès concurrents (locks).
* Garantit l’intégrité des données.

---

# 2️⃣ **Objets principaux dans DB2**

### **DATABASE**

Conteneur logique regroupant des objets.

### **TABLESPACE**

* Espace physique de stockage des tables.
* Types :

  * **Simple**
  * **Segmented**
  * **Partitionné / UTS (Universal Tablespace)**

### **TABLE**

* Structure relationnelle regroupant les données.

### **COLUMN**

* Attribut d'une table.

### **INDEX**

* Accélère la recherche (accès direct via clé).
* Clé unique (PRIMARY KEY) ou non.

### **VIEW**

* Table virtuelle basée sur une ou plusieurs tables.

### **SYNONYM / ALIAS**

* Noms alternatifs pour accéder aux tables.

---

# 3️⃣ **Organisation du stockage**

DB2 stocke les données de manière **paged**.

### **PAGE (4K, 8K, 16K, 32K)**

Unité de stockage en DB2.

### **BUFFER POOL**

* Cache mémoire des pages.
* Améliore les performances.

### **LOGS (WAL : Write Ahead Logging)**

Contiennent toutes les modifications faites aux données.
Servent à la récupération après incident.

---

# 4️⃣ **SQL dans DB2 sous z/OS**

On distingue trois catégories :

### 🔹 **SQL DDL – Data Definition Language**

Exemples :

* `CREATE TABLE`
* `CREATE INDEX`
* `ALTER TABLE`
* `DROP TABLE`

### 🔹 **SQL DML – Data Manipulation Language**

Exemples :

* `SELECT`
* `INSERT`
* `UPDATE`
* `DELETE`

### 🔹 **SQL DCL – Data Control Language**

Exemples :

* `GRANT`
* `REVOKE`

### 🔹 **SQL dans COBOL via EXEC SQL**

Integration CICS/COBOL :

```
EXEC SQL
   SELECT COL1, COL2
   INTO :WS-COL1, :WS-COL2
   FROM CLIENT
   WHERE ID = :WS-ID
END-EXEC.
```

---

# 5️⃣ **Plans, Packages et Bind**

Lorsqu’un programme COBOL ou CICS utilise SQL, DB2 génère :

### **PACKAGE**

* Plan d’exécution d’un module.

### **PLAN**

* Contient un ou plusieurs packages.
* Chargé par CICS ou une transaction.

### **BIND**

* Étape essentielle :

  * Résout les objets
  * Optimise les requêtes via le *DB2 Optimizer*
  * Crée ou met à jour le package/plan.

Commande typique :

```
//BIND EXEC PGM=IKJEFT01  
   SYSTSIN DD *
      DSN SYSTEM(DB2P)
      BIND PACKAGE(COBPKG1) MEMBER(PROGCOB) ACT(REPLACE)
   END
```

---

# 6️⃣ **Sécurité et gestion concurrente**

### **LOCKING LEVELS**

* Table
* Page
* Row (ligne)
* Tablespace

### **TYPES DE LOCK**

* S (Share)
* X (Exclusive)
* IS, IX, SIX
* NL (No Lock)

### **ISOLATION LEVELS**

* **RR** (Repeatable Read)
* **RS** (Read Stability)
* **CS** (Cursor Stability) → le plus courant
* **UR** (Uncommitted Read)

---

# 7️⃣ **Recovery & Maintenance**

### **Image Copy**

Sauvegarde physique d'un tablespace.

### **Reorg**

Réorganisation des données (compactage, performance).

### **Runstats**

Analyse les statistiques utilisées par l’optimiseur.

### **Backup / Recovery**

S'appuie sur les logs + image copy + undo/redo.

---

# 8️⃣ **DB2 et CICS**

CICS ne communique pas directement avec DB2 :

→ Utilise le **DB2 Attachment Facility**
→ Chaque transaction CICS doit être associée à un **PLAN** DB2.

COBOL+CICS+DB2 suit ce modèle :

1. `SEND MAP`
2. `RECEIVE MAP`
3. `EXEC SQL SELECT` / `UPDATE`
4. Affichage résultats

---

# 9️⃣ **Avantages de DB2 sous z/OS**

* Très haute disponibilité
* Transactions rapides
* Scalable (grands volumes)
* Fiabilité (Z/OS + DB2 = combinaison bancaire/assurance)
* Très bonne gestion du locking

---

# 🔟 **Utilisation dans les entreprises**

DB2 z/OS est utilisé pour :

* La banque
* L’assurance
* Les télécoms
* Les très grands systèmes transactionnels

---