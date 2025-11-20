# Exercice sur l’analyse d’un LISTCAT VSAM (type Master Catalog).

---

## ✅ 1 — JCL pour afficher le catalogue `CATALOG.Z110.MASTER`

```jcl
//LISTMCAT JOB (LIST),'LISTCAT MASTER',MSGCLASS=A,CLASS=A
//STEP1    EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  LISTCAT CATALOG(CATALOG.Z113.MASTER) ALL
/*
```

Lance ça, récupère la sortie et on l’analyse 👇

---

## ✅ Questions — Ce qu'il faut chercher dans la sortie LISTCAT

| Question                               | Où lire dans LISTCAT                                  | Explication                     |
| -------------------------------------- | ----------------------------------------------------- | ------------------------------- |
| 2. Nature de l’objet                   | `ATTRIBUTES :`                                        | Devrait dire `VSAM CATALOG`     |
| 3. Longueur de la Key                  | `KEY LENGTH`                                          | (clé racine du catalogue)       |
| 4. Taille espace DATA                  | `DATA COMPONENT` → `ALLOCATED TRACKS` ou `ALLOCATION` | Espace alloué                   |
| 5. Taille espace INDEX                 | `INDEX COMPONENT` → `ALLOCATED TRACKS`                | Espace index                    |
| 6. Record physique                     | `CONTROL INTERVAL SIZE`                               | CI size (ex: 4096 bytes)        |
| 7. Max Length Record Data              | `MAXIMUM RECORD SIZE` (DATA)                          | Taille maxi d'un enregistrement |
| 8. Max Length Record Index             | `MAXIMUM RECORD SIZE` (INDEX)                         | ID du catalogue                 |
| 9. # Track per CA (DATA)               | `CONTROL AREA SIZE` / tracks                          | Souvent 3, 9, ou +              |
| 10. # Physical Record per track (DATA) | `TRACK CAPACITY` / `CI size`                          | CI par piste                    |
| 11. # Track CA Index                   | même que Data mais Index                              | Souvent plus petit              |
| 12. CI per track (INDEX)               | même calcul                                           |                                 |

---

## ✅ Exemple (réponse modèle) basé sur un catalogue classique

| Question              | Réponse exemple |
| --------------------- | --------------- |
| Nature                | VSAM CATALOG    |
| Key Length            | 44 bytes        |
| Espace DATA           | 150 tracks      |
| Espace INDEX          | 30 tracks       |
| CI size               | 4 096 octets    |
| Max Data Record       | 4 096           |
| Max Index Record      | 512             |
| Tracks par CA (DATA)  | 15              |
| CI/Track (DATA)       | 4               |
| Tracks par CA (INDEX) | 3               |
| CI/Track (Index)      | 8               |

> ⚠️ **TES valeurs peuvent être différentes** — tu dois les lire dans *ton* LISTCAT.

---

## ✅ Prochain pas

📌 **Colle ici ta sortie LISTCAT** (juste la partie du catalogue)
et je te donne les réponses exactes + explications.

Exemple attendu 👇

```
CATALOG NAME ---- CATALOG.Z110.MASTER
...
KEY LENGTH      44
...
DATA ALLOCATION TRACKS -------- 150
...
```

---
