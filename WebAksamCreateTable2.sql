
USE WebAksam2
CREATE TABLE tblCalisanlar
(
	ID int NOT NULL,
	TCNO char(11) NOT NULL,
	Cinsiyet char(1) NOT NULL,
	Maas int NOT NULL,
	BolumID int NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(BolumID) REFERENCES tblBolumler(ID)
)


