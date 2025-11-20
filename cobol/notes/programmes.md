# Programme et sous-programme
---

# Résumé : Programmes et Sous-Programmes en COBOL

## 1. Structure de Base d'un Programme COBOL

Un programme COBOL est constitué de quatre divisions principales :

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. MON-PROGRAMME.
AUTHOR. VOTRE-NOM.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-VARIABLE      PIC X(10).

PROCEDURE DIVISION.
MAIN-PROGRAM.
    DISPLAY "Programme principal"
    STOP RUN.
```

## 2. Types de Sous-Programmes

### A. CALL statique (Interne)

**Programme Principal :**
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. PROG-PRINCIPAL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-RESULTAT      PIC 9(5).
01 WS-NOM           PIC X(20) VALUE "Dupont".

PROCEDURE DIVISION.
DEBUT.
    DISPLAY "Début du programme principal"
    
    CALL "SOUS-PROG" USING WS-NOM, WS-RESULTAT
    
    DISPLAY "Résultat: " WS-RESULTAT
    STOP RUN.
```

**Sous-Programme :**
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. SOUS-PROG.

DATA DIVISION.
WORKING-STORAGE SECTION.
LINKAGE SECTION.
01 LS-NOM           PIC X(20).
01 LS-RESULTAT      PIC 9(5).

PROCEDURE DIVISION USING LS-NOM, LS-RESULTAT.
DEBUT.
    DISPLAY "Sous-programme appelé avec: " LS-NOM
    COMPUTE LS-RESULTAT = LENGTH OF LS-NOM
    GOBACK.
```

### B. CALL dynamique

**Programme Principal :**
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. PROG-DYNAMIQUE.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NOM-PROG      PIC X(20) VALUE "SOUS-PROG".
01 WS-RESULTAT      PIC 9(5).
01 WS-STATUT        PIC 9(2).

PROCEDURE DIVISION.
DEBUT.
    DISPLAY "Appel dynamique"
    
    CALL WS-NOM-PROG USING WS-RESULTAT
         ON EXCEPTION
            DISPLAY "Sous-programme non trouvé"
         NOT ON EXCEPTION
            DISPLAY "Appel réussi"
    END-CALL
    
    STOP RUN.
```

### C. CALL avec Paramètres Optionnels

**Programme Principal :**
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. PROG-OPTIONNEL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-PARAM1        PIC 9(3) VALUE 100.
01 WS-PARAM2        PIC 9(3) VALUE 200.
01 WS-PARAM3        PIC 9(3).

PROCEDURE DIVISION.
DEBUT.
    *> Appel avec deux paramètres
    CALL "SOUS-OPT" USING WS-PARAM1, WS-PARAM2
    
    *> Appel avec trois paramètres
    CALL "SOUS-OPT" USING WS-PARAM1, WS-PARAM2, WS-PARAM3
    
    STOP RUN.
```

**Sous-Programme :**
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. SOUS-OPT.

DATA DIVISION.
LINKAGE SECTION.
01 LS-PARAM1        PIC 9(3).
01 LS-PARAM2        PIC 9(3).
01 LS-PARAM3        PIC 9(3).

PROCEDURE DIVISION USING LS-PARAM1, LS-PARAM2, 
                         OPTIONAL LS-PARAM3.
DEBUT.
    IF LS-PARAM3 = OMITTED
        DISPLAY "Paramètre 3 omis"
        COMPUTE LS-PARAM1 = LS-PARAM1 + LS-PARAM2
    ELSE
        DISPLAY "Tous paramètres présents"
        COMPUTE LS-PARAM1 = LS-PARAM1 + LS-PARAM2 + LS-PARAM3
    END-IF
    GOBACK.
```

## 3. Passage de Paramètres

### A. BY REFERENCE (Par défaut)
```cobol
* Programme Principal
CALL "SOUS-PROG" USING WS-VARIABLE *> BY REFERENCE par défaut

* Sous-programme reçoit l'adresse mémoire
```

### B. BY CONTENT (Valeur seule)
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. PROG-CONTENT.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-VAL-A         PIC 9(3) VALUE 50.
01 WS-VAL-B         PIC 9(3) VALUE 30.

