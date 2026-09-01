# 📰 Magazine Info Firebase

Application mobile développée avec **Flutter** permettant de gérer et consulter les informations d'un magazine.
Le projet utilise **Firebase Cloud Firestore** comme base de données distante et une architecture séparant l'interface utilisateur, la logique de gestion et l'accès aux données.

---

## 👨‍💻 Informations

* **Étudiant :** Omar Epiphane
* **Projet :** Magazine Info Firebase
* **Formation :** DCLIC — Développement Mobile
* **Framework :** Flutter
* **Langage :** Dart
* **Backend / Base de données :** Firebase / Cloud Firestore

---

## 🎯 Objectif du projet

L'objectif de **Magazine Info** est de développer une application mobile permettant de gérer les différentes informations liées à un magazine.

L'application met notamment en œuvre la gestion des **rédacteurs** ainsi que la communication avec une base de données distante grâce à Firebase.

Ce projet permet également de mettre en pratique :

* le développement d'interfaces avec Flutter ;
* la gestion d'état avec Provider ;
* l'architecture Controller / Repository ;
* les opérations CRUD ;
* l'utilisation de Cloud Firestore ;
* la navigation entre les écrans ;
* la gestion des erreurs ;
* le versionnement avec Git et GitHub.

---

## 🛠️ Technologies utilisées

### Flutter

Framework utilisé pour développer l'application mobile.

### Dart

Langage de programmation utilisé par Flutter.

### Firebase

Firebase est utilisé comme infrastructure backend de l'application.

### Cloud Firestore

Base de données NoSQL utilisée pour enregistrer et récupérer les données de l'application.

### Provider

Utilisé pour la gestion de l'état de l'application et la communication entre les widgets et les controllers.

### Git / GitHub

Utilisés pour le versionnement et l'hébergement du code source.

---

## 🏗️ Architecture du projet

Le projet suit une organisation permettant de séparer les différentes responsabilités :

```text
Interface utilisateur
        │
        ▼
    Controller
        │
        ▼
    Repository
        │
        ▼
 Firebase / Firestore
```

### Interface utilisateur

Les widgets Flutter sont responsables de l'affichage et des interactions avec l'utilisateur.

### Controller

Les controllers contiennent la logique nécessaire à la gestion de l'état et aux différentes actions effectuées depuis l'interface.

Ils utilisent notamment `ChangeNotifier` afin d'informer l'interface lorsqu'une modification de l'état intervient.

### Repository

Les repositories constituent la couche chargée de communiquer avec Firebase / Cloud Firestore.

Cette séparation évite de placer directement toute la logique Firestore dans les widgets.

---

## 📁 Structure du projet

Une organisation générale du projet est la suivante :

```text
lib/
│
├── controllers/
│   └── redacteur_controllers.dart
│
├── repositories/
│   └── redacteur_repository.dart
│
├── models/
│   └── ...
│
├── screens/
│   └── ...
│
├── widgets/
│   └── ...
│
└── main.dart
│
├── android/
├── ios/
├── web/
├── test/
├── pubspec.yaml
└── README.md
```

> La structure peut évoluer au fur et à mesure du développement de l'application.

---

## 👥 Gestion des rédacteurs

L'application comporte une fonctionnalité permettant de gérer les rédacteurs.

Les principales opérations sont :

* ajouter un rédacteur ;
* consulter les rédacteurs ;
* modifier les informations d'un rédacteur ;
* supprimer un rédacteur.

Les opérations sont réalisées à travers le controller et le repository avant d'être transmises à Firestore.

---

## 🔄 Fonctionnement d'une opération

Lorsqu'un utilisateur ajoute un rédacteur, le processus est organisé de la manière suivante :

```text
Utilisateur
     │
     ▼
Formulaire Flutter
     │
     ▼
RedacteurController
     │
     ▼
RedacteurRepository
     │
     ▼
Cloud Firestore
     │
     ▼
Enregistrement des données
```

Cette organisation permet de maintenir une séparation claire entre l'interface et la base de données.

---

## 🔥 Configuration de Firebase

Pour utiliser le projet, Firebase doit être correctement configuré pour l'application Flutter.

Les dépendances Firebase sont déclarées dans le fichier :

```text
pubspec.yaml
```

Après l'installation des dépendances, exécuter :

```bash
flutter pub get
```

L'application doit ensuite être correctement connectée au projet Firebase correspondant.

---

## 📦 Installation

### 1. Cloner le dépôt

