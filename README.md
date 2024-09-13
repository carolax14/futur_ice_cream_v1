# Futur Ice Cream App

Bienvenue dans l'application Futur Ice Cream, une plateforme immersive où les utilisateurs peuvent découvrir, commander et gérer leurs crèmes glacées préférées. Construit avec Flutter, ce projet propose une interface réactive et conviviale pour une expérience utilisateur optimale.

## Table des Matières
- [Fonctionnalités](#fonctionnalités)
- [Installation](#installation)
  - [Prérequis](#prérequis)
  - [Étapes](#étapes)
- [Architecture de l'Application](#architecture-de-lapplication)
  - [Structure des Fichiers](#structure-des-fichiers)
- [Dépendances](#dépendances)
- [Utilisation](#utilisation)
  - [Navigation](#navigation)
- [Structure de l'Application](#structure-de-lapplication-1)
  - [Fichiers Principaux](#fichiers-principaux)
  - [Pages de l'Application](#pages-de-lapplication)
- [Détail des Pages de l'Application](#détail-des-pages-de-lapplication)
  - [1. `home_page.dart`](#1-home_pagedart)
  - [2. `intro_page.dart`](#2-intro_pagedart)
  - [3. `shop_page.dart`](#3-shop_pagedart)
  - [4. `cart_page.dart`](#4-cart_pagedart)
  - [5. `favorite_page.dart`](#5-favorite_pagedart)
  - [6. `ice_cream_order_page.dart`](#6-ice_cream_order_pagedart)
  - [7. `candy_tab.dart`](#7-candy_tabdart)
  - [8. `cornet_tab.dart`](#8-cornet_tabdart)
  - [9. `milkshake_tab.dart`](#9-milkshake_tabdart)
  - [10. `scoop_tab.dart`](#10-scoop_tabdart)
- [Modèles](#modèles)
  - [1. `ice_cream.dart`](#1-ice_creamdart)
  - [2. `ice_cream_shop.dart`](#2-ice_cream_shopdart)
  - [3. `favorite_service.dart`](#3-favorite_servicedart)
- [Composants](#composants)
  - [1. `cart_tile.dart`](#1-cart_tiledart)
  - [2. `ice_cream_tile.dart`](#2-ice_cream_tiledart)
  - [3. `my_button.dart`](#3-my_buttondart)
  - [4. `my_tab.dart`](#4-my_tabdart)
- [Téléchargement de l'APK](#téléchargement-de-lapk)

## Fonctionnalités

- **Parcourir les Crèmes Glacées** : Explorez une large gamme de crèmes glacées et autres desserts gourmands.
- **Ajouter au Panier** : Sélectionnez vos articles préférés et ajoutez-les au panier pour un achat futur.
- **Gestion des Favoris** : Marquez vos crèmes glacées préférées pour les retrouver plus facilement.
- **Interface Réactive** : Profitez d'une interface optimisée pour les mobiles, tablettes et bureaux.
- **Navigation Simple** : Accédez facilement aux différentes sections de l'application via une barre de navigation incurvée.

## Installation

### Prérequis

- [Flutter](https://flutter.dev/) doit être installé sur votre machine.
- Un éditeur de texte comme [Visual Studio Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio).

### Clonage

1. Clonez ce dépôt :
   ```bash
   git clone https://github.com/votre-utilisateur/futur-ice-cream.git


## Architecture de l'Application

### Structure des Fichiers

L'application est organisée de manière modulaire pour faciliter la maintenance et la réutilisation des composants. Voici un aperçu des fichiers principaux :

![Capture d'écran de l'application](lib/images/futur_ice_cream_architecture.png)

## Dépendances

Les principales dépendances de l'application sont :

- **`flutter/material.dart`** : Composants d'interface utilisateur fournis par Flutter.
- **`provider`** : Gestion de l'état global de l'application.
- **`google_fonts`** : Pour l'intégration des polices Google.
- **`carousel_slider`** : Pour un affichage en carrousel des éléments.
- **`curved_navigation_bar`** : Pour une barre de navigation inférieure stylisée.



## Utilisation

### Navigation

L'application utilise le widget `Navigator` de Flutter pour gérer la navigation entre les différentes pages. Chaque page est un `Widget` indépendant qui peut être appelé à partir d'autres pages via `Navigator.push` ou `Navigator.pushReplacement`.

## Structure de l'Application

### Fichiers Principaux

- **`main.dart`** : Point d'entrée de l'application. Initialise l'application avec `ChangeNotifierProvider` pour la gestion globale de l'état et définit le thème de l'application.
  
- **`const.dart`** : Contient les constantes de style comme les couleurs et les gradients utilisés dans toute l'application.
  
- **`responsive_config.dart`** : Gère la réactivité pour les tailles de texte, d'image et de padding en fonction des dimensions de l'écran.

### Pages de l'Application

## Détail des Pages de l'Application

### 1. `home_page.dart`
**Description** :  
La `HomePage` est le point central de l'application. Elle agit comme un conteneur principal qui permet aux utilisateurs de naviguer entre les différentes sections de l'application : la boutique, les favoris, et le panier. Une barre de navigation inférieure incurvée (`CurvedNavigationBar`) est utilisée pour la navigation entre ces pages.

**Fonctionnalités** :
- Contient un `AppBar` transparent.
- Utilise une barre de navigation inférieure pour basculer entre les pages principales.
- Gère la sélection d'onglet via l'état `_selectedIndex`.

### 2. `intro_page.dart`
**Description** :  
La `IntroPage` est la première page que l'utilisateur voit lors du lancement de l'application. Elle affiche une animation d'accueil et redirige ensuite l'utilisateur vers la `HomePage`.

**Fonctionnalités** :
- Affiche une animation de transition d'échelle (zoom) sur le logo.
- Comprend un gradient de fond pour améliorer l'esthétique.
- Redirige vers la `HomePage` après l'introduction.

### 3. `shop_page.dart`
**Description** :  
La `ShopPage` permet aux utilisateurs de parcourir et de sélectionner parmi une variété de crèmes glacées. Elle est divisée en plusieurs onglets, chacun représentant un type de produit (bonbons, cornets, milkshakes, boules de glace).

**Fonctionnalités** :
- Contient un ensemble d'onglets pour naviguer entre les différentes catégories de produits.
- Utilise des grilles pour afficher les produits disponibles.
- Chaque produit dans un onglet peut être sélectionné pour afficher plus de détails et passer une commande.

### 4. `cart_page.dart`
**Description** :  
La `CartPage` permet aux utilisateurs de consulter et de gérer les articles qu'ils ont ajoutés à leur panier. Les utilisateurs peuvent retirer des articles et procéder au paiement à partir de cette page.

**Fonctionnalités** :
- Affiche une liste des articles ajoutés au panier.
- Permet de supprimer des articles du panier.
- Inclut un bouton "Payer maintenant" pour procéder au paiement.

### 5. `favorite_page.dart`
**Description** :  
La `FavoritePage` affiche les crèmes glacées que l'utilisateur a marquées comme favorites. Les articles sont présentés dans un carrousel, et les utilisateurs peuvent gérer leurs favoris à partir de cette page.

**Fonctionnalités** :
- Affiche une liste des crèmes glacées favorites sous forme de carrousel.
- Permet de retirer des articles de la liste des favoris.
- Se dirriger vers la page de détail d'une glace

### 6. `ice_cream_order_page.dart`
**Description** :  
La `IceCreamOrderPage` est la page où les utilisateurs peuvent passer une commande pour une crème glacée spécifique. Ils peuvent sélectionner la quantité et ajouter le produit à leur panier.

**Fonctionnalités** :
- Affiche les détails du produit sélectionné (image, description, prix).
- Permet de sélectionner la quantité souhaitée avant d'ajouter l'article au panier.
- Affiche une boîte de dialogue de confirmation après l'ajout de l'article au panier.

### 7. `candy_tab.dart`
**Description** :  
L'onglet `CandyTab` fait partie de la `ShopPage` et affiche une sélection de crèmes glacées de type bonbon. Les utilisateurs peuvent parcourir les produits et sélectionner ceux qu'ils souhaitent commander.

**Fonctionnalités** :
- Affiche une grille de crèmes glacées de type bonbon.
- Chaque produit peut être sélectionné pour afficher ses détails et passer une commande.

### 8. `cornet_tab.dart`
**Description** :  
L'onglet `CornetTab` fait partie de la `ShopPage` et affiche une sélection de crèmes glacées sous forme de cornets.

**Fonctionnalités** :
- Affiche une grille de crèmes glacées en cornet.
- Permet de sélectionner un produit pour en savoir plus et passer commande.

### 9. `milkshake_tab.dart`
**Description** :  
L'onglet `MilkshakeTab` fait partie de la `ShopPage` et affiche une sélection de milkshakes disponibles à la commande.

**Fonctionnalités** :
- Affiche une grille de milkshakes disponibles.
- Chaque produit peut être sélectionné pour voir les détails et passer une commande.

### 10. `scoop_tab.dart`
**Description** :  
L'onglet `ScoopTab` fait partie de la `ShopPage` et affiche une sélection de boules de glace.

**Fonctionnalités** :
- Affiche une grille de boules de glace.
- Permet de sélectionner et de commander un produit.

---

Chaque page et onglet de cette application est conçu pour offrir une expérience utilisateur fluide et intuitive, avec des transitions simples et une gestion efficace des interactions de l'utilisateur.

## Modèles

### 1. `ice_cream.dart`
**Description** :  
Le fichier `ice_cream.dart` définit le modèle de données pour une crème glacée dans l'application. Ce modèle représente les propriétés essentielles d'une crème glacée, telles que le nom, la description, le prix, l'image, et la catégorie.

**Principales Propriétés** :
- **`name`** : Nom de la crème glacée.
- **`description`** : Brève description de la crème glacée.
- **`price`** : Prix de la crème glacée.
- **`imagePath`** : Chemin de l'image représentant la crème glacée.
- **`category`** : Catégorie de la crème glacée (ex : "Candy", "Cornet", "Milkshake").

**Utilisation** :
- Ce modèle est utilisé dans l'application pour afficher les détails des crèmes glacées dans les différentes pages et onglets.
- Les instances de ce modèle sont manipulées pour gérer les produits dans le panier et les favoris.

### 2. `ice_cream_shop.dart`
**Description** :  
Le fichier `ice_cream_shop.dart` contient le modèle principal pour la gestion des articles dans le panier et les fonctionnalités associées. Ce modèle gère l'état global des crèmes glacées disponibles et celles ajoutées au panier.

**Principales Propriétés et Méthodes** :
- **`iceCreams`** : Liste des crèmes glacées disponibles.
- **`cartItems`** : Liste des crèmes glacées actuellement dans le panier.
- **`addItemToCart(IceCream iceCream, int quantity)`** : Méthode pour ajouter une crème glacée au panier.
- **`removeItemFromCart(IceCream iceCream)`** : Méthode pour retirer une crème glacée du panier.
- **`getTotalPrice()`** : Calcule le prix total des articles dans le panier.
- **`getIceCreamsByCategory(String category)`** : Filtre les crèmes glacées par catégorie.

**Utilisation** :
- Ce modèle est essentiel pour la gestion des interactions de l'utilisateur avec le panier.
- Il est utilisé dans les pages comme `CartPage`, `IceCreamOrderPage`, et les onglets de la boutique pour manipuler les articles disponibles et ceux sélectionnés par l'utilisateur.

### 3. `favorite_service.dart`
**Description** :  
Le fichier `favorite_service.dart` gère les crèmes glacées favorites de l'utilisateur. Ce service permet de sauvegarder, récupérer, et gérer les articles que l'utilisateur a marqués comme favoris.

**Principales Propriétés et Méthodes** :
- **`favorites`** : Liste des crèmes glacées marquées comme favorites par l'utilisateur.
- **`addFavorite(IceCream iceCream)`** : Ajoute une crème glacée à la liste des favoris.
- **`removeFavorite(IceCream iceCream)`** : Retire une crème glacée de la liste des favoris.
- **`getFavorites()`** : Récupère la liste actuelle des favoris.

**Utilisation** :
- Ce service est utilisé dans la `FavoritePage` pour afficher les crèmes glacées favorites.
- Il permet de manipuler la liste des favoris lorsque l'utilisateur ajoute ou retire des articles de cette liste.

---

Ces fichiers dans le dossier `models` sont essentiels pour la gestion des données et de l'état global de l'application. Ils définissent les structures de données, les méthodes de manipulation et fournissent les services nécessaires à l'interaction de l'utilisateur avec l'application.


### Composants

- **`cart_tile.dart`** : Widget représentant un article dans le panier, utilisé dans la `CartPage`.
  
- **`ice_cream_tile.dart`** : Widget pour afficher une crème glacée individuelle dans la `ShopPage`.
  
- **`my_button.dart`** : Widget pour créer des boutons stylisés utilisés dans toute l'application.
  
- **`my_tab.dart`** : Widget personnalisé pour représenter les onglets dans la `ShopPage`.


---
## Téléchargement de l'APK

Vous pouvez télécharger la dernière version de l'application Android [ici](release/app-release.apk).

Pour installer l'APK :
1. Téléchargez le fichier APK depuis le lien ci-dessus.
2. Ouvrez le fichier APK sur votre appareil Android.
3. Suivez les instructions pour installer l'application.

_Note : Vous devrez peut-être autoriser l'installation d'applications à partir de sources inconnues dans les paramètres de votre appareil._
