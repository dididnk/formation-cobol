# Exercice AIX 
---

### **1️⃣ Quelles sont les commandes modales ?**

* Les commandes **modales** sont des commandes IDCAMS qui restent “actives” jusqu’à ce qu’une autre commande soit exécutée.
* Exemple : `DEFINE CLUSTER`, `DEFINE PATH`, `ALTER`, `REPRO`, `BLDINDEX`.
* Elles peuvent affecter plusieurs objets tant que le bloc SYSIN est actif.

---

### **2️⃣ À quoi sert la commande LASTCC ?**

* `LASTCC` retourne le **code de retour de la dernière commande exécutée**.
* Utilisé pour savoir si une opération précédente a réussi (`LASTCC=0`) ou échoué (`LASTCC>0`) et agir en conséquence (`IF LASTCC=0 THEN …`).

---

### **3️⃣ Différence entre LASTCC et MAXCC**

| Élément    | Description                                                                |
| ---------- | -------------------------------------------------------------------------- |
| **LASTCC** | Code de retour de la **dernière commande** exécutée                        |
| **MAXCC**  | Code de retour **le plus élevé** rencontré depuis le début du job ou étape |

---

### **4️⃣ Peut-on utiliser la commande DEFINE SPACE pour un CLUSTER ?**

* Non, `DEFINE SPACE` n’existe pas pour créer un cluster.
* Pour allouer l’espace d’un cluster, on utilise **DEFINE CLUSTER** avec les paramètres `TRACKS`, `CYLINDERS`, `RECORDSIZE`, etc.

---

### **5️⃣ Utiliser DEFINE CLUSTER pour définir des clusters**

```jcl
// Création ESDS
DEFINE CLUSTER(NAME(FTEST.ESDS) -
               RECORDSIZE(80,80) -
               TRACKS(1,1) -
               VOL(FDDBAS))

// Création KSDS
DEFINE CLUSTER(NAME(FTEST.KSDS) -
               RECORDSIZE(80,80) -
               KEYS(10,0) -
               TRACKS(1,1) -
               VOL(FDDBAS))

// Création RRDS
DEFINE CLUSTER(NAME(FTEST.RRDS) -
               RECORDSIZE(50,50) -
               TRACKS(1,1) -
               VOL(FDDBAS))

// Création LDS
DEFINE CLUSTER(NAME(FTEST.LDS) -
               RECORDSIZE(40,40) -
               TRACKS(1,1) -
               VOL(FDDBAS))
```

---

### **6️⃣ Appliquer la commande LISTCAT sur chaque cluster**

```jcl
LISTCAT ENTRY(FTEST.ESDS) ALL
LISTCAT ENTRY(FTEST.KSDS) ALL
LISTCAT ENTRY(FTEST.RRDS) ALL
LISTCAT ENTRY(FTEST.LDS) ALL
```

---

### **7️⃣ Définir un index secondaire pour le cluster KSDS**

```jcl
DEFINE CLUSTER(NAME(FTEST.AIX.KSDS) -
               INDEXED -
               TRACKS(1,1) -
               RECORDSIZE(80,80) -
               VOL(FDDBAS))
```

* **Rôle :** L’AIX permet d’accéder au KSDS via une **clé alternative**.

---

### **8️⃣ Définir le chemin (PATH) entre l’AIX et le KSDS**

```jcl
DEFINE PATH(NAME(FTEST.PATH) -
            PATHENTRY(FTEST.AIX.KSDS))
```

* **Rôle :** Objet logique qui permet aux programmes d’accéder au KSDS via l’AIX.

---

### **9️⃣ Construire l’index secondaire (BLDINDEX)**

```jcl
BLDINDEX INDATASET(FTEST.KSDS) -
         OUTDATASET(FTEST.AIX.KSDS) -
         NOSORTCALL
```

* **Rôle :** Remplit physiquement l’AIX avec les données du KSDS.

---

### **🔟 Vérifier les entités créées avec LISTCAT**

```jcl
LISTCAT ENTRY(FTEST.KSDS) ALL
LISTCAT ENTRY(FTEST.AIX.KSDS) ALL
LISTCAT ENTRY(FTEST.PATH) ALL
```

* Permet de s’assurer que :

  * Le KSDS existe et contient ses caractéristiques
  * L’AIX a été créé et indexé
  * Le PATH existe pour l’accès via l’AIX

