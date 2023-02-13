-- phpMyAdmin SQL Dump

-- version 5.1.1

-- https://www.phpmyadmin.net/

--

-- Hôte : 127.0.0.1:3306

-- Généré le : sam. 04 fév. 2023 à 17:31

-- Version du serveur : 8.0.28

-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!40101 SET NAMES utf8mb4 */

;

--

-- Base de données : `leloftdagnes`

--

-- --------------------------------------------------------

--

-- Structure de la table `administrateurs`

--

DROP TABLE IF EXISTS `administrateurs`;

CREATE TABLE
    IF NOT EXISTS `administrateurs` (
        `id` varchar(42) NOT NULL,
        `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
        `motdepasse` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Déchargement des données de la table `administrateurs`

--

INSERT INTO
    `administrateurs` (`id`, `email`, `motdepasse`)
VALUES (
        '60650f68-27d8-4337-91f4-ebc243c82dea',
        'admin@admin.fr',
        '$argon2id$v=19$m=16,t=2,p=1$c3VwZXJsb25ndGV4dGZvcmp3dHBvdXJsZXNpdGVsZWxvZnRkYWduZXNzZWN1cml0ZQ$zGzVy3hVcE9THS0fKVyjHQ'
    );

-- --------------------------------------------------------

--

-- Structure de la table `categories`

--

DROP TABLE IF EXISTS `categories`;

CREATE TABLE
    IF NOT EXISTS `categories` (
        `num_categories` varchar(42) NOT NULL,
        `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
        `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
        `priorité` int DEFAULT NULL,
        PRIMARY KEY (`num_categories`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Déchargement des données de la table `categories`

--

INSERT INTO
    `categories` (
        `num_categories`,
        `nom`,
        `description`,
        `priorité`
    )
VALUES (
        '1423da09-6acd-4073-8bd4-31dd45777b77',
        'Objets déco / Miroirs',
        'Vous pouvez choisir parmi un grand nombre d\'objets déco celui qui conviendra le mieux à votre ambiance.',
        3
    ), (
        '98fee939-1c9f-41c1-a7ce-e5bbb7f33f57',
        'Plateau à apéro',
        'Vous pouvez découvrir différents formats de planches à apéro carré, rectangle avec différentes dimensions. Différents choix de couleurs de anses et de personnalisation.',
        1
    ), (
        'f0d5e8f3-07ea-4f04-bef1-d1cd4f223bff',
        'Couronne Pompons',
        'Vous pouvez choisir la couleur du cercle : blanc, doré ou cuivré ainsi que les tons des pompons en fonction de la déco de la pièce où sera exposée cette couronne.',
        2
    );

-- --------------------------------------------------------

--

-- Structure de la table `cuirs`

--

DROP TABLE IF EXISTS `cuirs`;

CREATE TABLE
    IF NOT EXISTS `cuirs` (
        `num_cuirs` varchar(42) NOT NULL,
        `couleur` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
        PRIMARY KEY (`num_cuirs`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Déchargement des données de la table `cuirs`

--

INSERT INTO
    `cuirs` (`num_cuirs`, `couleur`)
VALUES (
        '30690d5f-e546-45b7-baf4-222fed1fb97d',
        'noir'
    );

-- --------------------------------------------------------

--

-- Structure de la table `peut_etre_decore`

--

DROP TABLE IF EXISTS `peut_etre_decore`;

CREATE TABLE
    IF NOT EXISTS `peut_etre_decore` (
        `num_produits` varchar(42) NOT NULL,
        `num_polices` varchar(42) NOT NULL,
        PRIMARY KEY (`num_produits`, `num_polices`),
        KEY `PEUT_ETRE_DECORE_FK1` (`num_polices`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--

-- Structure de la table `peut_etre_orne`

--

DROP TABLE IF EXISTS `peut_etre_orne`;

CREATE TABLE
    IF NOT EXISTS `peut_etre_orne` (
        `num_produits` varchar(42) NOT NULL,
        `num_cuirs` varchar(42) NOT NULL,
        PRIMARY KEY (`num_produits`, `num_cuirs`),
        KEY `PEUT_ETRE_ORNE_FK1` (`num_cuirs`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--

-- Structure de la table `photos`

--

DROP TABLE IF EXISTS `photos`;

CREATE TABLE
    IF NOT EXISTS `photos` (
        `num_photos` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
        `lien` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
        `localhostlien` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
        `ismaxi` tinyint(1) NOT NULL,
        `ismedium` tinyint(1) NOT NULL,
        `ismini` tinyint(1) NOT NULL,
        `num_categories` varchar(42) DEFAULT NULL,
        `num_produits` varchar(42) DEFAULT NULL,
        `num_cuirs` varchar(42) DEFAULT NULL,
        `num_polices` varchar(42) DEFAULT NULL,
        PRIMARY KEY (`num_photos`),
        KEY `PHOTO_FK1` (`num_polices`),
        KEY `PHOTO_FK2` (`num_cuirs`),
        KEY `PHOTO_FK3` (`num_produits`),
        KEY `PHOTO_FK4` (`num_categories`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Déchargement des données de la table `photos`

--

INSERT INTO
    `photos` (
        `num_photos`,
        `lien`,
        `localhostlien`,
        `ismaxi`,
        `ismedium`,
        `ismini`,
        `num_categories`,
        `num_produits`,
        `num_cuirs`,
        `num_polices`
    )
VALUES (
        '5ca31914-d9b4-44eb-87a3-a9f37ac09e01',
        '5d0d85e0-ed59-4f99-a4b9-bc08d7220574.png',
        'https://i.imgur.com/zkx29aO.png',
        0,
        1,
        0,
        NULL,
        'c967aac7-ae64-444b-8765-074e301ac3ad',
        NULL,
        NULL
    ), (
        '906096e4-bbbf-4103-8105-ce53bd770647',
        'e5575055-eeda-458c-b43d-48e9474685fc.png',
        'https://i.imgur.com/fpAt3fY.png',
        0,
        1,
        0,
        NULL,
        NULL,
        NULL,
        '906096e4-bbbf-4103-8105-ce53bd770647'
    ), (
        'a92de08d-92c8-4599-9785-fce096aae2a6',
        'b6cf480a-e59c-4a2c-847a-95950d6e0f80.png',
        'https://i.imgur.com/GifWPGP.png',
        0,
        1,
        0,
        'f0d5e8f3-07ea-4f04-bef1-d1cd4f223bff',
        NULL,
        NULL,
        NULL
    ), (
        'b487a0eb-6fb0-49ef-99d6-742e2ec602be',
        '21c9b0e4-b10d-4765-a5dc-6a1e195ccb98.png',
        'https://i.imgur.com/yssyldk.png',
        0,
        1,
        0,
        NULL,
        '74078391-50e7-48ef-81c9-fd8cb5a9fdd4',
        NULL,
        NULL
    ), (
        'ba4220e4-17fd-43c3-80c2-8431be46b7fa',
        'aea24162-b3c0-4077-a083-1b9ab6b77324.png',
        'https://i.imgur.com/ItEysQO.png',
        0,
        1,
        0,
        '98fee939-1c9f-41c1-a7ce-e5bbb7f33f57',
        NULL,
        NULL,
        NULL
    ), (
        'e46e9839-1304-453f-b2f8-c542a243ce7c',
        '566bbcea-45a0-46a5-99a5-efbcb8d64137.png',
        'https://i.imgur.com/F9nqTGR.png',
        0,
        1,
        0,
        '1423da09-6acd-4073-8bd4-31dd45777b77',
        NULL,
        NULL,
        NULL
    );

-- --------------------------------------------------------

--

-- Structure de la table `polices`

--

DROP TABLE IF EXISTS `polices`;

CREATE TABLE
    IF NOT EXISTS `polices` (
        `num_polices` varchar(42) NOT NULL,
        `nom` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
        PRIMARY KEY (`num_polices`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Déchargement des données de la table `polices`

--

INSERT INTO
    `polices` (`num_polices`, `nom`)
VALUES (
        '906096e4-bbbf-4103-8105-ce53bd770647',
        'Itim'
    );

-- --------------------------------------------------------

--

-- Structure de la table `produits`

--

DROP TABLE IF EXISTS `produits`;

CREATE TABLE
    IF NOT EXISTS `produits` (
        `num_produits` varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
        `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
        `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
        `peut_avoir_une_police` tinyint(1) NOT NULL,
        `peut_avoir_un_cuir` tinyint(1) NOT NULL,
        `longueur` decimal(5, 2) DEFAULT NULL,
        `largeur` decimal(5, 2) DEFAULT NULL,
        `hauteur` decimal(5, 2) DEFAULT NULL,
        `prix` decimal(5, 2) DEFAULT NULL,
        `priorité` int DEFAULT NULL,
        `num_categories` varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
        PRIMARY KEY (`num_produits`),
        KEY `PRODUIT_FK1` (`num_categories`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Déchargement des données de la table `produits`

--

INSERT INTO
    `produits` (
        `num_produits`,
        `nom`,
        `description`,
        `peut_avoir_une_police`,
        `peut_avoir_un_cuir`,
        `longueur`,
        `largeur`,
        `hauteur`,
        `prix`,
        `priorité`,
        `num_categories`
    )
VALUES (
        '74078391-50e7-48ef-81c9-fd8cb5a9fdd4',
        'Plateau rectangle',
        'Personnalisation au delà de 8 mots : supplément de 3€',
        1,
        1,
        '15.00',
        '50.00',
        NULL,
        '26.90',
        2,
        '98fee939-1c9f-41c1-a7ce-e5bbb7f33f57'
    ), (
        'c967aac7-ae64-444b-8765-074e301ac3ad',
        'Plateau carré',
        'Personnalisation au delà de 8 mots : supplément de 3€',
        1,
        1,
        '30.00',
        '30.00',
        NULL,
        '28.90',
        1,
        '98fee939-1c9f-41c1-a7ce-e5bbb7f33f57'
    );

--

-- Contraintes pour les tables déchargées

--

--

-- Contraintes pour la table `peut_etre_decore`

--

ALTER TABLE `peut_etre_decore`
ADD
    CONSTRAINT `PEUT_ETRE_DECORE_FK1` FOREIGN KEY (`num_polices`) REFERENCES `polices` (`num_polices`),
ADD
    CONSTRAINT `PEUT_ETRE_DECORE_FK2` FOREIGN KEY (`num_produits`) REFERENCES `produits` (`num_produits`);

--

-- Contraintes pour la table `peut_etre_orne`

--

ALTER TABLE `peut_etre_orne`
ADD
    CONSTRAINT `PEUT_ETRE_ORNE_FK1` FOREIGN KEY (`num_cuirs`) REFERENCES `cuirs` (`num_cuirs`),
ADD
    CONSTRAINT `PEUT_ETRE_ORNE_FK2` FOREIGN KEY (`num_produits`) REFERENCES `produits` (`num_produits`);

--

-- Contraintes pour la table `photos`

--

ALTER TABLE `photos`
ADD
    CONSTRAINT `PHOTO_FK1` FOREIGN KEY (`num_polices`) REFERENCES `polices` (`num_polices`),
ADD
    CONSTRAINT `PHOTO_FK2` FOREIGN KEY (`num_cuirs`) REFERENCES `cuirs` (`num_cuirs`),
ADD
    CONSTRAINT `PHOTO_FK3` FOREIGN KEY (`num_produits`) REFERENCES `produits` (`num_produits`),
ADD
    CONSTRAINT `PHOTO_FK4` FOREIGN KEY (`num_categories`) REFERENCES `categories` (`num_categories`);

--

-- Contraintes pour la table `produits`

--

ALTER TABLE `produits`
ADD
    CONSTRAINT `PRODUIT_FK1` FOREIGN KEY (`num_categories`) REFERENCES `categories` (`num_categories`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;