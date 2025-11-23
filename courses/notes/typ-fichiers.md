# Tableau Comparatif : Dataset, Fichier VSAM vs Fichier Non-VSAM

## Vue d'Ensemble des Types de Fichiers

| **Caractéristique** | **Dataset (Standard)** | **Fichier VSAM** | **Fichier Non-VSAM** |
|---------------------|------------------------|------------------|---------------------|
| **Définition** | Unité de stockage logique MVS | Système de fichiers à accès méthode virtuelle | Tout fichier non-VSAM (QSAM, BSAM, etc.) |
| **Organisation** | Séquentielle, Relative, Indexée | KSDS, ESDS, RRDS, LDS | Séquentielle, Relative, Indexée |
| **Accès** | Séquentiel, Direct | Séquentiel, Direct, Dynamique | Séquentiel, Direct |

---

## Tableau Détail des Organisations et Accès

| **Aspect** | **Dataset Standard** | **VSAM KSDS** | **VSAM ESDS** | **VSAM RRDS** | **QSAM** | **BSAM** |
|------------|----------------------|---------------|---------------|---------------|----------|----------|
| **Structure** | Blocs physiques | Clé + Données | Entrées séquentielles | Slots fixes | Séquentiel simple | Séquentiel bas-niveau |
| **Clé** | Optionnelle | Obligatoire | Optionnelle | Numéro relatif | Non | Non |
| **Accès Direct** | Limité | Excellent via clé | Par RBA | Par numéro | Non | Limité |
| **Ajout Records** | Complexe | Automatique | Fin uniquement | Slots disponibles | Fin uniquement | Complexe |
| **Suppression** | Réorganisation | Marqué supprimé | Impossible | Slot libéré | Impossible | Impossible |
| **Performance** | Moyenne | Excellente | Bonne | Très bonne | Simple | Bas niveau |

---

## Tableau Structure et Définition COBOL

| **Type Fichier** | **Déclaration ENV DIVISION** | **Déclaration DATA DIVISION** | **Paramètres Spécifiques** |
|------------------|-----------------------------|-----------------------------|---------------------------|
| **VSAM KSDS** | `ORGANIZATION IS INDEXED`<br>`ACCESS MODE IS DYNAMIC`<br>`RECORD KEY IS clef-vsam` | `FD FIC-VSAM`<br>`01 ENREG-VSAM`<br>`05 clef-vsam PIC X(10)` | `ALTERNATE RECORD KEY`<br>`FILE STATUS IS ws-status` |
| **VSAM ESDS** | `ORGANIZATION IS SEQUENTIAL`<br>`ACCESS MODE IS SEQUENTIAL` | `FD FIC-ESDS`<br>`01 ENREG-ESDS` | `RELATIVE KEY` optionnel |
| **QSAM** | `ORGANIZATION IS SEQUENTIAL`<br>`ACCESS MODE IS SEQUENTIAL` | `FD FIC-QSAM`<br>`01 ENREG-QSAM` | Blocage possible |
| **BSAM** | `ORGANIZATION IS SEQUENTIAL`<br>`ACCESS MODE IS SEQUENTIAL` | `FD FIC-BSAM`<br>`01 ENREG-BSAM` | Accès par blocs |

---

## Tableau Opérations et Commandes JCL

| **Opération** | **VSAM** | **Non-VSAM (QSAM/BSAM)** | **Commandes IDCAMS** |
|---------------|----------|-------------------------|---------------------|
| **Création** | `IDCAMS DEFINE` | `IEBGENER` | `DEFINE CLUSTER` |
| **Copie** | `REPRO` | `IEBCOPY`, `IEBGENER` | `REPRO INFILE(fichier) OUTFILE(vsam)` |
| **Suppression** | `DELETE` | `IEHPROGM` | `DELETE nom.vsam` |
| **Listage** | `PRINT` | `IEBGENER` | `PRINT INFILE(vsam)` |
| **Réorganisation** | `REPRO` | Non applicable | `REPRO INFILE(vsam) OUTFILE(temp)` |
| **Backup** | `EXPORT` | `IEBCOPY` | `EXPORT nom.vsam` |
| **Restore** | `IMPORT` | `IEBCOPY` | `IMPORT nom.vsam` |

---

## Tableau Performance et Optimisation

