# 🧭 Opérations COBOL

Avant même de parler d'`OPEN`, `WRITE`, etc., il est utile de se souvenir que **tous les fichiers VSAM ne jouent pas selon les mêmes règles** :

* **ESDS (Entry Sequenced Data Set)** : l’ordre d’écriture définit la position. Pas de clé. Comme un journal append-only.
* **RRDS (Relative Record Data Set)** : on lit/écrit par numéro de slot (RRN). Comme un tableau indexé.
* **KSDS (Key Sequenced Data Set)** : accès par clé et par index. C’est la “base de données” la plus flexible.

Chaque opération COBOL vient alors interagir selon ces contraintes.

---

# 1️⃣ OPEN – “Donne-moi les règles du jeu”

`OPEN INPUT`, `OPEN OUTPUT`, `OPEN I-O`, `OPEN EXTEND`

### ESDS

* `OPEN OUTPUT` → tu crées le fichier, et tu écris **toujours à la suite**.
* `OPEN I-O` → permet lecture + ajout.
* Pas d’accès direct par clé ou numéro → uniquement séquentiel.

### RRDS

* `OPEN I-O` fréquent, car tu dois lire et mettre à jour des positions précises.
* `OPEN INPUT` si tu ne fais que lire.
* `OPEN OUTPUT` crée les slots vides.

### KSDS

* `OPEN INPUT` → lecture par clé ou séquentielle.
* `OPEN I-O` → read/update/delete via la clé.
* `OPEN OUTPUT` → création + écriture ordonnée selon la clé.

**À retenir (z/OS)** : si un fichier doit être mis à jour, il faut qu’il ait été alloué VSAM avec accès partageable et que ton JCL utilise les bons DISP/SHAREOPTIONS, sinon OPEN I-O te fera mal.

---

# 2️⃣ WRITE – “Créer un enregistrement”

Toujours suivre la logique interne du dataset.

### ESDS

* `WRITE` → ajoute **à la fin**, point final.
  Impossible d’écrire “entre” deux enregistrements.

### RRDS

* `WRITE … INVALID KEY` si le slot est déjà occupé.
* Tu dois cibler un `RELATIVE KEY` (RRN).
  → `WRITE FILE-REC INVALID KEY …`

### KSDS

* `WRITE` avec une clé **unique**.
* S’il existe déjà une clé identique → `INVALID KEY`.

---

# 3️⃣ REWRITE – “Modifier un enregistrement existant”

Toujours précédé d’un `READ` (en mode update).

### ESDS

* Tu peux **réécrire** un enregistrement lu, du moment que :

  * la nouvelle longueur est identique ou plus courte
  * (VSAM n’aime pas les endroits qui gonflent)
* Position basée sur le RBA retourné par le `READ`.

### RRDS

* Le RRN lu → tu peux le réécrire facilement.
* Pas de problème de longueur : les slots ont taille fixe.

### KSDS

* `REWRITE` met à jour l’enregistrement sans changer la clé.
* Si tu modifies la clé dans le record → **erreur** :
  pour cela, il faut DELETE puis WRITE.

---

# 4️⃣ DELETE – “Retirer un enregistrement”

### ESDS

* **Impossible** de delete un enregistrement VSAM ESDS directement.
  La logique ESDS ne supporte pas les trous.
  → il faut copier, filtrer, réécrire.

### RRDS

* `DELETE` libère le slot → il redevient disponible.
* Lecture préalable par RRN obligatoire.

### KSDS

* `DELETE` supprime l’enregistrement trouvé par la clé.
* Nécessite `READ ... INTO ... KEY IS ...` avant.

---

# 5️⃣ CLOSE – “On range et on flush”

Identique pour tous :

* Vide les buffers VSAM
* Met à jour les structures internes
* Libère le dataset et garantit la cohérence

En environnement z/OS, **oublier un CLOSE propre peut corrompre un KSDS** si le buffering VSAM n’est pas vidé correctement dans un job batch.

---

# 🎓 Synthèse rapide (à garder en tête pour l’examen ou la pratique)

| Operation   | ESDS                    | RRDS               | KSDS              |
| ----------- | ----------------------- | ------------------ | ----------------- |
| **OPEN**    | Séquentiel seulement    | Accès RRN          | Accès clé/index   |
| **WRITE**   | Append uniquement       | Dans un slot libre | Par clé unique    |
| **REWRITE** | Possible, même longueur | Toujours possible  | Clé inchangée     |
| **DELETE**  | ❌ impossible            | Supprime le slot   | Supprime par clé  |
| **CLOSE**   | Flush                   | Flush              | Flush + index maj |

---

# 🛠️ Contexte z/OS à ne pas oublier

Une bonne compréhension passe aussi par ce qui entoure COBOL :

* **DD statements dans JCL** → définition du fichier VSAM (DD DSN=…, DISP=SHR/OLD…)
* **AIDC / ACS** (Storage Management) → peut influencer le comportement VSAM
* **IDCAMS** → utiles pour afficher le RBA, tester les clés, visualiser les slots
* **Buffering VSAM** (LSR/NSR) → impacte la performance des OPEN/CLOSE

Souvent, les comportements étranges viennent plus du JCL que du programme COBOL lui-même.

---

Si tu veux, je peux aussi te préparer :

✅ un mini-programme COBOL pédagogique pour chaque type VSAM
ou
✅ une fiche mémo format A4
ou
✅ des schémas visuels pour comprendre les déplacements (RBA, RRN, clé)

Qu’est-ce qui t’aiderait le plus dans ton apprentissage ?
