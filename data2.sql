INSERT INTO vybehy (nazev, velikost, popis) VALUES
('pavilon slonů', 5000 , 'Prostor pro slony s vodním bazénem a dostatkem stínu a strukturou pro vnitřní využití.'),
('savana 1', 3000, 'Rozlehlé savanové prostory.'),
('savana 2', 3500 , 'Druhá část savany s větším množstvím stromů a keřů.'),
('savana 3', 3200 , 'Třetí část savany s rozmanitým terénem.'),
('pavilon žiraf', 4000 , 'Prostor pro žirafy s vysokými stromy a krmnými místy a budovou pro chladné dny.'),
('voliéra 1', 1000 , 'Velká voliéra s bidly a úkryty, různé druhy ptáků.'),
('voliéra 2', 1200 , 'Velká voliéra s bidly a úkryty, exotičtí ptáci.'),
('voliéra 3', 1100 , 'Velká voliéra s bidly a úkryty, noční ptáci.'),
('voliéra 4', 1300 , 'Velká voliéra s bidly a úkryty.'),
('výběh tučňáků', 800 , 'Chladné prostředí s velkou vodní plochou.'),
('terárium', 600 , 'Terárium s vodními a suchými plochami.'),
('terárium 2', 650 , 'Druhá část prostoru pro plazy a obojživelníky.'),
('výběh primátů', 2000 , 'Prostor pro různé druhy primátů s lezeckými strukturami.'),
('výběh primátů 2', 2100 , 'Druhá část prostoru pro různé druhy primátů s novými lezeckými strukturami.'),
('safari výběh', 10000 , 'Výběhy simulují přirozené prostředí savany.'),
('vodní živočichové 1', 1500 , 'Prostor pro vodní živočichy s jezírkem a vodopádem.'),
('vodní živočichové 2', 1500 , 'Prostor pro vodní živočichy s velkým jezírkem.'),
('vodní živočichové 3', 1600 , 'Prostor pro vodní živočichy s jezírkem a vodopádem.'),
('vodní živočichové 4', 1550 , 'Prostor pro vodní živočichy s velkým jezírkem, chladné prostředí.'),
('pastviny', 7000 , 'Velké pastviny pro různé druhy pasoucích se zvířat.'),
('akvárium 1', 500 , 'Velké akvárium s tropickými rybami.'),
('akvárium 2', 450 , 'Akvárium s mořskými rybami a korály.'),
('akvárium 3', 600 , 'Akvárium s různými druhy sladkovodních ryb.'),
('akvárium 4', 550 , 'Akvárium s exotickými mořskými živočichy.'),
('akvárium 5', 480 , 'Akvárium s žraloky a rejnoky.'),
('výběh pro tygry', 3000 , 'Prostor pro tygry s hustou vegetací a vodními prvky.'),
('výběh pro levharty', 2500 , 'Prostor pro levharty s množstvím úkrytů a stromů.'),
('výběh pro lvy', 3500 , 'Prostor pro lvy s otevřenými plochami a stínem.'),
('výběh pro pandy', 2000 , 'Prostor pro pandy červené s bambusovými lesy a úkryty.'),
('výběh pro šelmy 1', 2800 , 'Prostor pro různé šelmy s přírodními prvky.'),
('karanténa ptáků', 700 , 'Speciální prostor pro karanténu nových a nemocných ptáků a exotických druhů.'),
('karanténa savců', 1000, 'Karanténní výběh pro nové a nemocné savce, aby se přizpůsobili novému prostředí.'),
('karanténa plazů', 600 , 'Prostor pro karanténu nových a nemocných plazů s vhodnými životními podmínkami.'),
('karanténa ryb', 400, 'Speciální karanténní akvárium pro nové a nemocné ryby s izolovaným systémem vody.'),
('karanténa primátů', 900 , 'Karanténní prostor pro nové a nemocné primáty a malé savce s lezeckými strukturami a úkryty.'),
('výběh pro šelmy 2', 2600 , 'Prostor pro různé šelmy s množstvím úkrytů a vodními prvky.'),
('karanténa ptáků 2', 700 , 'Speciální prostor pro karanténu nových a nemocných ptáků a exotických druhů.'),
('karanténa savců 2', 1000, 'Karanténní výběh pro nové a nemocné savce, aby se přizpůsobili novému prostředí.'),
('karanténa plazů 2', 600, 'Prostor pro karanténu nových a nemocných plazů s vhodnými životními podmínkami.'),
('karanténa ryb 2', 400, 'Speciální karanténní akvárium pro nové a nemocné ryby s izolovaným systémem vody.'),
('karanténa primátů 2', 900, 'Karanténní prostor pro nové a nemocné primáty a malé savce s lezeckými strukturami a úkryty.');