PROCEDURE DIVISION.
DEBUT.
    CALL "CALCUL" USING BY CONTENT WS-VAL-A, 
                         BY CONTENT WS-VAL-B
    STOP RUN.
```

### C. BY VALUE (Pour API externes)
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. PROG-VALUE.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NOMBRE        PIC S9(9) BINARY VALUE 123.

PROCEDURE DIVISION.
DEBUT.
    CALL "API-EXTERNE" USING BY VALUE WS-NOMBRE
    STOP RUN.
```

## 4. Gestion des Fichiers Partagés

**Programme Principal :**
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. PROG-FICHIER.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FIC-CLIENTS ASSIGN TO "CLIENTS.DAT"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS CLI-CODE
           FILE STATUS IS FS-STATUT.

DATA DIVISION.
FILE SECTION.
FD FIC-CLIENTS.
01 CLI-ENREG.
   05 CLI-CODE      PIC 9(5).
   05 CLI-NOM       PIC X(30).

WORKING-STORAGE SECTION.
01 FS-STATUT        PIC XX.

PROCEDURE DIVISION.
DEBUT.
    OPEN INPUT FIC-CLIENTS
    CALL "TRAIT-CLIENTS" USING FIC-CLIENTS, FS-STATUT
    CLOSE FIC-CLIENTS
    STOP RUN.
```

**Sous-Programme :**
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. TRAIT-CLIENTS.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FIC-CLIENTS ASSIGN TO "CLIENTS.DAT"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS CLI-CODE
           FILE STATUS IS FS-STATUT.

DATA DIVISION.
FILE SECTION.
FD FIC-CLIENTS.
01 CLI-ENREG.
   05 CLI-CODE      PIC 9(5).
   05 CLI-NOM       PIC X(30).

WORKING-STORAGE SECTION.
LINKAGE SECTION.
01 LS-FIC-CLIENTS   PIC X(100). *> Représentation du fichier
01 LS-STATUT        PIC XX.

PROCEDURE DIVISION USING LS-FIC-CLIENTS, LS-STATUT.
DEBUT.
    PERFORM UNTIL LS-STATUT = "10" *> Fin de fichier
        READ FIC-CLIENTS
            AT END 
               CONTINUE
            NOT AT END
               DISPLAY "Client: " CLI-CODE " - " CLI-NOM
        END-READ
    END-PERFORM
    GOBACK.
```

## 5. Programme Nested (Imbriqué)

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. PROG-PRINCIPAL.
AUTHOR. EXEMPLE.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-COMPTEUR      PIC 9(3).

PROCEDURE DIVISION.
DEBUT.
    MOVE 0 TO WS-COMPTEUR
    PERFORM 10 TIMES
        CALL "SOUS-PROG" USING WS-COMPTEUR
    END-PERFORM
    DISPLAY "Compteur final: " WS-COMPTEUR
    STOP RUN.

IDENTIFICATION DIVISION.
PROGRAM-ID. SOUS-PROG.

DATA DIVISION.
LINKAGE SECTION.
01 LS-COMPTEUR      PIC 9(3).

PROCEDURE DIVISION USING LS-COMPTEUR.
DEBUT.
    ADD 1 TO LS-COMPTEUR
    DISPLAY "Appel numéro: " LS-COMPTEUR
    GOBACK.

END PROGRAM SOUS-PROG.
END PROGRAM PROG-PRINCIPAL.
```

## 6. Gestion des Erreurs et Statuts

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. PROG-ERREUR.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-STATUT-APPEL  PIC 9(2).
01 WS-RESULTAT      PIC 9(5).

PROCEDURE DIVISION.
DEBUT.
    CALL "SOUS-PROG" USING WS-RESULTAT
         ON OVERFLOW
            DISPLAY "Erreur: débordement"
         ON EXCEPTION
            DISPLAY "Erreur: sous-programme inaccessible"
    END-CALL
    
    *> Vérification du statut
    CALL "CEE3ABD" USING WS-STATUT-APPEL
    EVALUATE WS-STATUT-APPEL
        WHEN 00 DISPLAY "Succès"
        WHEN 08 DISPLAY "Attention"
        WHEN OTHER DISPLAY "Erreur: " WS-STATUT-APPEL
    END-EVALUATE
    
    STOP RUN.
```

