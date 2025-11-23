# 📘 **Tableau récapitulatif des accès VSAM (COBOL / z/OS)**

## ✅ **1. Mode d’accès : SEQUENTIAL**

| Opération | INPUT | OUTPUT | I-O | EXTEND | Types de fichiers autorisés |
| --------- | ----- | ------ | --- | ------ | --------------------------- |
| READ      | X     |        | X   |        | ESDS, KSDS, RRDS            |
| WRITE     |       | X      |     | X      | ESDS, KSDS, RRDS            |
| REWRITE   |       |        | X   |        | ESDS, KSDS, RRDS            |

---

## ✅ **2. Mode d’accès : RANDOM**

*(Uniquement pour KSDS & RRDS, car il faut une clé ou un numéro de slot.)*

| Opération | INPUT | OUTPUT | I-O | EXTEND | Types de fichiers autorisés |
| --------- | ----- | ------ | --- | ------ | --------------------------- |
| READ      | X     |        | X   |        | KSDS, RRDS                  |
| WRITE     |       | X      |     | X      | KSDS, RRDS                  |
| REWRITE   |       |        | X   |        | KSDS, RRDS                  |
| START     |       |        | X   |        | KSDS, RRDS                  |
| DELETE    |       |        | X   |        | KSDS, RRDS                  |

---

## ✅ **3. Mode d’accès : DYNAMIC**

*(Combine SEQUENTIAL + RANDOM : plus flexible, recommandé pour les programmes modernes)*

| Opération | INPUT | OUTPUT | I-O | EXTEND | Types de fichiers autorisés |
| --------- | ----- | ------ | --- | ------ | --------------------------- |
| READ      | X     |        | X   |        | KSDS, RRDS                  |
| WRITE     |       | X      |     | X      | KSDS, RRDS                  |
| REWRITE   |       |        | X   |        | KSDS, RRDS                  |
| START     | X     |        | X   |        | KSDS, RRDS                  |
| DELETE    |       |        | X   |        | KSDS, RRDS                  |

*⚠️ DYNAMIC ne fonctionne pas avec ESDS.*

---

# 🧠 **Explications simples pour comprendre**

### 📌 **Quand ouvrir le fichier ?**

| Besoin                       | Mode d’ouverture | Pourquoi ?                     |
| ---------------------------- | ---------------- | ------------------------------ |
| Lire seulement               | `INPUT`          | Protection + performances      |
| Écrire seulement (sans lire) | `OUTPUT`         | Création ou écrasement complet |
| Lire + Modifier + Réécrire   | `I-O`            | Pour UPDATE                    |
| Ajouter à la fin             | `EXTEND`         | Ajout de records               |

---

# 📂 **Quand utiliser quel mode d’accès VSAM ?**

## 🔵 **SEQUENTIAL**

➡ Lecture ou écriture **dans l’ordre naturel des enregistrements**
➡ Très utilisé pour :

* Parcourir tout le fichier
* Produire un rapport
* Charger un fichier neuf

## 🔴 **RANDOM**

➡ Accès direct à un enregistrement par :

* **Clé** (KSDS)
* **Numéro de slot** (RRDS)

➡ Utile pour bases de données simples ou mises à jour rapides.

## 🟢 **DYNAMIC**

➡ Combine Sequential + Random
➡ Tu peux :

* lire séquentiellement
* ou sauter directement à un record précis
* modifier, supprimer, etc.

➡ Recommandé pour les programmes complets CRUD.

---

# ⚡ Résumé ultra-simple pour les collègues

* **ESDS** : pas de random, pas d’accès direct → *que séquentiel !*
* **KSDS / RRDS** : peuvent faire SEQUENTIAL, RANDOM, DYNAMIC
* **INPUT** : lire
* **OUTPUT** : écrire en créant
* **I-O** : lire + modifier
* **EXTEND** : ajouter à la fin

---