INSERT INTO zvirata (id_dru,jmeno, datum_narozeni,id_poh,id_zam_chov, prichod_do_zoo) VALUES
(1,'Gobi', '1964-05-15', 1, 5, '1993-05-01'),
(1,'Naga', '1975-07-20', 2, 5, '1993-05-01'),
(1,'Adri', '1985-09-25', 2, 5, '1985-09-25'),
(1,'Ellie', '1995-12-05', 2, 5, '2024-05-20'),
(1,'Jumbo', '2005-03-14', 1, 5, '2005-03-14'),
(2,'Twigan', '2010-08-18', 1, 11, '2012-05-25'),
(2,'Raja', '2015-11-11', 2, 11, '2024-06-01'),
(2,'Dumbo', '2024-02-22', 3, 11, '2024-02-22'),
(3,'Babar', '2018-06-19', 1, 28, '2018-06-19'),
(3,'Ganesha', '2002-04-10', 2, 28, '2002-04-10'),
(2,'Leo', '1972-09-30', 2, 11, '1900-06-20'),
(4,'Žofie', '2002-11-30', 2, 7, '2004-08-24'),
(4,'Kai', '2001-07-20', 1, 7, '2004-08-24'),
(4,'Uho', '2024-05-23', 3, 7, '2024-05-23'),
(6, 'Dhoe', '2016-04-26', 2, 6, '2021-05-26'),
(6, 'Bengy', '2020-05-23', 1, 6, '2024-05-23'),
(6, 'Juli', '2023-09-24', 2, 6, '2023-09-24'),
(6, 'Cho', '2023-09-24', 2, 6, '2023-09-24'),
(8, 'Bingo', '2013-03-24', 1, 3, '2022-04-21'),
(8, 'Chui', '2012-12-24', 1, 3, '2022-04-21'),
(11, 'Dgingoo', '1995-04-29', 1, 10, '2002-03-04'),
(11, 'Choui', '1989-01-17', 1, 10, '2002-03-04'),
(11, 'Wii', '1994-10-03', 2, 10, '2002-03-04'),
(13, 'Poo', '2015-08-07', 2, 29, '2018-07-25'),
(13, 'Čia', '2013-04-06', 2, 29, '2018-07-25'),
(16, 'Bimbo', '2001-01-14', 1, 34, '2001-01-14'),
(19, 'Cho', '1978-08-22', 2, 6, '1999-02-17'),
(19, 'Dee', '2006-11-11', 2, 6, '2006-11-11'),
(20, 'Barty', '2021-02-17', 1, 7, '2021-02-17'),
(20, 'Tee', '2024-02-16', 2, 7, '2024-02-16'),
(20, 'Choco', '2022-04-21', 2, 7, '2023-09-24'),
(20, 'Ufi', '2024-05-23', 3, 7, '2024-05-23'),
(20, 'Zetty', '2018-06-22', 1, 13, '2021-07-16'),
(20, 'Betty', '2019-07-30', 2, 13, '2021-07-16'),
(22, 'Marty', '2015-07-14', 1, 13, '2019-03-26'),
(22, 'Gustav', '2014-03-11', 1, 13, '2019-03-26'),
(22, 'Delta', '2021-09-24', 2, 13, '2021-09-24'),
(22, 'Fifi', '2023-01-25', 2, 13, '2023-01-25'),
(22, 'Zee', '2015-04-22', 2, 13, '2019-03-26'),
(25, 'Rvoun', '2011-07-12', 1, 20, '2020-04-05'),
(25, 'Rex', '2010-03-16', 1, 20, '2020-04-05'),
(25, 'Fluffy', '2016-04-17', 2, 20, '2020-04-05'),
(26, 'Iva', '2021-05-23', 2, 18, '2021-11-13'),
(26, 'Mauric', '2003-01-05', 1, 18, '2021-11-13'),
(26, 'Mort', '2022-05-25', 1, 18, '2022-05-25'),
(27, 'Skipper', '2022-05-29', 1, 3, '2022-05-29'),
(27, 'Kowalski', '2021-11-24', 1, 3, '2021-11-24'),
(27, 'Rico', '2021-02-28', 2, 3, '2021-02-28'),
(27, 'Jenny', '2020-03-27', 2, 3, '2020-03-27'),
(27, 'Klie', '2024-05-13', 3, 3, '2024-05-13'),
(27, 'Choii', '2024-05-17', 3, 3, '2024-05-17'),
(27, 'Bojín', '2023-09-24', 1, 3, '2023-09-24'),
(29, 'Nala', '2022-03-21', 2, 4, '2022-03-21'),
(29, 'Simba', '2018-05-27', 1, 4, '2020-07-07'),
(29, 'Bambi', '2019-07-25', 2, 4, '2020-07-07'),
(29, 'Baloo', '2008-01-09', 2, 9, '2008-01-09'),
(31, 'Pumbaa', '2016-10-26', 1, 20, '2018-01-29'),
(31, 'Shere', '2019-07-20', 2, 20, '2020-04-21'),
(32, 'Winnie', '2023-04-16', 2, 20, '2024-02-14'),
(34, 'Trumper', '2000-01-24', 1, 32, '2005-06-11'),
(34, 'Bagheera', '1998-03-27', 2, 32, '2005-06-11'),
(35, 'Tigger', '2018-12-27', 1, 1, '2020-05-21'),
(35, 'Eeyore', '2019-05-23', 2, 1, '2020-05-21'),
(35, 'Lassie', '2024-04-30', 3, 1, '2024-04-30'),
(35, 'Martii', '2024-04-30', 3, 1, '2024-04-30'),
(35, 'Dho', '2024-04-30', 3, 1, '2024-04-30'),
(35, 'Duchess', '2019-03-07', 2, 1, '2019-03-07'),
(35, 'Stuart', '2022-04-09', 1, 1, '2022-04-09'),
(36, 'Remy', '2016-09-10', 1, 23, '2020-05-01'),
(36, 'Dory', '2012-11-03', 2, 23, '2020-05-01'),
(37, 'Nemo', '2018-09-02', 1, 30, '2022-02-02'),
(37, 'Hachiko', '2024-05-20', 3, 30, '2024-05-20'),
(37, 'Marlin', '2023-07-21', 1, 30, '2023-07-21'),
(37, 'Blu', '2021-01-08', 2, 30, '2022-02-02'),
(38, 'Bolt', '2021-05-26', 1, 16, '2021-05-26'),
(41, 'Balto', '2013-05-31', 1, 9, '2020-08-26'),
(41, 'Lady', '2017-02-28', 2, 9, '2017-02-28'),
(43, 'Trump', '2019-07-30', 1, 21, '2020-04-27'),
(43, 'Spirit', '2024-05-16', 3, 21, '2024-05-16'),
(43, 'Destiny', '2024-05-16', 3, 21, '2024-05-16'),
(43, 'Manny', '2024-05-16', 3, 21, '2024-05-16'),
(43, 'Sid', '2024-05-16', 3, 21, '2024-05-16'),
(43, 'Horton', '2024-05-16', 3, 21, '2024-05-16'),
(44, 'Perdita', '1918-04-29', 2, 17, '1918-04-29'),
(48, 'Diego', '1984-10-13', 1, 17, '2013-12-24'),
(48, 'Chára', '1994-05-23', 2, 17, '2013-12-24'),
(50, 'Omega', '2024-05-24', 1, 23, '2024-05-24'),
(50, 'Cilka', '2023-03-25', 2, 23, '2024-01-05'),
(50, 'Ryta', '2023-01-26', 2, 23, '2024-01-05'),
(51, 'Dandee', '1954-10-22', 1, 27, '1963-06-11');


