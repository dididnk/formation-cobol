# ⭐ Résumé : Le tri interne (SORT) en COBOL

Le **tri interne** en COBOL est réalisé à l’aide de la **commande `SORT`**. Il permet de trier un fichier ou des enregistrements **en mémoire** (ou dans des fichiers temporaires) sans créer votre propre algorithme de tri. COBOL gère automatiquement :

* la lecture du fichier source,
* le tri selon une ou plusieurs clés,
* l’écriture du fichier trié,
* et même la transformation au passage via des procédures.

---

# 🧩 1. Structure générale d’un tri interne

La forme la plus simple est :

```cobol
SORT fichier-travail
     ON ASCENDING KEY cle-1 cle-2 ...
     USING fichier-source
     GIVING fichier-cible.
```

### Explications :

* **`fichier-travail`** : fichier logique déclaré dans la *SD (Sort Description)* de la DATA DIVISION. C’est le fichier utilisé par le moteur de tri interne.
* **`USING`** : fichier(s) d’entrée (sources).
* **`GIVING`** : fichier trié de sortie.
* **`ON ASCENDING` / `ON DESCENDING`** : sens du tri.
* **Clés** : peuvent être multiples ; le tri se fait dans l’ordre des clés listées.

> ⚠️ Le fichier-travail **ne doit pas être ouvert** manuellement : COBOL le gère.

---

# 🧩 2. Déclaration du fichier de tri (SD)

Dans la **DATA DIVISION**, SECTION **FILE SECTION**, on déclare le fichier de tri dans une zone spéciale :

```cobol
SD  FICHIER-TRI.
01  ENR-TRI.
    05 CLE1         PIC X(10).
    05 CLE2         PIC 9(5).
    05 AUTRES-CHAMPS PIC X(50).
```

* `SD` = Sort Description
* On décrit l’enregistrement utilisé pendant le tri avec toutes ses données.
* Les clés doivent exister dans cette structure.

---

# 🧩 3. Tri avec procédures (INPUT PROCEDURE / OUTPUT PROCEDURE)

Si vous devez **transformer** les données avant OU après le tri, ou si vous n’avez pas de fichier d’entrée/sortie classique, vous utilisez :

## 👉 INPUT PROCEDURE

COBOL appelle la procédure pour **fournir les enregistrements à trier** :

```cobol
SORT FICHIER-TRI
     ON ASCENDING KEY CLE1
     INPUT PROCEDURE IS LIRE-DONNEES
     OUTPUT PROCEDURE IS ECRIRE-DONNEES.
```

### INPUT PROCEDURE :

* Fournit les données une par une via `RELEASE FICHIER-TRI-ENR`.

Exemple :

```cobol
LIRE-DONNEES.
    OPEN INPUT FICHIER-SOURCE
    PERFORM UNTIL EOF = 'O'
       READ FICHIER-SOURCE
         AT END MOVE 'O' TO EOF
       NOT AT END
         MOVE ... TO ENR-TRI
         RELEASE ENR-TRI
       END-READ
    END-PERFORM
    CLOSE FICHIER-SOURCE.
```

## 👉 OUTPUT PROCEDURE

Récupère les données triées via `RETURN FICHIER-TRI`.

Exemple :

```cobol
ECRIRE-DONNEES.
    OPEN OUTPUT FICHIER-CIBLE
    PERFORM UNTIL NO-MORE-RECORDS
       RETURN FICHIER-TRI
         AT END MOVE "OUI" TO NO-MORE-RECORDS
       NOT AT END
         WRITE ENR-CIBLE FROM ENR-TRI
       END-RETURN
    END-PERFORM
    CLOSE FICHIER-CIBLE.
```

---

# 🧩 4. Clés de tri (KEYS)

Vous pouvez trier sur :

* **1 clé**
* **Plusieurs clés**
* Clés numériques, alphanumériques
* Sens ascendant ou descendant

Exemples :

```cobol
ON ASCENDING KEY NOM
ON DESCENDING KEY SALAIRE
```

---

# 🧩 5. Types de tri

COBOL propose 2 commandes :

### ➤ `SORT`

Tri simple d’un fichier ou flux.

### ➤ `MERGE`

Fusion ordonnée de plusieurs fichiers **déjà triés**.

Exemple MERGE :

```cobol
MERGE F-TRI
     ON ASCENDING KEY CLE
     USING F1 F2 F3
     GIVING F-SORTIE.
```

---

# 🧩 6. Avantages du tri interne

✔ Très simple à mettre en place
✔ Performances optimisées (tri externe + buffers)
✔ Pas besoin d’écrire un algorithme de tri
✔ Permet de transformer les données via INPUT/OUTPUT PROCEDURE
✔ Gestion automatique des fichiers temporaires

---

# 🧩 8. Exemple complet (tri simple)

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRI_SIMPLE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHIER-IN  ASSIGN TO "clients.dat".
           SELECT FICHIER-OUT ASSIGN TO "clients-trie.dat".

       DATA DIVISION.
       FILE SECTION.

       FD  FICHIER-IN.
       01  CLIENT-IN.
           05 NOM         PIC X(20).
           05 VILLE       PIC X(20).
           05 CODEPOSTAL  PIC 9(5).

       FD  FICHIER-OUT.
       01  CLIENT-OUT     PIC X(45).

       SD  FICHIER-TRI.
       01  CLIENT-TRI.
           05 CLE-NOM     PIC X(20).
           05 VILLE       PIC X(20).
           05 CP          PIC 9(5).

       PROCEDURE DIVISION.

       TRI-CLIENTS.
           SORT FICHIER-TRI
                ON ASCENDING KEY CLE-NOM
                USING FICHIER-IN
                GIVING FICHIER-OUT
           .
           STOP RUN.
```

---

# ✔ Ce qu'il faut retenir (ultra résumé)

| Concept                    | Explication                                        |
| -------------------------- | -------------------------------------------------- |
| **SORT**                   | Trie des données selon une ou plusieurs clés       |
| **SD**                     | Déclaration du fichier de tri interne              |
| **USING / GIVING**         | Tri simple fichier → fichier                       |
| **INPUT PROCEDURE**        | Vous générez vous-même les enregistrements à trier |
| **OUTPUT PROCEDURE**       | Vous traitez vous-même les enregistrements triés   |
| **ASCENDING / DESCENDING** | Sens du tri                                        |
| **MERGE**                  | Fusion ordonnée de plusieurs fichiers triés        |

---