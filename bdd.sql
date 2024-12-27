DROP DATABASE IF EXISTS ecom;
CREATE DATABASE IF NOT EXISTS ecom;

USE ecom;

-- Table `brand`

CREATE TABLE `brand` (
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL COMMENT "Le nom de la marque",
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "La date de création de la marque",
    `updated_at` TIMESTAMP NULL COMMENT "La date de la dernière mise à jour de la marque"
);


-- Table `category`

CREATE TABLE `category` (
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL COMMENT "Le nom de la catégorie",
    `subtitle` VARCHAR(128) NULL,
    `picture` VARCHAR(128) NULL COMMENT "L'URL de l'image de la catégorie (utilisée en home, par exemple)",
    `home_order` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "L'ordre d'affichage de la catégorie sur la home (0=pas affichée en home)",
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "La date de création de la catégorie",
    `updated_at` TIMESTAMP NULL COMMENT "La date de la dernière mise à jour de la catégorie"
);


-- Table `type`

CREATE TABLE `type` (
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL COMMENT "Le nom du type",
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "La date de création de la catégorie",
    `updated_at` TIMESTAMP NULL COMMENT "La date de la dernière mise à jour de la catégorie"
);


-- Table `product`

CREATE TABLE `product` (
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL COMMENT "Le nom du produit",
    `description` TEXT NULL COMMENT "La description du produit",
    `picture` VARCHAR(128) NULL COMMENT "L'URL de l'image du produit",
    `price` DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT "Le prix du produit",
    `rate` DECIMAL(2,1) NOT NULL DEFAULT 0 COMMENT "L'avis sur le produit, de 1 à 5",
    `status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Le statut du produit (0=non renseignée, 1=dispo, 2=pas dispo)",
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "La date de création du produit",
    `updated_at` TIMESTAMP NULL COMMENT "La date de la dernière mise à jour du produit",
    `brand_id` INT UNSIGNED NOT NULL,
    `category_id` INT UNSIGNED NULL,
    `type_id` INT UNSIGNED NOT NULL,
    FOREIGN KEY (`brand_id`) REFERENCES `brand`(`id`),
    FOREIGN KEY (`category_id`) REFERENCES `category`(`id`),
    FOREIGN KEY (`type_id`) REFERENCES `type`(`id`)
);


-- Data for table `brand`

INSERT INTO `brand` (`name`, `created_at`, `updated_at`) VALUES 
("SoTech", "2018-10-17 9:00:00", NULL),
("Microsoft", "2018-10-17 9:00:00", NULL),
("Adobe", "2018-10-17 9:00:00", NULL),
("Oracle", "2018-10-17 9:00:00", NULL),
("JetBrains", "2018-10-17 9:00:00", NULL),
("Autodesk", "2018-10-17 9:00:00", NULL),
("Cisco", "2018-10-17 9:00:00", NULL),
("Dassault Systèmes", "2018-10-17 9:00:00", NULL);


-- Data for table `category`


INSERT INTO `category` (`name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES 
("Bureautique", "Logiciels pour le traitement de texte, tableurs et présentations.", "assets/images/categories/bureautique.jpg", 1, "2018-10-17 10:00:00", NULL),
("Développement", "Outils pour programmer, tester et déployer des applications.", "assets/images/categories/developpement.jpg", 2, "2018-10-17 10:00:00", NULL),
("Création graphique", "Logiciels pour concevoir, éditer des images, videos ou designs.", "assets/images/categories/crea_graphique.jpg", 3, "2018-10-17 10:00:00", NULL),
("Gestion de données", "Solutions pour stocker, organiser et analyser des données.", "assets/images/categories/gestion_donnees.jpg", 4, "2018-10-17 10:00:00", NULL),
("Collaboration", "Facilite le travail d'équipe et la communication à distance.", "assets/images/categories/collaboration.jpg", 5, "2018-10-17 10:00:00", NULL),
("Conception assistée", "Conçoit des modèles 2D/3D pour l'industrie et l'ingénierie.", "assets/images/categories/conception_assistee.jpg", 6, "2018-10-17 10:00:00", NULL);


-- Data for table `type`

INSERT INTO `type` (`name`, `created_at`, `updated_at`) VALUES 
("Suite bureautique", "2018-10-17 10:00:00", NULL),
("IDE", "2018-10-17 10:00", NULL),
("Communication collaborative", "2018-10-17 10:00:00", NULL),
("Plateforme cloud", "2018-10-17 10:00:00", NULL),
("Edition d'image", "2018-10-17 10:00:00", NULL),
("Montage vidéo", "2018-10-17 10:00:00", NULL),
("Bases de données", "2018-10-17 10:00:00", NULL),
("CAO 2D/3D", "2018-10-17 10:00:00", NULL),
("Plateforme collaborative", "2018-10-17 10:00:00", NULL);


-- Data for table `product`

INSERT INTO `product` (`name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) VALUES 
("SoCode", "SoCode est un éditeur de code extensible. Les fonctionnalités incluent la prise en charge du débogage, la mise en évidence de la syntaxe, la complétion intelligente du code, les snippets et la refactorisation du code.", "assets/images/produits/SoCode.png", 9.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 1, 1, 7),
("SoManage", "SoManage est un outil de gestion inspiré de la méthode Kanban de Toyota. Il repose sur une organisation des projets en planches listant des cartes, chacune représentant des tâches.", "assets/images/produits/SoManage.png", 14.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 1, 5, 3),
("SoDraw", "SoDraw est votre studio de création tout-en-un. Retouchez vos photos, créez des illustrations et concevez des graphismes professionnels. Son interface intuitive vous permet de réaliser des visuels percutants en quelques clics.", "assets/images/produits/SoDraw.png", 19.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 1, 3, 5),
("SoNote", "SoNote est un éditeur de texte. Il permet de prendre des notes, de faire de la mise en page et d'écrire automatiquement ce qui est dicté. Il est muni d'un système de sauvegarde automatique afin que vous ne perdiez plus votre travail.", "assets/images/produits/SoNote.png", 9.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 1, 4, 4),
("Office 365", "Microsoft Office est une suite bureautique propriétaire de la société Microsoft fonctionnant avec les plates-formes fixes et mobiles.", "assets/images/produits/office.png", 99.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 2, 1, 1),
("Photoshop", "Adobe Photoshop est un logiciel de retouche, de traitement et de dessin assisté par ordinateur, lancé en 1990 sur MacOS puis en 1992 sur Windows.", "assets/images/produits/photoshop.png", 19.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 3, 3, 5),
("Oracle Database", "Oracle Database est un système de gestion de base de données relationnelle édité par la société Oracle Corporation.", "assets/images/produits/oracle_database.png", 79.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 4, 4, 7),
("IntelliJ IDEA", "IntelliJ IDEA est un environnement de développement intégré pour le langage de programmation Java.", "assets/images/produits/intellij.png", 79.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 5, 2, 2),
("AutoCAD", "AutoCAD est un logiciel de dessin assisté par ordinateur utilisé pour la modélisation 2D et 3D.", "assets/images/produits/autocad.png", 99.99.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 6, 6, 8),
("Webex", "Webex est une plateforme de collaboration pour les réunions en ligne, la vidéoconférence, les webinaires et l'écran partagé.", "assets/images/produits/webex.png", 49.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 7, 5, 3),
("SolidWorks", "SolidWorks est un logiciel de CAO 3D utilisé par les ingénieurs et les designers pour concevoir des produits, des bâtiments et des structures.", "assets/images/produits/solidworks.png", 2999.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 8, 6, 9),
("Premiere Pro", "Adobe Premiere Pro est un logiciel de montage vidéo développé par Adobe Systems et utilisé par les vidéastes, les cinéastes, les monteurs et les producteurs de télévision.", "assets/images/produits/premiere.png", 299.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 3, 3, 6),
("Azure", "Microsoft Azure est une plateforme cloud de Microsoft, qui fournit des services de calcul, de stockage et de mise en réseau.", "assets/images/produits/azure.png", 99.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 2, 4, 4),
("Illustrator", "Adobe Illustrator est un logiciel de création graphique vectorielle développé et commercialisé par Adobe Systems.", "assets/images/produits/illustrator.png", 199.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 3, 3, 5),
("Oracle Cloud", "Oracle Cloud est une plateforme cloud d'entreprise fournie par Oracle Corporation.", "assets/images/produits/oracle_cloud.png", 999.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 4, 4, 4),
("WebStorm", "WebStorm est un environnement de développement intégré pour le langage de programmation JavaScript.", "assets/images/produits/webstorm.png", 149.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 5, 2, 2),
("Maya", "Maya est un logiciel de modélisation 3D, d'animation, de simulation et de rendu 3D développé par Autodesk.", "assets/images/produits/maya.png", 1999.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 6, 6, 8),
("Spark", "Cisco Spark est une plateforme collaborative pour les équipes, qui permet de discuter, de partager des fichiers et de collaborer en temps réel.", "assets/images/produits/cisco_spark.png", 49.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 7, 5, 3),
("CATIA", "CATIA est un logiciel de CAO 3D utilisé par les ingénieurs et les designers pour concevoir des produits, des bâtiments et des structures.", "assets/images/produits/catia.png", 2999.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 8, 6, 9),
("After Effects", "Adobe After Effects est un logiciel d'effets visuels et d'animation graphique utilisé pour la post-production vidéo.", "assets/images/produits/after_effects.png", 299.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 3, 3, 6),
("InDesign", "Adobe InDesign est un logiciel de PAO utilisé pour la création de magazines, de journaux, de livres, de dépliants et de supports marketing.", "assets/images/produits/indesign.png", 199.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 3, 3, 5),
("PhpStorm", "PhpStorm est un environnement de développement intégré pour le langage de programmation PHP.", "assets/images/produits/phpstorm.png", 149.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 5, 2, 2),
("Revit", "Revit est un logiciel de modélisation des données du bâtiment pour les architectes, les ingénieurs et les professionnels de la construction.", "assets/images/produits/revit.png", 1999.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 6, 6, 8),
("Jabber", "Jabber est une application de messagerie instantanée et de présence pour les équipes.", "assets/images/produits/jabber.png", 49.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 7, 5, 3),
("Lightroom", "Adobe Lightroom est un logiciel de retouche photo et de catalogage d'images.", "assets/images/produits/lightroom.png", 299.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 3, 3, 5),
("Teams", "Teams est une plateforme collaborative pour les équipes, qui permet de discuter, de partager des fichiers et de collaborer en temps réel.", "assets/images/produits/teams.png", 99.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 2, 5, 3),
("VM VirtualBox", "VirtualBox est un logiciel de virtualisation open source développé par Oracle Corporation.", "assets/images/produits/virtualbox.png", 999.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 4, 4, 4),
("PyCharm", "PyCharm est un environnement de développement intégré pour le langage de programmation Python.", "assets/images/produits/pycharm.png", 149.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 5, 2, 2),
("3ds Max", "3ds Max est un logiciel de modélisation, d'animation et de rendu 3D développé par Autodesk.", "assets/images/produits/3dsmax.png", 1999.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 6, 6, 8),
("3DVIA", "3DVIA est une plateforme de modélisation 3D pour les professionnels de l'industrie et de l'ingénierie.", "assets/images/produits/3dvia.png", 2999.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 8, 6, 9),
("Audition", "Adobe Audition est un logiciel de montage audio et de post-production audio numérique.", "assets/images/produits/audition.png", 299.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 3, 3, 6),
("SharePoint", "SharePoint est une plateforme de collaboration pour les équipes, qui permet de stocker, d'organiser et de partager des documents.", "assets/images/produits/sharepoint.png", 99.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 2, 4, 4),
("RubyMine", "RubyMine est un environnement de développement intégré pour le langage de programmation Ruby.", "assets/images/produits/rubymine.png", 149.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 5, 2, 2),
("Fusion 360", "Fusion 360 est un logiciel de CAO 3D dans le cloud pour la conception industrielle et mécanique.", "assets/images/produits/fusion360.png", 1999.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 6, 6, 8),
("Meraki", "Meraki est une solution de gestion de réseau cloud pour les entreprises.", "assets/images/produits/meraki.png", 49.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 7, 5, 3),
("ENOVIA", "ENOVIA est une plateforme de gestion du cycle de vie des produits pour les entreprises.", "assets/images/produits/enovia.png", 2999.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 8, 6, 9),
("Dreamweaver", "Adobe Dreamweaver est un logiciel de développement web qui permet de concevoir, coder et gérer des sites web et des applications mobiles.", "assets/images/produits/dreamweaver.png", 299.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 3, 3, 6),
("Exchange", "Exchange est une solution de messagerie et de calendrier pour les entreprises.", "assets/images/produits/exchange.png", 99.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 2, 4, 4),
("NetSuite", "NetSuite est une suite logicielle de gestion d'entreprise en mode cloud.", "assets/images/produits/netsuite.png", 999.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 4, 4, 7),
("CLion", "CLion est un environnement de développement intégré pour le langage de programmation C et C++.", "assets/images/produits/clion.png", 149.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 5, 2, 2),
("Inventor", "Inventor est un logiciel de CAO 3D pour la conception de produits mécaniques et industriels.", "assets/images/produits/inventor.png", 1999.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 6, 6, 8),
("AnyConnect", "AnyConnect est une solution de sécurité réseau qui permet de protéger les connexions VPN.", "assets/images/produits/anyconnect.png", 49.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 7, 5, 3),
("SIMULIA", "SIMULIA est une suite de logiciels de simulation pour les ingénieurs et les chercheurs.", "assets/images/produits/simulia.png", 2999.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 8, 6, 9),
("Animate", "Adobe Animate est un logiciel d'animation vectorielle et de conception interactive.", "assets/images/produits/animate.png", 299.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 3, 3, 6),
("Dynamics", "Dynamics est une suite logicielle de gestion d'entreprise pour les ventes, le marketing et le service client.", "assets/images/produits/dynamics.png", 99.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 2, 4, 4),
("E-Business Suite", "E-Business Suite est une suite logicielle de gestion d'entreprise pour les finances, les ressources humaines et la logistique.", "assets/images/produits/ebs.png", 999.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 4, 4, 7),
("GoLand", "GoLand est un environnement de développement intégré pour le langage de programmation Go.", "assets/images/produits/goland.png", 149.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 5, 2, 2),
("SketchBook", "SketchBook est un logiciel de dessin et de peinture numérique pour les artistes et les designers.", "assets/images/produits/sketchbook.png", 1999.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 6, 6, 8),
("DELMIA", "DELMIA est une suite de logiciels de fabrication numérique pour les entreprises industrielles.", "assets/images/produits/delmia.png", 2999.99, 4.7, 1, "2018-10-17 11:00:00", NULL, 8, 6, 9),
("Character Animator", "Character Animator est un logiciel d'animation 2D qui permet de créer des personnages animés en temps réel.", "assets/images/produits/character_animator.png", 299.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 3, 3, 6),
("Power BI", "Power BI est une suite d'outils d'analyse d'entreprise pour analyser les données et partager des informations.", "assets/images/produits/powerbi.png", 99.99, 4.8, 1, "2018-10-17 11:00:00", NULL, 2, 4, 4),
("Hyperion", "Hyperion est une suite logicielle de gestion de la performance d'entreprise pour les finances et la comptabilité.", "assets/images/produits/hyperion.png", 999.99, 4.9, 1, "2018-10-17 11:00:00", NULL, 4, 4, 7); 