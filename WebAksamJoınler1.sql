--ÝL VE ÝLÇELERÝ ADLARIYLA LÝSTELEME
USE Sirket50
SELECT tblIl.IlAd,tblIlce.IlceAd FROM tblIl INNER JOIN tblIlce ON tblIl.ID=tblIlce.IlID

--personellerin çalýtýklarý departmanlarý listele
--ad    soyad       departman
USE Sirket50
	SELECT tblPersonel.Ad, tblPersonel.Soyad, tblDepartman.DepartmanAd 
	FROM
		tblPersonel JOIN tblDepartman
			ON tblPersonel.DepartmanID=tblDepartman.ID

USE Sirket50
	SELECT tblPersonel.Ad, tblPersonel.Soyad, tblUnvan.UnvanAd
	FROM
		tblPersonel JOIN tblUnvan
		ON tblPersonel.UnvanID=tblUnvan.ID

--personellerin alýtýðý departman ve ünvanlarý listele
--AD SOYAD DEPARTMAN ÜNVAN
USE Sirket50
	SELECT tblPersonel.Ad, tblPersonel.Soyad, tblDepartman.DepartmanAd, tblUnvan.UnvanAd 
	FROM 
	tblPersonel JOIN tblDepartman 
		ON tblPersonel.DepartmanID= tblDepartman.ID JOIN tblUnvan
			ON tblPersonel.UnvanID=tblUnvan.ID
--Projelerin verildiði personelin yaadýðý ilçe ile gösterilmesi
--PROJE ADI    ÝLÇE
USE Sirket50
	SELECT tblProje.ProjeAd, tblIlce.IlceAd FROM
		tblProje INNER JOIN tblGorevlendirme
			ON tblProje.ID=tblGorevlendirme.ProjeID INNER JOIN tblPersonel
				ON tblGorevlendirme.PersonelID=tblPersonel.ID INNER JOIN
					tblIlce ON tblPersonel.IlceID=tblIlce.ID
--Hangi personele, kaç kez görev verilmiþ?
--Personel ad      Görev Sayýsý
USE Sirket50
	SELECT tblPersonel.Ad, COUNT(tblGorevlendirme.ID) AS 'GÖREVLENDÝRME SAYISI'
	FROM
	tblPersonel INNER JOIN tblGorevlendirme
		ON tblPersonel.ID=tblGorevlendirme.PersonelID 
	GROUP BY tblPersonel.Ad
--Hangi projeye kaç personel?
USE Sirket50
	SELECT tblProje.ProjeAd, COUNT(tblGorevlendirme.ID)
	FROM
	tblProje INNER JOIN tblGorevlendirme
		ON tblProje.ID=tblGorevlendirme.ProjeID
		GROUP BY tblProje.ID
--istanbulda yaþayan personel sayýsý
USE Sirket50
	SELECT COUNT(tblPersonel.ID) AS 'PERSONEL SAYISI'
	FROM
	tblPersonel INNER JOIN tblIlce
		ON tblPersonel.IlceID=tblIlce.ID INNER JOIN tblIl
		ON tblIlce.IlID= tblIl.ID
	WHERE tblIl.IlAd='Ýstanbul'
--ÝSTANBULDAKÞ personelemin projelere göre sayýsý
USE Sirket50
	SELECT tblProje.ProjeAd, COUNT(tblProje.ProjeAd) AS 'PERSONEL SAYISI'
		FROM
	tblPersonel INNER JOIN tblIlce
	ON tblPersonel.IlceID=tblIlce.ID INNER JOIN tblIl
	ON tblIlce.IlID=tblIl.ID INNER JOIN tblGorevlendirme
	ON tblPersonel.ID=tblGorevlendirme.ProjeID INNER JOIN tblProje
	ON tblProje.ID=tblPersonel.IlceID
	WHERE tblIl.IlAd='Ýstanbul'
	GROUP BY tblProje.ProjeAd
	--************************* hocanýn yaptýðý
	USE Sirket50
	SELECT tblProje.ProjeAd, COUNT(tblPersonel.ID) AS 'PERSONEL SAYISI'
	FROM
	tblPersonel INNER JOIN tblIlce
		ON tblPersonel.IlceID=tblIlce.ID INNER JOIN tblIl
		ON tblIlce.IlID= tblIl.ID INNER JOIN tblGorevlendirme
		ON tblPersonel.ID=tblGorevlendirme.PersonelID INNER JOIN tblProje
		ON tblGorevlendirme.ProjeID=tblProje.ID
	WHERE tblIl.IlAd='Ýstanbul'
	GROUP BY tblProje.ProjeAd
