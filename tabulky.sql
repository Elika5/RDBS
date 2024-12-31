CREATE DATABASE zoo;

CREATE TABLE pohlavi (
id_poh INT PRIMARY KEY auto_increment,
pohlavi VARCHAR(10) NOT NULL
);

CREATE TABLE rody (
id_rod INT PRIMARY KEY auto_increment,
rod VARCHAR(15) not null
);

CREATE TABLE potrava (
id_pot INT PRIMARY KEY auto_increment,
nazev VARCHAR(20) not null
);

CREATE TABLE druhy (
id_dru INT PRIMARY KEY auto_increment,
id_rod INT not null,
druh VARCHAR(20) not NULL,
FOREIGN KEY (id_rod) REFERENCES rody(id_rod)
);

CREATE TABLE vybehy (
id_vyb INT PRIMARY KEY auto_increment,
nazev VARCHAR(20) not null,
velikost int not null,
popis VARCHAR(64) null
);

CREATE TABLE pozice (
id_poz INT PRIMARY KEY auto_increment,
nazev varchar(15) not null,
plat INT not null
);

CREATE TABLE zamestnanci (
id_zam int primary key auto_increment,
jmeno varchar(20) not null,
prijmeni varchar(30) not null,
email varchar(64) not null,
telefon int not null,
datum_narozeni datetime not null,
bankovni_ucet varchar(50),
id_poz int not null,
foreign key (id_poz) references pozice(id_poz)
);

CREATE TABLE zvi_vyb (
id_zvi int not null,
id_vyb int not null,
foreign key(id_zvi) references zvirata(id_zvi),
foreign key(id_vyb) references vybehy(id_vyb)
);

CREATE TABLE zvi_pot (
id_zvi int not null,
id_pot int not null,
mnozstvi varchar(25),
foreign key(id_zvi) references zvirata(id_zvi),
foreign key(id_pot) references potrava(id_pot)
);


CREATE TABLE zvirata (
id_zvi int primary key auto_increment,
id_dru int not null,
jmeno varchar(20) not null,
datum_narozeni datetime not null,
id_poh int not null,
id_zam_chov int not null,
prichod_do_zoo datetime not null,
foreign key(id_dru) references druhy(id_dru),
foreign key(id_poh) references pohlavi(id_poh),
foreign key(id_zam_chov) references zamestnanci(id_zam)
);





