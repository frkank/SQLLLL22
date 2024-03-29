CREATE DATABASE SirketAksam

USE SirketAksam

--Departman tablosu olu�turuluyor.
CREATE TABLE tblDepartman
(
	ID int IDENTITY(1,1) NOT NULL,
	DepartmanAd varchar(max) NOT NULL,
	PRIMARY KEY(ID)
)
--tblDepartman TABLOSUNA veri giri�i yap�l�yor
INSERT INTO tblDepartman
VALUES
	('Kalite'),('Y�netim'),('Arge'),('Teknik')

	--tblDepartman Tablosuun departman ad alan�n�n UNIQUE olmas� gerekiyor.
	--Fakat balang��ta bunu d���nemedik, �imdi yap�yoruz.
ALTER TABLE tblDepartman
ALTER COLUMN DepartmanAd varchar(50)

ALTER TABLE tblDepartman ADD	
	UNIQUE(DepartmanAd)

--�nvanlar tablosu olu�t.

CREATE TABLE tblUnvanlar
(
ID int IDENTITY(1,1) NOT NULL,
UnvanAd varchar(50) UNIQUE NOT NULL,
PRIMARY KEY(ID)
)

--tblUnvanlar tablosuna veri giri�i
INSERT INTO tblUnvanlar
VALUES
	('Muhendis'),('�K Uzman�'),('Teknisyen')

--�ller tablosu oluturuyor.
CREATE TABLE tblIller
(
	ID char(2) NOT NULL,
	IlAd varchar(50) UNIQUE NOT NULL,
	PRIMARY KEY(ID)
)

--tblIller tablosuna veri giri�i yap�l�yor
INSERT INTO tblIller
VALUES
	('06','Ankara'),
	('34','�stanbul'),
	('35','�zmir')

--�l�e taBlosu olu�turuluyor.

CREATE TABLE tblIlceler
(
ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
IlceAd varchar(50) NOT NULL,
IlID char(2) NOT NULL REFERENCES tblIller(ID)
)
--tblIlceler tablosuna veri giri�i
INSERT INTO tblIlceler
VALUES
	('�ankaya','06'),('Yenimahalle','06'),('Sincan','06'),
	('Beylikd�z�','34'),('Bak�rk�y','34'),('Be�ikta�','34'),
	('Kar��yaka','35'),('Konak','35'),('�e�me','35')

--Projeler tablosu olu�t.

CREATE TABLE tblProjeler
(
ID int IDENTITY(1,1) NOT NULL,
ProjeAd varchar(50) UNIQUE NOT NULL,
BaslamaTarihi date NOT NULL,
PlanlananBitisTarihi date NULL,
PRIMARY KEY(ID)
)
--tblProjeler tablosuna veri giri�i

INSERT INTO tblProjeler
VALUES
	('MAV� D�NYA','2022.3.5','2022.11.5'),
	('G�VENL� ALAN','2022.2.19',NULL),
	('MUTLU GEN�L�K','2022.6.1','2023.5.31'),
	('AKILLI ROBOT','2022.1.1',NULL)

	--Personel tablosu olu�t.

CREATE TABLE tblPersonel
(
ID int IDENTITY NOT NULL,
Ad varchar(50) NOT NULL,
Soyad varchar(50) NOT NULL,
Cinsiyet char(1) NOT NULL,
DogumTarihi date NOT NULL,
IlceID int NOT NULL,
IseBaslamaTarihi date NOT NULL,
DepartmanID int NOT NULL,
UnvanID int NOT NULL,
Maas decimal (10,2) NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY(IlceID) REFERENCES tblIlceler(ID),
FOREIGN KEY(DepartmanID) REFERENCES tblDepartman(ID),
FOREIGN KEY(UnvanID) REFERENCES tblUnvanlar(ID)
)

INSERT INTO tblPersonel
VALUES
	('Ahmet','Ekinci','E','1985.4.19','2','2011.10.5',3,2,5000),
	('Burak','Turhan','E','1989.8.12','3','2015.5.18',1,1,4500),
	('Ceyda','Sakarya','K','1990.11.29','4','2010.2.18',4,3,4800),
	('Demet','�OLAK','K','1982.05.05',5,'2005.06.17',4,3,2800),
	('Evrim','�ITAK','K','1987.12.05',1,'2000.01.12',1,2,4500),
	('Figen','ESMER','K','1982.10.22',4,'1998.05.07',3,1,4000),
	('Galip','TANAR','E','1983.02.28',9,'1997.05.07',3,1,5200),
	('Emir','YANIK','E','1975.05.07',2,'2010.07.17',1,1,4500),
	('Ilg�n','ACI','E','1974.05.01',2,'2000.08.18',4,1,4200),
	('�skender','TA�','E','1974.07.02',7,'1995.09.05',2,2,4400),
	('Jale','CAN','K','1976.09.18',5,'1998.10.12',1,1,3250),
	('Kamil','ALBAYRAK','E','1976.08.19',9,'2000.11.25',3,1,5200),
	('Leman','HASKIRI�','K','1978.09.20',6,'1999.10.27',3,1,4200),
	('Meltem','UYSAL','K','1985.08.04',6,'2000.05.27',3,1,2500),
	('Necati','UYSAL','E','1990.12.01',4,'2000.03.06',1,2,2000),
	('Osman','UYSAL','E','1982.02.15',6,'1995.05.12',2,3,4800),
	('�mer','BUZDA�','E','1980.10.30',5,'2001.08.10',3,1,4800),
	('Perihan','KANAT','K','1980.10.28',4,'2001.07.11',2,2,2200),
	('Ramiz','�AKIR','E','1981.11.19',7,'2001.07.30',2,3,2700),
	('Serta�','K�SEDA�','E','1981.12.20',9,'2002.12.20',4,1,2900),
	('�efik','�APANO�LU','E','1982.02.20',6,'1998.05.25',4,3,4800),
	('Taner','BOZOKLU','E','1983.07.21',5,'2005.09.05',3,1,3000),
	('Utku','DUMAN','E','1975.06.13',6,'2005.03.05',3,3,2800),
	('�mit','��R�N','E','1978.04.02',7,'1998.04.04',1,1,3300),
	('Veysel','ERT�Z�N','E','1980.07.03',3,'2002.07.18',2,3,3100),
	('Yakup','G�K�E','E','1975.06.18',2,'2002.03.25',2,3,3100),
	('Zeliha','CAN��','K','1978.03.03',5,'2005.08.13',3,3,2500)

--G�revlendirmeler Tablosu ol�t.
CREATE TABLE tblGorevlendirme
(
ID int IDENTITY(1,1) NOT NULL,
ProjeID int NOT NULL,
PersonelID int NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY(ProjeID) REFERENCES tblProjeler(ID),
FOREIGN KEY(PersonelID) REFERENCES tblPersonel(ID),
CONSTRAINT ProjePersonelTekil UNIQUE(ProjeID,PersonelID)
)

--g�revlendirme tablosu veri giri�i
INSERT INTO tblGorevlendirme
VALUES
(1,3),(1,5),(1,17),(1,22),(1,27),
(2,1),(2,8),(2,17),(2,24),(2,22),
(3,6),(3,9),(3,11),(3,12),(3,19),
(4,2),(4,3),(4,5),(4,17),(4,25)