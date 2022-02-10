USE Sirket2
CREATE TABLE tblDepartmanlar
(
ID int IDENTITY(1,1) NOT NULL,
DepartmanAd varchar(50) NOT NULL,
PRIMARY KEY (ID)
)
CREATE TABLE tblUnvanlar
(
ID int IDENTITY(1,1) NOT NULL,
UnvanAd varchar(50) NOT NULL,
PRIMARY KEY (ID)
)
CREATE TABLE tblIller
(
ID int IDENTITY(1,1) NOT NULL,
IlAd varchar(50) NOT NULL,
PRIMARY KEY (ID)
)
CREATE TABLE tblIlceler
(
ID int IDENTITY(1,1) NOT NULL,
IlceAd varchar(50) NOT NULL,
PRIMARY KEY (ID)
)
CREATE TABLE tblProjeler
(
ID int IDENTITY(1,1) NOT NULL,
ProjeAd varchar(50) NOT NULL,
BaslamaTarihi date NOT NULL,
PlanlananBitis date NULL,
PRIMARY KEY (ID)
)
CREATE TABLE tblPersoneller
(
ID int IDENTITY(1,1) NOT NULL,
Ad varchar(50) NOT NULL,
Soyad varchar(50) NOT NULL,
Cinsiyet char(1) NOT NULL,
DogumTarihi date NOT NULL,
IkametgahID int NOT NULL,
IseBaslamaTarihi date NOT NULL,
DepartmaniID int NOT NULL,
UnvaniID int NOT NULL,
Maasi decimal(7,2) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (IkametgahID) REFERENCES tblIlceler(ID),
FOREIGN KEY (DepartmaniID) REFERENCES tblDepartmanlar(ID),
FOREIGN KEY (UnvaniID) REFERENCES tblUnvanlar(ID)
)
CREATE TABLE tblGorevlendirme
(
ID int IDENTITY(1,1) NOT NULL,
ProjeID int NOT NULL,
PersonelID int NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ProjeID) REFERENCES tblProjeler(ID),
FOREIGN KEY (PersonelID) REFERENCES tblPersoneller(ID)
)


