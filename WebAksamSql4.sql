USE WebAksam2
CREATE TABLE tblSatislar
(
	ID int IDENTITY(1,1) NOT NULL,
	UrunID int NOT NULL,
	CalisanID int NOT NULL,
	Adet int NOT NULL,
	Tarih date NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(UrunID) REFERENCES tblUrunler(ID),
	FOREIGN KEY(CalisanID) REFERENCES tblCalisanlar(ID)
)