## 7. Exemple Complet avec Tableau

**Programme Principal :**
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. GESTION-TABLEAU.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TABLEAU.
   05 WS-ELEMENT    PIC 9(3) OCCURS 10 TIMES
                    INDEXED BY IDX.
01 WS-SOMME         PIC 9(5).
01 WS-MOYENNE       PIC 9(3)V99.

PROCEDURE DIVISION.
DEBUT.
    *> Initialisation du tableau
    PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 10
        COMPUTE WS-ELEMENT(IDX) = IDX * 10
    END-PERFORM
    
    *> Appel du sous-programme de calcul
    CALL "CALCUL-STATS" USING WS-TABLEAU, WS-SOMME, WS-MOYENNE
    
    DISPLAY "Somme: " WS-SOMME
    DISPLAY "Moyenne: " WS-MOYENNE
    
    STOP RUN.
```

**Sous-Programme :**
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. CALCUL-STATS.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-INDICE        PIC 9(2).
LINKAGE SECTION.
01 LS-TABLEAU.
   05 LS-ELEMENT    PIC 9(3) OCCURS 10 TIMES.
01 LS-SOMME         PIC 9(5).
01 LS-MOYENNE       PIC 9(3)V99.

PROCEDURE DIVISION USING LS-TABLEAU, LS-SOMME, LS-MOYENNE.
DEBUT.
    MOVE 0 TO LS-SOMME
    PERFORM VARYING WS-INDICE FROM 1 BY 1 
            UNTIL WS-INDICE > 10
        ADD LS-ELEMENT(WS-INDICE) TO LS-SOMME
    END-PERFORM
    
    COMPUTE LS-MOYENNE = LS-SOMME / 10
    GOBACK.
```

## Points Clés sur le type d'appel (programme -> sous-programme) :

1. **CALL statique** : Le sous-programme doit être disponible à la compilation
2. **CALL dynamique** : Le sous-programme est résolu à l'exécution
3. **BY REFERENCE** : Modification possible des paramètres (par défaut)
4. **BY CONTENT** : Le sous-programme reçoit une copie des valeurs
5. **OPTIONAL** : Permet des paramètres facultatifs
6. **GOBACK** : Termine le sous-programme et retourne au programme appelant
7. **LINKAGE SECTION** : Déclare les paramètres d'entrée/sortie

---
# Tableau des Types d'Appel en COBOL

## Tableau Comparatif des Méthodes d'Appel

| **Type d'Appel** | **Syntaxe** | **Mécanisme** | **Performance** | **Modification Paramètres** | **Utilisation Mémoire** | **Scénario d'Usage** |
|------------------|-------------|---------------|-----------------|-----------------------------|--------------------------|---------------------|
| **CALL Statique** | `CALL "nom-programme" USING param1, param2` | Résolu à la compilation | ⭐⭐⭐⭐⭐ (Rapide) | ✅ Possible (BY REFERENCE) | Faible | Programmes stables, liens permanents |
| **CALL Dynamique** | `CALL nom-variable USING param1, param2` | Résolu à l'exécution | ⭐⭐ (Lent) | ✅ Possible | Élevée | Plugins, modules interchangeables |
| **BY REFERENCE** | `CALL "prog" USING BY REFERENCE param` | Passe l'adresse mémoire | ⭐⭐⭐⭐⭐ | ✅ Directe | Minimale | Modification des données nécessaires |
| **BY CONTENT** | `CALL "prog" USING BY CONTENT param` | Passe une copie de la valeur | ⭐⭐⭐ | ❌ Impossibe | Double | Protection des données d'origine |
| **BY VALUE** | `CALL "prog" USING BY VALUE param` | Passe la valeur directement | ⭐⭐⭐⭐ | ❌ Impossibe | Modérée | API externes, langage C |
| **OPTIONAL** | `PROCEDURE DIVISION USING param1 OPTIONAL param2` | Paramètres facultatifs | ⭐⭐⭐ | Conditionnelle | Optimisée | Interfaces flexibles |

---

## Tableau Détail des Mécanismes de Passage

