-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

USE vk;

ALTER TABLE `users` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
    `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `phone` bigint(20) unsigned DEFAULT NULL,
    `is_deleted` bit(1) DEFAULT b'0',
    
    `created_at` datetime DEFAULT current_timestamp(),
    `updated_at` datetime DEFAULT current_timestamp(),
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `email` (`email`),
    KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
);

ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'Eugenia','Nienow','ila.kreiger@example.net','1f6b1db5e7d838ed571f6691aaf8f1e9fe9c93d8',5114985113,'\0','2021-03-09 20:50:16','2020-11-25 23:53:44'),(2,'Nola','Hoeger','julio46@example.com','84fba0bdadd4bc3925f250e04ff5b56b22f36895',5850754754,'\0','1990-01-15 00:44:06','2014-11-04 01:30:55'),(3,'Nicklaus','Hilll','emily27@example.net','52935f68e0f485554dcde14ec43540936408cc87',268831,'','1979-09-22 20:54:02','2015-06-22 09:56:33'),(4,'Arely','Moen','thalia66@example.com','e7be20615fe8360bb711a6cc81397299ba0a0232',20,'','1977-04-11 06:05:12','2017-10-08 08:56:12'),(5,'Pierce','Ryan','xmarks@example.com','cfa5a8d961aeee94a99b5f199f1c35ca3b46a845',1,'\0','2003-06-05 05:01:30','1977-02-12 02:44:23'),(6,'London','Kassulke','umante@example.org','e67d7d57775ab0a417bc3f5eb21e6e2f861f6698',249,'','1991-05-12 23:54:35','2009-07-18 03:13:23'),(7,'Carmel','Herzog','karianne77@example.com','d2d56c6ae3d170433f6af4faa38a6e8b5d42d172',1,'\0','1984-08-05 06:16:02','1982-10-31 19:34:28'),(8,'Janiya','Carroll','josefina92@example.net','9b2e1aaf5d9f937881dee4b81736ffd068d64dbc',0,'','1995-03-19 05:29:41','1982-11-16 10:39:32'),(9,'Bernard','Fay','antonina23@example.com','38ed4985b1efcc262741cc9e006ac6592f5103af',2277506046,'\0','1988-04-27 14:15:29','2012-12-25 15:03:45'),(10,'Eden','Kuhn','ndaniel@example.org','af44e17e1d20a99780c9447fe3fdccc19cf7cfe5',1,'','2016-10-14 06:19:45','1997-09-13 13:31:13'),(11,'Kaylee','Sawayn','halvorson.cara@example.com','b0a9abcabb49328cea911848682bbfaae1253a96',462899,'\0','1976-09-28 21:23:58','1978-06-06 15:50:24'),(12,'Mohamed','Kuhic','klein.manuel@example.org','c5d288791a4b8ccdb2d999273d0aa2efd5304c0a',313232,'\0','1974-04-02 20:03:30','1990-09-21 06:57:36'),(13,'Olga','Moen','igulgowski@example.org','49698e5447c00d77adf3a460fe07b1782176ab0c',0,'\0','2019-03-25 04:13:01','1986-10-23 07:08:03'),(14,'Royal','Boyle','koss.kamren@example.net','ac37811321df9fc3da651276960f48a008c4784f',0,'\0','2018-03-25 16:06:38','1985-09-12 21:22:59'),(15,'Donnell','West','ystark@example.net','6e91553c24aa9173b52392d2394e69a6485c8307',1,'','1998-05-14 23:37:06','1973-04-17 08:52:19'),(16,'Jana','Bayer','georgiana38@example.org','d963619589b78bfec231b6bd8220d065a2c2b0fe',634,'','2014-02-06 05:13:39','1994-12-10 17:21:53'),(17,'Sabryna','Orn','orn.emmett@example.com','b6ed77b6df094a5f86b6f0bfb116f4d148315082',1,'\0','2005-03-18 07:50:25','2016-08-06 06:05:20'),(18,'Theo','Dickinson','maryam04@example.com','cf3441b53be528e7cee89498baa8ffbd296e3e82',482,'','1999-04-22 22:19:25','1978-05-11 04:47:48'),(19,'Brenden','Wyman','gaylord.ewald@example.com','34a84ddcafac05008d1094b618a62dba66327955',519440,'\0','1976-07-11 20:11:53','1983-10-20 04:37:57'),(20,'Tamia','Donnelly','bpfannerstill@example.com','f771460c8a0bb21ca9fc4a852e1912d77e8cb9f9',0,'\0','2015-12-30 10:23:32','1984-12-23 23:21:00'),(21,'Jaleel','Kuhic','emedhurst@example.org','faf1e217c7ef7d18f91446a1d5757e0dfca17cf0',1,'','2006-09-04 08:37:43','1989-02-24 00:31:09'),(22,'Merritt','Reichel','lpfeffer@example.com','6c162b4002dd968a554417a4f46a865dc7162bf1',405457,'\0','2019-12-26 17:34:14','2002-01-05 02:36:53'),(23,'Rhianna','Kling','paucek.birdie@example.net','b65c60cede863c7e16d72ac17838f312978c0385',47,'','2009-08-16 11:04:21','2017-05-19 03:02:42'),(24,'Alberto','Gusikowski','rice.pietro@example.com','72a2462c54928e3046acf874a03c50a3ce109218',593,'','2015-07-29 22:49:32','1972-02-15 01:06:51'),(25,'Ron','Hyatt','dakota69@example.net','71c2d311ac8e340bf5ced9166c6477eafe3ec164',1,'','1984-09-06 02:18:45','2008-01-07 03:02:38'),(26,'Jordy','Schmeler','jaunita.nienow@example.net','d3ec72dca981f5a384e68ae93eb4d9c36c186907',228,'','2008-05-08 12:49:50','1981-05-16 19:23:32'),(27,'Caitlyn','Nicolas','laura72@example.org','b57983c421fe51af0f74e59032c34ff3f553d3bf',0,'','2003-04-04 12:45:10','2013-11-11 20:57:19'),(28,'Ally','Nikolaus','gonzalo.flatley@example.net','af6c38c57eef597fc672106f59fba70a6046f1c2',0,'\0','2002-01-16 07:00:38','1991-03-15 22:53:46'),(29,'Adelle','Rosenbaum','ruth.heaney@example.net','f3de22137be75253bc04bc078e513d0cb99b801a',1,'','1970-12-01 06:12:50','1978-03-02 17:29:00'),(30,'Cordie','Douglas','alicia.reynolds@example.com','df7748cdc70698b6a419d1fe9ad2b1b4a5a8b7d0',1,'','1973-08-08 18:14:45','1982-04-24 09:27:43'),(31,'Meghan','Ritchie','qrobel@example.org','140aa4f83fdf2c9e21d01b9ef080e656b61eeaee',0,'','1990-11-08 20:14:02','1980-04-26 15:57:41'),(32,'Janessa','Ward','yrohan@example.com','b2d536d5c80739c0a19b460b21743fdb4471246f',378,'\0','1993-10-31 19:27:01','2017-05-28 20:55:42'),(33,'Beth','Okuneva','vlittel@example.com','dbf70683e8f348efa5869cc1cfa2eeef1afdd46f',215858,'','2009-01-24 18:35:27','2012-08-13 18:12:59'),(34,'Hannah','Buckridge','ocrooks@example.com','51a06c8da8fd67accd7ef371cd1df0c2af22777e',480192,'','1978-11-02 09:07:46','1994-10-02 19:10:20'),(35,'Eugenia','Schamberger','jody20@example.org','803f7d7eddad8f3422203ef2521c86e2546b22fe',1,'\0','1985-11-22 21:42:54','2005-10-28 16:35:27'),(36,'Wilmer','Fay','wsanford@example.com','ac785002da3de39638590abe50c80a34a325b647',55,'','2000-12-29 11:12:11','1976-02-10 16:43:40'),(37,'Jalyn','Mayert','elmira.fritsch@example.org','28030a30747d95c94089730872b8643178530865',0,'','2010-07-25 13:29:32','2004-07-31 03:26:20'),(38,'Orpha','Hamill','maggio.baylee@example.com','d171676fd93f911e386f006eb334be9ec5b4e9c9',393572,'\0','2002-11-29 06:08:56','1973-04-02 18:06:12'),(39,'Dixie','Wiegand','baumbach.emerson@example.com','0e1428a81432ed361ca78c36738029fd5cb67334',264989,'','1989-08-31 15:04:59','1981-03-05 20:21:35'),(40,'Kaylin','Bogan','ledner.linwood@example.com','7071bb2ca52c0cab483d5b99ffa4bbb30283d55b',260,'\0','1999-06-21 18:49:49','2009-06-12 22:12:24'),(41,'Rosemary','D\'Amore','pauline44@example.org','a36a1f1053f3ab204f961264f2b1ab5c4e5f41a1',0,'\0','1983-09-15 14:45:26','1970-03-18 07:23:24'),(42,'Elias','Murray','berniece.stamm@example.net','270b59945139f0659628e1b3cc3dd51e75e411fe',1,'\0','1971-02-09 06:18:59','1978-08-01 09:10:55'),(43,'Angus','Daugherty','cathy.nienow@example.org','dc1c6322ddf1cc0386afeba63ead7abd0c7d5aca',1,'','1982-10-13 23:12:32','1975-07-12 01:09:20'),(44,'Nola','Jenkins','rudolph15@example.net','ad25efdf55cbb9d19c697e65a1510d3727bca96a',497299,'\0','2009-03-15 04:21:38','1993-04-30 04:04:05'),(45,'Jewel','Turcotte','kiley.jacobson@example.net','d27bb1d11c53a0f9fb2f63c85d6be15f269c224b',383812,'\0','2020-10-29 17:58:16','1982-02-17 09:06:51'),(46,'Paris','Willms','ferry.ruby@example.org','7555d544fea02e8feeb9c75cf40c6cbf96c77e1d',8320572499,'\0','1995-12-11 06:26:10','1973-01-05 04:21:40'),(47,'Ila','Ward','mona10@example.org','ef3cd44d27f29e82f83cd4d3d73ea61e68f2728e',1,'\0','1999-08-26 11:45:40','1989-06-05 20:27:46'),(48,'Providenci','Bogan','zherman@example.org','34e1ee75ae575720be25c2347b19ca0621fe68f6',114569,'','2014-07-08 01:37:22','1987-12-15 01:22:23'),(49,'Erling','Runolfsdottir','moore.garland@example.org','89805ad029ce31334bdb7ef4565c5c7faec62272',1,'\0','2020-09-15 21:35:05','1996-08-18 08:06:54'),(50,'Velda','O\'Keefe','branson19@example.com','dc8340ec5781f04284e61a02a70cbe0d65bed7f6',61,'','1994-03-31 07:34:27','1982-08-09 03:11:24'),(51,'Wilma','Goldner','ysatterfield@example.org','f4aca38478c253f9a3c2d26ed9db327215dff063',0,'','2016-08-15 05:32:38','2001-05-20 04:55:04'),(52,'Stanley','Hudson','jarrod.skiles@example.org','7477ea1ff4f9d6795b454255534dcc235b97ba3a',0,'\0','2018-09-02 21:38:00','2003-07-09 07:30:40'),(53,'Zella','Ruecker','littel.flo@example.net','501413847eef21a4d9ea43e34cbf17cfcfdbece6',36,'\0','2006-05-05 23:25:43','1976-04-13 02:25:26'),(54,'Hester','Jacobi','ggerhold@example.net','dd39a619521dd4eae64992c13df09b543c638c94',1,'','1970-10-29 23:19:03','1998-04-24 15:52:56'),(55,'Luz','Ebert','macejkovic.cassandre@example.org','8760e421490903fc94f958df6dead62cdcac8d6d',59,'\0','1988-06-26 23:22:24','1993-01-30 22:34:33'),(56,'Emily','Greenfelder','sunny.kunde@example.com','7a67ea53c865eeb7c1a87e94e3d887b37a64bb22',1365246898,'','2000-01-02 13:05:05','1981-12-27 16:27:32'),(57,'Ruth','Metz','qsatterfield@example.com','0b07af133c4b3709d50bb3010d70fa1bd1a85c85',715,'\0','2021-03-03 09:14:42','2021-02-24 10:32:51'),(58,'Kareem','Bernhard','madisen.maggio@example.org','6704b76c4f595c115c472fc836e2b9d9a5c2330b',1,'\0','1995-07-21 02:20:52','2017-12-05 15:41:12'),(59,'Ada','Zieme','wendell.fritsch@example.com','6b6f906e72bdf80e16bc4a1af65b18c6f18708e4',92320,'\0','1984-06-02 06:52:16','1972-12-31 14:21:17'),(60,'Dorothy','Hackett','lenore46@example.net','2473624d41f259c21ba7835ecfede7b4c7c0ce63',22,'','1979-07-25 06:43:10','2005-09-13 16:26:41'),(61,'Jaida','Lakin','ted.schowalter@example.org','0af89ec4701fb35a95e3cbd06a364e494e6ca27b',1,'\0','1976-08-07 03:48:20','2019-11-23 18:09:26'),(62,'Frederique','Lakin','ross.cruickshank@example.com','ab842b23def7134da56b35fb61b05cdb69e435e3',53,'','2017-10-02 07:29:36','2019-01-29 15:38:51'),(63,'Nathen','Heaney','maribel29@example.org','8f9fd9cfcc85422cb8df3b22b84efb6a1562bf85',1,'','2003-09-12 14:06:46','2014-09-26 15:46:31'),(64,'Van','Hessel','emory.bernhard@example.net','7dbff3edbc5e84314a843b1c708a341f56e90119',830769306,'\0','2002-02-06 11:16:37','1982-05-23 07:33:01'),(65,'Forrest','Smith','katelin.morissette@example.com','af951d858c31cf6dfccd81efcd76ec3a8d3845d5',1,'\0','2016-08-16 17:16:32','2014-01-05 20:01:28'),(66,'Arielle','Kuphal','jeromy66@example.com','d7dc157304556f70c8bdc857c2995b7b46ca7ba1',1,'\0','1996-01-05 08:36:29','1995-03-04 01:40:18'),(67,'Aliyah','Eichmann','aidan93@example.org','92971eef83bde482d4452c4123011c37a9f241ec',0,'','1974-12-24 13:23:49','2009-03-17 02:53:52'),(68,'Earnest','Sporer','zoe67@example.org','220948a619803e2f7190007eec8c6c6a9b7c5f09',823,'\0','2007-01-18 12:02:43','2016-03-28 16:16:24'),(69,'Margarete','Stoltenberg','rhansen@example.org','f7be3431d1787a05cbb3e9ae042339f0575c525f',0,'','1985-05-24 21:39:11','2020-01-19 21:44:18'),(70,'Cletus','Schinner','acrist@example.net','36acd8afe3952f7c0fa87c185e268e14ae8ed4fc',0,'','2013-04-10 23:36:58','1993-05-29 15:08:48'),(71,'Terrell','Marks','jaylen.anderson@example.com','1e94c86be7dbf8aed45b09b9b5692c26b27a8d3f',793,'','1977-10-12 00:37:25','1991-07-08 19:42:39'),(72,'Austyn','Runte','elisha29@example.com','c401bced3473254e6dd8234378e588ecfd3166ac',1,'','1973-10-31 09:42:33','1970-05-02 05:09:13'),(73,'Sabina','Jacobs','weber.jasper@example.com','cbbca3ddaa5f637249515a1b545aba97b9a49398',0,'\0','1983-03-07 04:40:25','2014-03-22 19:38:45'),(74,'Ari','Boyle','miguel.fadel@example.net','02e8f0cd4ac8dbb515e4a8be38237e838cd95c0c',243,'','2005-02-07 17:31:03','2018-01-29 01:24:31'),(75,'Odie','Simonis','keanu97@example.org','905c6456ee86644b846534e8ddfa2de529b57a6b',1,'','1973-08-31 23:00:24','1976-09-27 21:07:36'),(76,'Kelly','Schumm','conn.greg@example.com','493397d64ccc8af4504a2ab25e7b8e94a8fd75ef',1,'\0','1985-05-02 09:20:03','1986-04-20 04:08:20'),(77,'Jackson','Bogisich','suzanne60@example.net','1daf27facec00adfd79dbb4aebd0e89d17a25b39',656672,'','1993-02-04 23:41:02','1994-08-01 18:35:08'),(78,'Hilton','Gerlach','drew59@example.com','4aefc1b13ec82d8714fb87a214739088c6927dfc',1,'\0','1977-09-06 22:35:49','1970-06-29 19:40:04'),(79,'Teresa','Cruickshank','rasheed.hilpert@example.org','78255bf3c4f0c33b5904defcf553e965f58aa1f9',1,'\0','1993-03-03 08:54:38','1986-08-26 00:25:41'),(80,'Craig','Corkery','hollis76@example.net','9107ee2ca15bcb0133596c4ec571c89dee6f9a88',1,'\0','2009-03-08 14:48:55','2017-06-14 14:04:16'),(81,'Caleigh','McDermott','roslyn73@example.net','0d77f5ef60fcfeebe05368aae37b86a8cd8e961a',480297,'\0','1994-04-09 17:41:34','1970-04-18 14:34:17'),(82,'Amira','Johns','rae58@example.org','e99eead3103911e42e50e2f2317faa951c6f64a1',1,'','2018-07-16 21:55:41','1983-07-25 05:35:54'),(83,'Damion','Bosco','tyra.goodwin@example.net','7c171934f322acf22a58ff4eb4f474227070adac',0,'\0','2013-01-12 12:24:02','1998-04-15 13:51:01'),(84,'Macy','Huel','daryl.boehm@example.com','d016e5b7e4b94392ad773ca11b847cea3bc61578',5817268686,'','2017-05-25 09:07:06','1979-06-18 15:11:58'),(85,'Catalina','Halvorson','fiona14@example.net','5d97dbe05b76c1495bc66541e12180145b40fe64',8,'\0','1997-05-18 06:08:28','1988-06-14 16:36:45'),(86,'Mohammed','Gutkowski','kraig58@example.org','0c88b931a37397dc700b60faeca7e17f78756a43',34,'','1982-02-16 06:44:32','2018-02-22 22:24:37'),(87,'Reanna','Lang','hermann.ivah@example.net','0955cdd4d62dc2e740182863095d9c5cf21d6293',2993944790,'\0','1974-06-22 18:33:06','1994-05-11 09:12:18'),(88,'Aracely','Sawayn','osborne.o\'conner@example.org','b219b891010ec078787243d91daf341ee4ffef97',883,'','2012-12-23 13:20:36','1987-06-13 16:04:42'),(89,'Diego','Barton','xo\'reilly@example.com','5e269d10259944616de671bf546e9906781d7494',1,'\0','1988-07-15 02:11:47','2019-09-02 20:06:43'),(90,'Selina','DuBuque','parisian.stephania@example.net','32796e67d9a14fde014d01b8957b67a6567c0cab',1,'','2012-06-27 12:13:29','1970-06-15 17:50:41'),(91,'Palma','Hane','ckovacek@example.com','9e02f20f44403beb30b98bd9dfcc8e1f451d545f',1,'\0','2019-01-14 19:14:56','1995-07-26 05:09:54'),(92,'Alycia','Runolfsdottir','stevie71@example.org','5093c98a246a93a1b8810a7bc91d1fef645a49f0',1,'\0','2009-07-22 21:24:21','1987-11-19 14:57:52'),(93,'Ressie','Goldner','isaias.cormier@example.com','e97839a3ebcb43fd6dd485c4a60b9e61f7efb1e8',72,'\0','1975-02-11 19:34:51','1974-03-14 02:10:48'),(94,'Bella','Funk','raheem.thompson@example.org','ba894a5bb6f59b492b4190b698f6e370872d5473',0,'\0','2015-01-24 08:47:15','1978-01-27 10:53:54'),(95,'Aron','Hilll','walker.predovic@example.org','b40cce7926a3cd63b3f9570f1b57a539bccd1799',1,'','2000-05-04 02:16:34','1975-07-05 03:41:20'),(96,'Alex','Lebsack','prempel@example.com','542f95ad76a4b534492f2131f147078c120e66fb',1,'\0','2012-03-18 23:38:38','1998-06-15 00:59:53'),(97,'Jessika','Ankunding','wyatt.luettgen@example.org','2560cb63bf06b4f5aa06cd0294f4f68134e0188c',0,'\0','1988-11-19 17:59:35','1978-02-28 13:58:08'),(98,'Whitney','Ziemann','mckenzie10@example.com','51b9ff5b6306d6d830484c18abc99ef734bc39b1',311985,'\0','2000-01-21 10:43:25','1973-08-29 02:21:44'),(99,'Precious','Prosacco','shyann.turcotte@example.com','33335de53945b047f957a176dfed79b98389d819',0,'','1980-11-27 18:01:53','2004-06-25 23:27:02'),(100,'Allan','Beahan','brakus.winnifred@example.org','71886937f6b689e1629f6905a99db709b2872f6f',42,'\0','1970-01-25 08:43:49','2005-08-03 17:28:08');
UNLOCK TABLES;

-- 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

ALTER TABLE users
    CHANGE COLUMN `created_at` `created_at` VARCHAR(256) NULL,
    CHANGE COLUMN `updated_at` `updated_at` VARCHAR(256) NULL;

describe users;
SELECT created_at from users;

ALTER TABLE users 
    CHANGE COLUMN `created_at` `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHANGE COLUMN `updated_at` `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

describe users;
SELECT updated_at from users;

-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.

create table storehouses_products (
	id SERIAL PRIMARY KEY,
    storehouse_id INT unsigned,
    product_id INT unsigned,
    `value` INT unsigned COMMENT 'Запас товарный позиции на складке',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO
    storehouses_products (storehouse_id, product_id, value)
VALUES
    (1, 1, 11),
    (1, 3, 0),
    (2, 8, 2),
    (3, 5, 7),
    (2, 4, 0);

SELECT 
    value
FROM
    storehouses_products ORDER BY CASE WHEN value = 0 then 1 else 0 end, value;
   
-- 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august)

SELECT
    name, birthday_at, 
    CASE 
        WHEN DATE_FORMAT(birthday_at, '%m') = 05 THEN 'may'
        WHEN DATE_FORMAT(birthday_at, '%m') = 08 THEN 'august'
    END AS mounth
FROM
    users WHERE DATE_FORMAT(birthday_at, '%m') = 05 OR DATE_FORMAT(birthday_at, '%m') = 08;

-- 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса:
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM catalogs WHERE id IN (5, 1, 2);

SELECT 
    *
FROM
    catalogs WHERE id IN (5, 1, 2) 
ORDER BY CASE
    WHEN id = 5 THEN 0
    WHEN id = 1 THEN 1
    WHEN id = 2 THEN 2
END;

-- 6. Подсчитайте средний возраст пользователей в таблице users.

SELECT DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))) AS day FROM users;
SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day FROM users;
SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day FROM users GROUP BY day;

SELECT
	DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
	COUNT(*) AS total
FROM
	users
GROUP BY
	day
ORDER BY
	total DESC;

-- 7. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT COUNT(*) as stats from (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday),'-',DAYOFMONTH(birthday))) as date from profiles) as stats where date=1;

