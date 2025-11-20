# Lancer Hercules

---

## 🧩 Étape 1 — Aller dans le dossier TK4-

Assure-toi d’être dans ton dossier principal TK4 :

```bash
cd ~/mainframe/tk4
```

```bash
c3270 localhost:3270
c3270 localhost:3271
c3270 localhost:3272
```

````
c3270 localhost:3270
```
---

## ⚙️ Étape 2 — Démarrer Hercules avec le bon fichier de config

Lance cette commande :

```bash
/opt/homebrew/bin/hercules -f conf/tk4-.cnf
```

> ⚠️ Vérifie bien : le tiret à la fin de `tk4-.cnf` est **normal** (ne le supprime pas).

---

✅ Si tout se passe bien, tu verras défiler des messages comme :

```
HHC00100I Hercules version 4.9.0.0-SDL
HHC00101I Reading configuration file conf/tk4-.cnf
HHC00107I CPU0000 architecture mode z/Arch
...
HHC90020I MVS 3.8J TK4- system startup
```

Et après quelques secondes :

```
MVS 3.8J TK4- ready
```

---

## 🖥️ Étape 3 — Se connecter à MVS

Ouvre un **autre terminal** (garde celui d’Hercules ouvert)
et lance :

```bash
c3270 localhost:3270
```

Tu verras l’écran vert IBM, avec la demande de connexion.

➡️ Identifiants par défaut :

* **UserID** : `HERC01`
* **Password** : `CUL8TR`

(ou `HERC02`, `HERC03`...)

---

## 🧾 Étape 4 — Vérifier que tout fonctionne

Une fois connecté, tu peux taper :

```
HELP
```

ou

```
LISTCAT
```

Et le système te répondra comme sur un vrai mainframe z/OS (version MVS 3.8J).

---

## 🧹 Étape 5 — Arrêter le système proprement

Dans la **console Hercules** (le premier terminal), tape :

```
/shutdown
```

ou

```
quit
```

---

## 💡 (Optionnel) Étape 6 — Créer un script “mvs-arm”

Pour éviter de retaper la longue commande, crée un petit script personnalisé.

1. Crée le fichier :

   ```bash
   nano ~/mainframe/tk4/mvs-arm
   ```

2. Mets ce contenu :

   ```bash
   #!/bin/bash
   /opt/homebrew/bin/hercules -f conf/tk4-.cnf
   ```

3. Sauvegarde (`Ctrl + O`, puis `Entrée`, puis `Ctrl + X`)

4. Rends-le exécutable :

   ```bash
   chmod +x ~/mainframe/tk4/mvs-arm
   ```

👉 Et maintenant, tu peux simplement démarrer ton mainframe par :

```bash
cd ~/mainframe/tk4
./mvs-arm
```

---