| **Aspect** | **BY REFERENCE** | **BY CONTENT** | **BY VALUE** |
|------------|------------------|----------------|--------------|
| **Principe** | Passage d'adresse | Copie de la valeur | Valeur brute |
| **Modification** | Répercutée dans l'appelant | Locale au sous-programme | Impossible |
| **Performance** | Optimale | Coût de copie | Bonne |
| **Sécurité** | Risque de modification | Protection des données | Sécurisé |
| **Usage COBOL** | Par défaut | Données en lecture seule | Interfaces externes |
| **Syntaxe Appel** | `USING param` (implicite) | `USING BY CONTENT param` | `USING BY VALUE param` |
| **Syntaxe Sous-prog** | `USING param` | `USING param` | `USING param` |

---

## Tableau Gestion des Paramètres

| **Type Paramètre** | **Déclaration** | **Valeur Initiale** | **Test Présence** | **Valeur Retour** |
|--------------------|-----------------|---------------------|-------------------|-------------------|
| **Obligatoire** | `01 param PIC X(10)` | Définie par appelant | Toujours présent | Modifiable |
| **OPTIONAL** | `01 param PIC X(10) OPTIONAL` | Indéfinie | `IF param = OMITTED` | Conditionnelle |
| **TABLEAU** | `01 tab OCCURS 10` | Selon appelant | Taille fixe | Éléments modifiables |
| **FICHIER** | `FD mon-fichier` | État ouvert/fermé | Via FILE STATUS | Partagé |

---

## Tableau Comportement des Instructions de Retour

| **Instruction** | **Programme Principal** | **Sous-Programme** | **Effet sur la Mémoire** | **Contexte d'Appel** |
|-----------------|-------------------------|---------------------|--------------------------|---------------------|
| **STOP RUN** | Termine le programme | Termine TOUS les programmes | Libère toute la mémoire | Programme racine |
| **GOBACK** | Équivalent à STOP RUN | Retour à l'appelant | Libère pile locale | Tous programmes |
| **EXIT PROGRAM** | Comportement indéfini | Retour à l'appelant | Préserve l'état | Sous-programmes uniquement |

---

## Tableau Gestion des Erreurs et Exceptions

| **Type d'Erreur** | **Détection** | **Gestion** | **Impact** | **Exemple** |
|-------------------|---------------|-------------|------------|-------------|
| **Programme absent** | `ON EXCEPTION` | `ON EXCEPTION` / `NOT ON EXCEPTION` | Arrêt ou continuation | CALL dynamique échoué |
| **Débordement** | `ON OVERFLOW` | Traitement alternatif | Calculs invalides | Résultat trop grand |
| **État programme** | `CALL "CEE3ABD"` | Inspection statut | Décision conditionnelle | Vérification succès/échec |
| **Paramètre OMITTED** | `IF param = OMITTED` | Logique conditionnelle | Comportement adaptatif | Paramètres optionnels |

---

## Tableau Stratégies de Compilation

| **Stratégie** | **Compilation** | **Édition de Liens** | **Flexibilité** | **Performance** | **Maintenance** |
|---------------|-----------------|----------------------|-----------------|-----------------|-----------------|
| **Monolithique** | Tous programmes ensemble | Statique | Faible | Excellente | Complexe |
| **Modulaire** | Séparée + édition liens | Statique ou dynamique | Modérée | Bonne | Facilitée |
| **Dynamique** | Programmes séparés | À l'exécution | Élevée | Correcte | Flexible |

---

## Récapitulatif des Best Practices

| **Scénario** | **Type d'Appel Recommandé** | **Passage Paramètres** | **Gestion Retour** |
|--------------|----------------------------|------------------------|-------------------|
| **Modules stables** | CALL statique | BY REFERENCE | GOBACK |
| **Modules interchangeables** | CALL dynamique | BY CONTENT | GOBACK |
| **Données protégées** | CALL statique/dynamique | BY CONTENT | GOBACK |
| **API externes** | CALL statique | BY VALUE | Selon interface |
| **Paramètres variables** | CALL statique | OPTIONAL | GOBACK |
| **Performances critiques** | CALL statique | BY REFERENCE | GOBACK |

