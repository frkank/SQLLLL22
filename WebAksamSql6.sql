USE WebAksam2
--SELECT*FROM viwSatislar
--***********************
--SELECT
--	AdSoyad AS 'AD SOYAD', UrunAd AS '�R�N AD', SatisFiyati AS 'SATI� F�YATI'
--FROM
--	viwSatislar
----*********************************
--SELECT 
--	AdSoyad AS 'AD SOYAD',
--	UrunAd AS '�R�N AD',
--	Adet AS 'ADET',
--	SatisFiyati AS 'SATI� F�YATI',
--	--SatisFiyati*0.15 AS '�ND�R�M',
--	Adet*SatisFiyati AS 'TUTAR',
--	Tarih AS 'TAR�H'
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

--SELECT COUNT(AdSoyad) AS 'Kay�t Say�s�' FROM
--viwSatislar
--*************************************************************
--SELECT SUM(Adet) AS 'Sat� Adet Toplam�' FROM
--viwSatislar
--********************************************************************
--SELECT AdSoyad, 
--	  SUM(Adet*SatisFiyati) AS 'Sat�� Tutar�',
--	  COUNT(AdSoyad) AS '��lem Say�s�'
--FROM viwSatislar
--GROUP BY AdSoyad
--ORDER BY 'Sat�� Tutar�'
--*********************************************************

--SELECT AdSoyad, UrunAd, SUM(Adet*SatisFiyati) AS 'Sat�� Tutar�'
--FROM viwSatislar
--GROUP BY AdSoyad, UrunAd
	--*****************************************************   
--SELECT AdSoyad AS 'AD SOYAD',
--	   UrunAd AS '�R�N AD',
--	   Adet AS 'ADET',
--	   SatisFiyati AS 'SATI� F�YATI',
--	   AlisFiyati AS 'ALI� F�YATI',
--	   SatisFiyati-AlisFiyati AS 'B�R�M KAR',
--	   Adet * (SatisFiyati-AlisFiyati) AS 'KAR',
--	   Tarih AS 'TAR�H'
--FROM 
--	viwSatislar

--****************************************************
SELECT SUM(Adet * (SatisFiyati-AlisFiyati)) AS 'KAR'
FROM viwSatislar
