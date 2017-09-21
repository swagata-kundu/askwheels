CREATE TABLE `db_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `db_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `sessionId` char(36) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` tinytext,
  `phone` varchar(25) DEFAULT NULL,
  `isLive` tinyint(1) DEFAULT '0',
  `isDeleted` tinyint(1) DEFAULT '0',
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `dateModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deviceId` varchar(255) DEFAULT '',
  `imgUrl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)) ENGINE=InnoDB;


  CREATE TABLE `db_user_in_roles` (
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `db_user_in_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `db_user_roles` (`id`),
  CONSTRAINT `db_user_in_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `db_users` (`id`)
) ENGINE=InnoDB;