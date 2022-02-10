USE WebAksam2
CREATE TABLE tblUrunler
(
 ID int IDENTITY(1,1) NOT NULL,
 UrunAd varchar(max) NOT NULL,
 StokMiktari int NOT NULL,
 AlisFiyati decimal(10,2) NOT NULL,
 SatisFiyati decimal(10,2) NOT NULL,
 PRIMARY KEY(ID),

)