```bash
git clone https://github.com/Epiphane-code/Magazine_Info_firebase.git
```

### 2. Entrer dans le projet

```bash
cd Magazine_Info_firebase
```

### 3. Installer les dépendances

```bash
flutter pub get
```

### 4. Vérifier l'environnement Flutter

```bash
flutter doctor
```

### 5. Lancer l'application

```bash
flutter run
```

---

## 🗄️ Cloud Firestore

Cloud Firestore est utilisé pour assurer la persistance des données.

Les opérations principales utilisées dans l'application correspondent au CRUD :

| Opération | Rôle                 |
| --------- | -------------------- |
| Create    | Ajouter une donnée   |
| Read      | Lire les données     |
| Update    | Modifier une donnée  |
| Delete    | Supprimer une donnée |

Cette approche permet à l'application de manipuler les informations stockées dans Firebase de manière structurée.

---

## 🔐 Gestion des erreurs

Le projet prend également en compte les problèmes pouvant survenir lors de l'exécution de l'application.

Quelques exemples de problèmes rencontrés durant le développement :

* mauvaise configuration des dépendances ;
* problème d'initialisation de Firebase ;
* problème d'initialisation d'un objet avant son utilisation ;
* problèmes de communication avec Firestore ;
* erreurs liées à la gestion de l'état.

Le diagnostic de ces erreurs fait partie du processus d'apprentissage et permet de mieux comprendre le fonctionnement de Flutter et de Firebase.

---

## 🧩 Gestion de l'état

Le projet utilise `Provider` et `ChangeNotifier`.

Le principe est de permettre aux widgets d'accéder au controller sans avoir à gérer directement toute la logique métier.

Exemple de fonctionnement :

```text
ChangeNotifierProvider
        │
        ▼
Controller
        │
        ▼
Modification de l'état
        │
        ▼
Notification des widgets
        │
        ▼
Mise à jour de l'interface
```

---

## 🧭 Navigation

La navigation entre les différents écrans est réalisée avec les outils de navigation de Flutter.

Par exemple :

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const AjouterRedacteur(),
  ),
);
```

Cela permet de passer d'un écran à un autre tout en conservant une navigation organisée.

---

## 🧪 Tests

Les tests effectués durant le développement consistent notamment à vérifier :

* le lancement de l'application ;
* l'affichage des différents écrans ;
* l'ouverture des formulaires ;
* l'ajout des données ;
* la lecture des données Firestore ;
* la modification des données ;
* la suppression des données ;
* la communication entre Controller et Repository ;
* la connexion à Firebase.

---

## 📚 Compétences acquises

Ce projet a permis de renforcer les compétences suivantes :

* développement mobile avec Flutter ;
* programmation avec Dart ;
* conception d'interfaces utilisateur ;
* navigation Flutter ;
* gestion d'état avec Provider ;
* utilisation de `ChangeNotifier` ;
* architecture Controller / Repository ;
* utilisation de Firebase ;
* utilisation de Cloud Firestore ;
* opérations CRUD ;
* débogage d'une application Flutter ;
* utilisation de Git et GitHub.

---

## 🚀 Améliorations possibles

Plusieurs fonctionnalités peuvent être ajoutées dans les prochaines versions :

* authentification des utilisateurs ;
* gestion des rôles ;
* recherche de rédacteurs ;
* filtrage des articles ;
* gestion complète des articles ;
* ajout d'images ;
* notifications ;
* amélioration de l'interface utilisateur ;
* mode hors ligne ;
* validation avancée des formulaires ;
* tests unitaires et tests d'intégration.

---

## 📌 Commandes Git utiles

Vérifier l'état du projet :

```bash
git status
```

Voir les fichiers suivis :

```bash
git ls-files
```

Ajouter les modifications :

```bash
git add .
```

Créer un commit :

```bash
git commit -m "mise à jour du projet"
```

Envoyer les modifications sur GitHub :

```bash
git push origin main
```

---

## 📂 Dépôt GitHub

Le code source du projet est disponible sur GitHub :

https://github.com/Epiphane-code/Magazine_Info_firebase.git

---

## 👨‍🎓 Auteur

**Omar Epiphane**

Projet réalisé dans le cadre de la formation **DCLIC — Développement Mobile**.

---

## 📄 Licence

Ce projet est réalisé dans un cadre pédagogique et peut être utilisé comme support d'apprentissage du développement mobile avec Flutter et Firebase.