INSERT iNTO zvi_vyb(id_zvi,id_vyb) VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,5),
(13,5),
(14,5),
(12,42),
(13,42),
(14,42),
(15,26),
(16,26),
(17,26),
(18,26),
(19,19),
(20,19),
(21,13),
(22,13),
(23,13),
(24,29),
(25,29),
(26,17),
(27,16),
(28,16),
(29,2),
(30,2),
(31,2),
(32,2),
(33,2),
(34,2),
(35,3),
(36,3),
(37,3),
(38,3),
(39,3),
(40,15),
(41,15),
(42,15),
(43,14),
(44,14),
(45,14),
(46,10),
(47,10),
(48,10),
(49,10),
(50,10),
(51,10),
(52,10),
(53,18),
(54,18),
(55,18),
(56,18),
(57,20),
(58,20),
(59,20),
(60,15),
(61,15),
(62,15),
(63,15),
(64,15),
(65,15),
(66,15),
(67,15),
(68,15),
(69,14),
(70,14),
(71,43),
(72,43),
(73,43),
(74,43),
(75,6),
(76,6),
(77,6),
(78,21),
(79,21),
(80,21),
(81,21),
(82,21),
(83,21),
(84,18),
(85,17),
(86,17),
(87,14),
(88,14),
(89,14),
(90,16);

