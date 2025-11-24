# Formation COBOL

---

### 🟦 Installation COBOL sur macOS + Configuration VS Code

Ce guide explique **pas à pas** comment installer un environnement de développement COBOL sur **macOS**, afin de compiler et exécuter des programmes COBOL directement dans **Visual Studio Code**.

---

### 📌 1. Prérequis

Assurez-vous d’avoir :

* Un Mac (Intel ou Apple Silicon)
* macOS 12 ou supérieur
* **Homebrew** installé
  Si ce n’est pas le cas, installez-le :

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

### 📌 2. Installer GnuCOBOL sur macOS

COBOL n’est pas installé nativement sur macOS. La solution la plus simple est d’utiliser **GnuCOBOL**, un compilateur COBOL open-source.

#### ▶️ Installation via Homebrew

```bash
brew install gnu-cobol
```

Pour vérifier l’installation :

```bash
cobc -v
```

Vous devriez obtenir une version du type :

```
cobc (GnuCOBOL) 3.x.x
```

---

### 📌 3. Créer un projet COBOL (structure minimale)

Créez un dossier pour vos programmes :

```bash
mkdir cobol-project
cd cobol-project
```

Créez un fichier COBOL :

```bash
touch hello.cob
```

Exemple de code COBOL minimal :

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       PROCEDURE DIVISION.
           DISPLAY "Hello COBOL!".
           STOP RUN.
```

---

### 📌 4. Installer Visual Studio Code

Téléchargez VS Code ici :
👉 [https://code.visualstudio.com/](https://code.visualstudio.com/)

Ensuite, ouvrez le projet :

```bash
code .
```

---

### 📌 5. Installer l’extension COBOL dans VS Code

Dans VS Code :

1. Aller dans **Extensions**
2. Rechercher : **"bitlang.cobol"**
3. Installer **COBOL by Bitlang**

Cette extension apporte :

* coloration syntaxique
* snippets COBOL
* auto-complétion
* navigation dans les divisions
* prise en charge du copybook

---

### 📌 6. Configurer les commandes COBOL dans VS Code

Pour compiler et exécuter directement depuis VS Code :

#### ▶️ Créer le fichier `.vscode/tasks.json`

Dans ton projet :

```
.vscode/tasks.json
```

Contenu :

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Compile COBOL",
            "type": "shell",
            "command": "cobc -x ${file} -o ${fileBasenameNoExtension}",
            "group": {
                "kind": "build",
                "isDefault": true
            }
        },
        {
            "label": "Run COBOL",
            "type": "shell",
            "command": "./${fileBasenameNoExtension}",
            "group": "test"
        }
    ]
}
```

---

### 📌 7. Compiler et exécuter un programme COBOL

#### ▶️ 1) Compiler

Dans VS Code :

* `Cmd` + `Shift` + `B`
  ou
* Menu **Terminal → Run Build Task**

#### ▶️ 2) Exécuter

Dans VS Code :

* Menu **Terminal → Run Task → Run COBOL**

Ou en ligne de commande :

```bash
cobc -x hello.cob -o hello
./hello
```

---

### 📌 8. Extensions utiles pour travailler en COBOL

| Extension VS Code | Utilité                                      |
| ----------------- | -------------------------------------------- |
| **bitlang.cobol** | Coloration, snippets, parsing COBOL          |
| **Code Runner**   | Exécution rapide (attention à configurer)    |
| **Error Lens**    | Affiche les erreurs directement dans le code |

---

### 📌 9. Dépannage

#### ❗ Erreur : commande `cobc` introuvable

➡️ Vérifiez que Homebrew est bien dans votre PATH :

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
source ~/.zprofile
```

Pour les Macs Intel :

```bash
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zprofile
source ~/.zprofile
```

#### ❗ VS Code ne détecte pas COBOL

* Fermez/Reouvrez VS Code
* Vérifiez la version de GnuCOBOL :

```bash
cobc -v
```

---

### 📌 10. Ressources complémentaires

* Documentation officielle GnuCOBOL : [https://gnucobol.sourceforge.io/](https://gnucobol.sourceforge.io/)
* Tutoriel COBOL (Open Mainframe Project) : [https://www.openmainframeproject.org/](https://www.openmainframeproject.org/)

---