--cinsiyete göre maaþ toplamlarýný göster
--cinsiyet    toplam
USE Sirket50
SELECT tblPersonel.Cinsiyet, SUM(tblPersonel.Maas) AS 'TOPLAM MAAÞ'
FROM tblPersonel
GROUP BY tblPersonel.Cinsiyet

--Akýllý robot projesindeki personellerin listesi
--PersonelAD SOYAD     ÝL     DEPARTMAN ÜNVAN
USE Sirket50
SELECT tblPersonel.Ad, tblPersonel.Soyad, tblIl.IlAd, tblDepartman.DepartmanAd, tblUnvan.UnvanAd
FROM
tblPersonel INNER JOIN tblIlce
	ON tblPersonel.IlceID=tblIlce.ID INNER JOIN tblIl
	ON tblIlce.IlID=tblIl.ID INNER JOIN tblDepartman
	ON tblPersonel.DepartmanID=tblDepartman.ID INNER JOIN tblUnvan
	ON tblPersonel.UnvanID=tblUnvan.ID INNER JOIN tblGorevlendirme
	ON tblPersonel.ID=tblGorevlendirme.PersonelID INNER JOIN tblProje
	ON tblGorevlendirme.ProjeID=tblProje.ID
	WHERE tblProje.ProjeAd='AKILLI ROBOT'

----akýllý robot projesinde yer alan personelden, ,stanbul ve ankarada yaþayan kadýnlarýn 
----ad soyad yaþadýðý þwhir proje adý
USE Sirket50
SELECT tblPersonel.Ad, tblPersonel.Soyad, tblIl.IlAd, tblProje.ProjeAd
FROM
tblPersonel INNER JOIN tblIlce
	ON tblPersonel.IlceID=tblIlce.ID INNER JOIN tblIl
	ON tblIlce.IlID=tblIl.ID  INNER JOIN tblGorevlendirme
	ON tblPersonel.ID=tblGorevlendirme.PersonelID INNER JOIN tblProje
	ON tblGorevlendirme.ProjeID=tblProje.ID
	WHERE tblProje.ProjeAd='AKILLI ROBOT' AND tblPersonel.Cinsiyet='K' AND 
	(tblIl.IlAd='Ýstanbul' OR tblIl.IlAd='Ankara')
--LEFT JOIN
--JOIN ÝÞLEMÞNDE SOLDAKÝ tablonun tüm kayýtlarýný, Saðdaki tablonun içine 
	
USE Sirket50
SELECT tblIl.IlAd,tblIlce.IlceAd FROM tblIl LEFT JOIN tblIlce ON tblIl.ID=tblIlce.IlID
--hangi projeye ka personel gelmiþ not: personel atamasý yapýlmamýþ projeler de gösterilsin
USE Sirket50
SELECT tblProje.ProjeAd, COUNT(tblGorevlendirme.ProjeID) AS 'PROJE SAYISI'
FROM
tblProje LEFT JOIN tblGorevlendirme
	ON tblProje.ID=tblGorevlendirme.ProjeID
	GROUP BY tblProje.ProjeAd
	--ÝLLERE GÖRE PROJE SAYISI proje-görevlendirme-personel-ilçe-il
USE Sirket50
SELECT tblIl.IlAd, COUNT(tblGorevlendirme.ProjeID) 
FROM
tblProje JOIN tblGorevlendirme
	ON tblProje.ID=tblGorevlendirme.ProjeID JOIN tblPersonel
	ON tblGorevlendirme.PersonelID=tblPersonel.ID INNER JOIN tblIlce
	ON tblPersonel.IlceID=tblIlce.ID RIGHT JOIN tblIl
	ON tblIlce.IlID=tblIl.ID
	GROUP BY tblIl.IlAd