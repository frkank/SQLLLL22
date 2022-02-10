USE WebAksam2
--SELECT*FROM viwSatislar
--***********************
--SELECT
--	AdSoyad AS 'AD SOYAD', UrunAd AS 'ÜRÜN AD', SatisFiyati AS 'SATIÞ FÝYATI'
--FROM
--	viwSatislar
----*********************************
--SELECT 
--	AdSoyad AS 'AD SOYAD',
--	UrunAd AS 'ÜRÜN AD',
--	Adet AS 'ADET',
--	SatisFiyati AS 'SATIÞ FÝYATI',
--	--SatisFiyati*0.15 AS 'ÝNDÝRÝM',
--	Adet*SatisFiyati AS 'TUTAR',
--	Tarih AS 'TARÝH'
--FROM
--	viwSatislar
--******************************************
--SELECT AdSoyad, UrunAd, Adet, SatisFiyati, Tarih
--FROM viwSatislar
--WHERE UrunAd='Lenova'
--*****************

--SELECT AdSoyad, UrunAd, Adet, SatisFiyati, Tarih
--FROM viwSatislar
--WHERE UrunAd='Lenova'OR UrunAd='ASUS'
--************************************

--SELECT AdSoyad, UrunAd, Adet, SatisFiyati, Tarih
--FROM viwSatislar
--WHERE UrunAd='Asus' AND Adet>3
--****************************************

--SELECT AdSoyad, UrunAd, Adet, SatisFiyati, Tarih
--FROM viwSatislar
--WHERE AdSoyad = 'SEHER' AND (UrunAd='Asus' OR UrunAd='logitech')
--************************************************
--SELECT DISTINCT UrunAd FROM viwSatislar
--WHERE AdSoyad= 'Ahmet'
--**************************************
--SELECT AdSoyad, UrunAd, Adet, SatisFiyati, Tarih
--FROM viwSatislar
--ORDER BY Adet ASC
--************************

--SELECT AdSoyad, UrunAd, Adet, SatisFiyati, Tarih
--FROM viwSatislar
--WHERE UrunAd='Asus' OR UrunAd='Logitech'
--ORDER BY AdSoyad, Adet
--***********************************

--SELECT COUNT(AdSoyad) AS 'Kayýt Sayýsý' FROM
--viwSatislar
--*************************************************************
--SELECT SUM(Adet) AS 'Satý Adet Toplamý' FROM
--viwSatislar
--********************************************************************
--SELECT AdSoyad, 
--	  SUM(Adet*SatisFiyati) AS 'Satýþ Tutarý',
--	  COUNT(AdSoyad) AS 'Ýþlem Sayýsý'
--FROM viwSatislar
--GROUP BY AdSoyad
--ORDER BY 'Satýþ Tutarý'
--*********************************************************

--SELECT AdSoyad, UrunAd, SUM(Adet*SatisFiyati) AS 'Satýþ Tutarý'
--FROM viwSatislar
--GROUP BY AdSoyad, UrunAd
	--*****************************************************   
--SELECT AdSoyad AS 'AD SOYAD',
--	   UrunAd AS 'ÜRÜN AD',
--	   Adet AS 'ADET',
--	   SatisFiyati AS 'SATIÞ FÝYATI',
--	   AlisFiyati AS 'ALIÞ FÝYATI',
--	   SatisFiyati-AlisFiyati AS 'BÝRÝM KAR',
--	   Adet * (SatisFiyati-AlisFiyati) AS 'KAR',
--	   Tarih AS 'TARÝH'
--FROM 
--	viwSatislar

--****************************************************
SELECT SUM(Adet * (SatisFiyati-AlisFiyati)) AS 'KAR'
FROM viwSatislar