| **Critère** | **VSAM KSDS** | **VSAM ESDS** | **QSAM** | **BSAM** |
|-------------|---------------|---------------|----------|----------|
| **Accès Direct** | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐ | ⭐⭐ |
| **Accès Séquentiel** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Insertion** | ⭐⭐⭐⭐ | ⭐ | ⭐ | ⭐ |
| **Suppression** | ⭐⭐⭐⭐ | ⭐ | ⭐ | ⭐ |
| **Espace Disque** | Moyen | Économique | Économique | Économique |
| **Buffering** | Automatique | Automatique | Manuel | Manuel |
| **Intégrité** | Excellente | Bonne | Basique | Basique |

---

## Tableau Exemples COBOL Concrets

### VSAM KSDS (Key Sequenced Data Set)
```cobol
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FIC-CLIENTS ASSIGN TO CLIENT.KSDS
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS CLI-CODE
           ALTERNATE RECORD KEY IS CLI-NOM WITH DUPLICATES
           FILE STATUS WS-STATUS.

DATA DIVISION.
FILE SECTION.
FD FIC-CLIENTS.
01 CLI-ENREG.
   05 CLI-CODE      PIC 9(5).
   05 CLI-NOM       PIC X(30).
   05 CLI-SOLDE     PIC 9(7)V99.
```

### QSAM (Sequential)
```cobol
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FIC-RAPPORT ASSIGN TO RAPPORT.QSAM
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS WS-STATUS.

DATA DIVISION.
FILE SECTION.
FD FIC-RAPPORT.
01 RAP-ENREG       PIC X(100).
```

---

## Tableau Avantages/Inconvénients

| **Type** | **Avantages** | **Inconvénients** |
|----------|---------------|-------------------|
| **VSAM KSDS** | • Accès direct rapide<br>• Clés multiples<br>• Intégrité données<br>• Récupération automatique | • Complexité de gestion<br>• Espace disque important<br>• Coût supplémentaire |
| **VSAM ESDS** | • Performances séquentielles<br>• Ajout facile en fin<br>• Moins d'overhead | • Pas de suppression<br>• Accès direct limité<br>• Réorganisation nécessaire |
| **QSAM** | • Simple à utiliser<br>• Performance séquentielle<br>• Standard COBOL | • Pas d'accès direct<br>• Pas de mise à jour directe<br>• Limité aux traitements séquentiels |
| **BSAM** | • Contrôle bas niveau<br>• Accès par blocs<br>• Performance optimisable | • Complexité de programmation<br>• Gestion manuelle buffers<br>• Moins portable |

---

## Tableau Scénarios d'Utilisation

| **Scénario Métier** | **Type Recommandé** | **Justification** |
|---------------------|---------------------|-------------------|
| **Fichier maître clients** | VSAM KSDS | Accès direct par code client, mises à jour fréquentes |
| **Fichier de transactions** | VSAM ESDS | Ajout séquentiel, lecture séquentielle optimale |
| **Fichier historique** | QSAM | Archivage, lecture séquentielle seule |
| **Fichier paramètres** | VSAM KSDS | Accès direct rapide, lecture majoritaire |
| **Fichier temporaire** | QSAM | Simple, destruction après usage |
| **Fichier de sauvegarde** | BSAM | Contrôle total, performance optimisée |
| **Fichier d'échange** | QSAM | Standard, portable entre systèmes |

---

## Tableau Codes FILE-STATUS

| **Code** | **VSAM** | **QSAM/BSAM** | **Signification** |
|----------|----------|---------------|-------------------|
| **00** | ✅ | ✅ | Opération réussie |
| **10** | ✅ | ✅ | Fin de fichier |
| **22** | ✅ | ❌ | Clé dupliquée (VSAM) |
| **23** | ✅ | ❌ | Enregistrement non trouvé |
| **24** | ✅ | ❌ | Dépassement de zone |
| **30** | ❌ | ✅ | Erreur permanente (QSAM) |
| **34** | ✅ | ❌ | Dépassement de fichier |
| **35** | ✅ | ❌ | Fichier non trouvé |
| **37** | ✅ | ❌ | Erreur ouverture mode incorrect |
| **39** | ✅ | ❌ | Conflit d'attributs |
| **90** | ✅ | ❌ | Erreur logique VSAM |
| **92** | ✅ | ❌ | Erreur logique VSAM |
| **93** | ✅ | ❌ | Ressource indisponible |