INSERT INTO zvi_pot (id_zvi,id_pot,mnozstvi) VALUES
(1,12,'120 kg'),
(1,13,'70 kg'),
(1,33,'54 kg'),
(1,17,'25 kg'),
(2,12,'105 kg'),
(2,13,'60 kg'),
(2,33,'35 kg'),
(2,17,'20 kg'),
(3,12,'105 kg'),
(3,13,'60 kg'),
(3,33,'35 kg'),
(3,17,'20 kg'),
(4,12,'105 kg'),
(4,13,'60 kg'),
(4,33,'35 kg'),
(4,17,'20 kg'),
(5,12,'120 kg'),
(5,13,'70 kg'),
(5,33,'54 kg'),
(5,17,'25 kg'),
(6,12,'120 kg'),
(6,13,'70 kg'),
(6,33,'54 kg'),
(6,17,'25 kg'),
(7,12,'105 kg'),
(7,13,'60 kg'),
(7,33,'35 kg'),
(7,17,'20 kg'),
(8,12,'80 kg'),
(8,13,'45 kg'),
(8,33,'20 kg'),
(8,17,'10 kg'),
(9,12,'120 kg'),
(9,13,'70 kg'),
(9,33,'54 kg'),
(9,17,'25 kg'),
(10,12,'105 kg'),
(10,13,'60 kg'),
(10,33,'35 kg'),
(10,17,'20 kg'),
(11,12,'105 kg'),
(11,13,'60 kg'),
(11,33,'35 kg'),
(11,17,'20 kg'),
(12,12,'15 kg'),
(12,13,'10 kg'),
(12,35,'3 kg'),
(12,34,'5 kg'),
(13,12,'12 kg'),
(13,13,'8 kg'),
(13,35,'2 kg'),
(13,34,'3 kg'),
(14,12,'7 kg'),
(14,13,'5 kg'),
(14,35,'1 kg'),
(14,34,'2 kg'),
(15,25,'5 kg'),
(16,25,'6 kg'),
(17,25,'5 kg'),
(18,25,'5 kg'),
(19,19,'5 kg'),
(19,33,'1 kg'),
(19,25,'4 kg'),
(20,19,'5 kg'),
(20,33,'1 kg'),
(20,25,'4 kg'),
(21,33,'1 kg'),
(21,34,'1 kg'),
(21,1,'1 kg'),
(22,33,'1 kg'),
(22,34,'1 kg'),
(22,1,'1 kg'),
(23,33,'1 kg'),
(23,34,'1 kg'),
(23,1,'1 kg'),
(24,36,'2 kg'),
(24,33,'1 kg'),
(25,36,'2 kg'),
(25,33,'1 kg'),
(26,33,'5 kg'),
(26,34,'5 kg'),
(26,31,'15 kg'),
(26,33,'15 kg'),
(27,33,'4 kg'),
(27,34,'3 kg'),
(27,31,'12 kg'),
(27,33,'10 kg'),
(28,33,'3 kg'),
(28,34,'4 kg'),
(28,31,'12 kg'),
(28,33,'10 kg'),
(29,37,'2 kg'),
(29,12,'3 kg'),
(29,13,'3 kg'),
(30,37,'1 kg'),
(30,12,'2 kg'),
(30,13,'2 kg'),
(31,37,'1 kg'),
(31,12,'2 kg'),
(31,13,'2 kg'),
(32,37,'1 kg'),
(32,12,'1 kg'),
(32,13,'2 kg'),
(33,37,'2 kg'),
(33,12,'3 kg'),
(33,13,'3 kg'),
(34,37,'1 kg'),
(34,12,'2 kg'),
(34,13,'2 kg'),
(35,37,'3 kg'),
(35,13,'3 kg'),
(35,18,'2 kg'),
(36,37,'3 kg'),
(36,13,'3 kg'),
(36,18,'2 kg'),
(37,37,'1 kg'),
(37,13,'3 kg'),
(37,18,'2 kg'),
(38,37,'1 kg'),
(38,13,'3 kg'),
(38,18,'2 kg'),
(39,37,'1 kg'),
(39,13,'3 kg'),
(39,18,'2 kg'),
(40,37,'1 kg'),
(40,13,'2 kg'),
(40,12,'2 kg'),
(40,18,'1 kg'),
(41,37,'1 kg'),
(41,13,'2 kg'),
(41,12,'2 kg'),
(41,18,'1 kg'),
(42,37,'1 kg'),
(42,13,'2 kg'),
(42,12,'2 kg'),
(42,18,'1 kg'),
(43,33,'1 kg'),
(43,34,'1 kg'),
(43,1,'1 kg'),
(44,33,'1 kg'),
(44,34,'1 kg'),
(44,1,'1 kg'),
(45,33,'1 kg'),
(45,34,'1 kg'),
(45,1,'1 kg'),
(46,19,'0,6 kg'),
(47,19,'0,6 kg'),
(48,19,'0,6 kg'),
(49,19,'0,6 kg'),
(50,19,'0,4 kg'),
(51,19,'0,4 kg'),
(53,19,'0,6 kg'),
(52,19,'0,6 kg'),
(53,19,'4 kg'),
(54,19,'4 kg'),
(55,19,'4 kg'),
(56,19,'4 kg'),
(57,13,'1 kg'),
(57,33,'0,5 kg'),
(57,18,'1 kg'),
(58,13,'1 kg'),
(58,33,'0,5 kg'),
(58,18,'1 kg'),
(59,13,'1 kg'),
(59,33,'0,5 kg'),
(59,18,'1 kg'),
(60,13,'1 kg'),
(60,33,'1 kg'),
(60,37,'0,05 kg'),
(61,13,'1 kg'),
(61,33,'1 kg'),
(61,37,'0,05 kg'),
(62,40,'0,1 kg'),
(62,33,'0,1 kg'),
(63,40,'0,1 kg'),
(63,33,'0,1 kg'),
(64,40,'0,05 kg'),
(64,33,'0,1 kg'),
(65,40,'0,05 kg'),
(65,33,'0,1 kg'),
(66,40,'0,05 kg'),
(66,33,'0,1 kg'),
(67,40,'0,1 kg'),
(67,33,'0,1 kg'),
(68,40,'0,1 kg'),
(68,33,'0,1 kg'),
(69,33,'0,2 kg'),
(69,34,'0,2 kg'),
(70,33,'0,2 kg'),
(70,34,'0,2 kg'),
(71,39,'0,1 kg'),
(71,33,'0,1 kg'),
(71,12,'0,1 kg'),
(72,39,'0,1 kg'),
(72,33,'0,1 kg'),
(72,12,'0,1 kg'),
(73,39,'0,1 kg'),
(73,33,'0,1 kg'),
(73,12,'0,1 kg'),
(74,39,'0,1 kg'),
(74,33,'0,1 kg'),
(74,12,'0,1 kg'),
(75,27,'0,1 kg'),
(75,32,'0,1 kg'),
(76,27,'0,1 kg'),
(76,32,'0,1 kg'),
(77,27,'0,1 kg'),
(77,32,'0,1 kg'),
(78,19,'0,01 kg'),
(78,38,'0,01 kg'),
(79,19,'0,01 kg'),
(79,38,'0,01 kg'),
(80,19,'0,01 kg'),
(80,38,'0,01 kg'),
(81,19,'0,01 kg'),
(81,38,'0,01 kg'),
(82,19,'0,01 kg'),
(82,38,'0,01 kg'),
(83,19,'0,01 kg'),
(83,38,'0,01 kg'),
(84,33,'1,5 kg'),
(84,34,'1 kg'),
(84,12,'2 kg'),
(85,33,'1 kg'),
(85,34,'0,5 kg'),
(85,12,'1 kg'),
(86,33,'1 kg'),
(86,34,'0,5 kg'),
(86,12,'1 kg'),
(87,32,'0,05 kg'),
(87,33,'0,02 kg'),
(88,32,'0,05 kg'),
(88,33,'0,02 kg'),
(89,32,'0,05 kg'),
(89,33,'0,02 kg'),
(90,19,'2 kg'),
(90,38,'1 kg'),
(90,25,'1 kg');