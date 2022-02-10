USE WebAksam
SELECT [BolumAd],ID FROM tblBolumler
SELECT AdSoyad, Cinsiyet FROM tblKisiler

SELECT AdSoyad,Cinsiyet
FROM tblKisiler

SELECT AdSoyad, Cinsiyet, BolumID
FROM tblKisiler
WHERE Cinsiyet='E'

SELECT * FROM viwKisiler1

SELECT AdSoyad, BolumAd, Cinsiyet
FROM viwKisiler1
WHERE [BolumAd]= 'Muhasebe'

SELECT * FROM tblKisiler
WHERE Maas<6000 or Maas<=8000