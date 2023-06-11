-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 11 juin 2023 à 13:57
-- Version du serveur : 8.0.31
-- Version de PHP : 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-boutiquedb`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'High Grade', 'Les modèles HG ont été introduits en 1990. Les kits originaux comportaient un assemblage par encliquetage complet, un cadre interne articulé (pour les deux premiers kits, ce qui permet une meilleure amplitude de mouvement et une plus grande facilité de po'),
(2, 'Master Grade', 'Les modèles MG ont été introduits pour la première fois au cours de l\'été 1995. Ils ont été conçus et fabriqués selon des normes plus strictes que la plupart des autres modèles. Ces kits prennent plus de temps à construire et sont souvent plus chers que l'),
(3, 'Perfect Grade', 'PG est la ligne de kits Bandai de la plus haute qualité. Le premier kit PG Gunpla a été un modèle RX 78-2 Gundam sorti en 1998, mais un kit Evangelion Unit-01 étiqueté comme Perfect Grade est sorti l\'année précédente.');

-- --------------------------------------------------------

--
-- Structure de la table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE IF NOT EXISTS `customer_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `address` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `cp` int NOT NULL,
  `city` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1193CB3FA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `customer_address`
--

INSERT INTO `customer_address` (`id`, `user_id`, `address`, `cp`, `city`, `country`) VALUES
(1, 1, '55 Rue des Lombards ', 75001, 'Paris', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230516075307', '2023-05-16 07:53:50', 1140),
('DoctrineMigrations\\Version20230516082048', '2023-05-16 08:21:19', 133),
('DoctrineMigrations\\Version20230516094635', '2023-05-16 09:46:41', 182),
('DoctrineMigrations\\Version20230606150301', '2023-06-06 15:03:13', 1271),
('DoctrineMigrations\\Version20230606150744', '2023-06-06 15:08:01', 195),
('DoctrineMigrations\\Version20230606151810', '2023-06-06 15:18:30', 382),
('DoctrineMigrations\\Version20230610130342', '2023-06-10 13:04:16', 222);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `path` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6A2CA10C4584665A` (`product_id`),
  KEY `IDX_6A2CA10C12469DE2` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `available` tinyint(1) NOT NULL,
  `img` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `description`, `price`, `available`, `img`) VALUES
(1, 1, 'GUNDAM - HG 1/144 - R02 Duel Gundam GAT-X102 - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 15.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/files/FIG85511P_1.jpg?v=1683142435&width=1946'),
(2, 2, 'GUNDAM 00 - RG 1/144 - OO QAN\'T\' - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 29.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/FIG83141P_1.jpg?v=1676735841&width=1946'),
(3, 3, 'GUNDAM - PG 1/60 - Astray Red Frame - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 199.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/FIGGPGASTRAYREDFLA_1.jpg?v=1676291046&width=1946'),
(4, 2, 'GUNDAM 00 - RG 1/144 - GN-001 Gundam Exia - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 27.9, 0, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/FIG83117P_1.webp?v=1676735274&width=1946'),
(5, 2, 'GUNDAM 00 - RG 1/144 - GN-001 Gundam Exia - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 27.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/FIG83117P_1.webp?v=1676735274&width=1946'),
(7, 1, 'GUNDAM - HG 1/144 - MS-06S Zaku II Red Comet Ver - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 21.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/FIGBAN2481061_1.jpg?v=1677424762&width=1946'),
(8, 2, 'GUNDAM 00 - RG 1/144 - GN-0000+GNR-010 OO Raiser - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 32.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/FIGBAN83119_1.jpg?v=1677254638&width=1946'),
(9, 2, 'GUNDAM - RG 1/144 - ZGMF X20A Strike Freedom - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 34.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/FIGBAN83116_1.jpg?v=1676739429&width=1946'),
(10, 3, 'GUNDAM - PG 1/60 - Unicorn Banshee Norn - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 249.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/FIGGPGUNICORNBN_1.jpg?v=1676389227&width=1946'),
(11, 3, 'GUNDAM - PG 1/60 - RX-178 MK II AEUG Prototype - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 169.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/FIGGPGRX178AEUG_1.jpg?v=1676391240&width=1946'),
(12, 3, 'GUNDAM - PG 1/60 - Strike Rouge + Skygrasper - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 214.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/FIGGPGSRSKY160_1.jpg?v=1676480032&width=1946'),
(13, 1, 'GUNDAM - HG 1/144 - Gundam Livelance Heaven - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 23.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/FIGMK62024_1.jpg?v=1677418094&width=1946'),
(14, 1, 'GUNDAM - HG 1/144 - Gundam LFRITH UR - Model Kit', 'issues de la franchise japonaise Gundam et commercialisées par Bandai ; il résulte de la contraction de « Gundam plastic model ». Apparu en 1980.\r\nLA PHILOSOPHIE DU GUNPLA : LA MAQUETTE POUR TOUS ! « sans colle ni peinture »\r\nToutes les maquettes Gundam se caractérisent par deux propriétés essentielles : \r\n- les pièces sont emboîtables \r\n- et elles sont moulées en couleurs.\r\nLes Gunpla sont classés par gammes (nommées « grade ») en fonction de leur qualité et/ou de leur taille.', 19.9, 1, '//cdn.shopify.com/s/files/1/0694/5076/0456/products/52392397310_322de485bf_o.jpg?v=1676997413&width=1946');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb3_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `first_name`, `phone`) VALUES
(1, 'test@gmail.com', '[]', '$2y$13$vlCdbEgfshOFI.ppGxb1suFtLqCi0rWenVWUHIOLRWJMqg4Rp1FAi', 'Doe', 'John', '0834567845'),
(2, 'test2@gmail.com', '[]', '$2y$13$Tqo1NmKCo1N8BtmvTfLSAu4hqtEZv4h4wtqruVyZPTwwN14d5MnyK', 'Doe', 'Jane', '0903993020'),
(3, 'steve@gmail.com', '[]', '$2y$13$.0PxJ981WQH1pRuKWANo0.e4zCT4K05uEIjUmEllbbq25uy.vBl/.', 'Nash', 'Steve', '0876543455');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `FK_1193CB3FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_6A2CA10C4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
