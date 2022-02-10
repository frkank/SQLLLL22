--�L VE �L�ELER� ADLARIYLA L�STELEME
USE Sirket50
SELECT tblIl.IlAd,tblIlce.IlceAd FROM tblIl INNER JOIN tblIlce ON tblIl.ID=tblIlce.IlID

--personellerin �al�t�klar� departmanlar� listele
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

--personellerin al�t��� departman ve �nvanlar� listele
--AD SOYAD DEPARTMAN �NVAN
USE Sirket50
	SELECT tblPersonel.Ad, tblPersonel.Soyad, tblDepartman.DepartmanAd, tblUnvan.UnvanAd 
	FROM 
	tblPersonel JOIN tblDepartman 
		ON tblPersonel.DepartmanID= tblDepartman.ID JOIN tblUnvan
			ON tblPersonel.UnvanID=tblUnvan.ID
--Projelerin verildi�i personelin yaad��� il�e ile g�sterilmesi
--PROJE ADI    �L�E
USE Sirket50
	SELECT tblProje.ProjeAd, tblIlce.IlceAd FROM
		tblProje INNER JOIN tblGorevlendirme
			ON tblProje.ID=tblGorevlendirme.ProjeID INNER JOIN tblPersonel
				ON tblGorevlendirme.PersonelID=tblPersonel.ID INNER JOIN
					tblIlce ON tblPersonel.IlceID=tblIlce.ID
--Hangi personele, ka� kez g�rev verilmi�?
--Personel ad      G�rev Say�s�
USE Sirket50
	SELECT tblPersonel.Ad, COUNT(tblGorevlendirme.ID) AS 'G�REVLEND�RME SAYISI'
	FROM
	tblPersonel INNER JOIN tblGorevlendirme
		ON tblPersonel.ID=tblGorevlendirme.PersonelID 
	GROUP BY tblPersonel.Ad
--Hangi projeye ka� personel?
USE Sirket50
	SELECT tblProje.ProjeAd, COUNT(tblGorevlendirme.ID)
	FROM
	tblProje INNER JOIN tblGorevlendirme
		ON tblProje.ID=tblGorevlendirme.ProjeID
		GROUP BY tblProje.ID
--istanbulda ya�ayan personel say�s�
USE Sirket50
	SELECT COUNT(tblPersonel.ID) AS 'PERSONEL SAYISI'
	FROM
	tblPersonel INNER JOIN tblIlce
		ON tblPersonel.IlceID=tblIlce.ID INNER JOIN tblIl
		ON tblIlce.IlID= tblIl.ID
	WHERE tblIl.IlAd='�stanbul'
--�STANBULDAK� personelemin projelere g�re say�s�
USE Sirket50
	SELECT tblProje.ProjeAd, COUNT(tblProje.ProjeAd) AS 'PERSONEL SAYISI'
		FROM
	tblPersonel INNER JOIN tblIlce
	ON tblPersonel.IlceID=tblIlce.ID INNER JOIN tblIl
	ON tblIlce.IlID=tblIl.ID INNER JOIN tblGorevlendirme
	ON tblPersonel.ID=tblGorevlendirme.ProjeID INNER JOIN tblProje
	ON tblProje.ID=tblPersonel.IlceID
	WHERE tblIl.IlAd='�stanbul'
	GROUP BY tblProje.ProjeAd
	--************************* hocan�n yapt���
	USE Sirket50
	SELECT tblProje.ProjeAd, COUNT(tblPersonel.ID) AS 'PERSONEL SAYISI'
	FROM
	tblPersonel INNER JOIN tblIlce
		ON tblPersonel.IlceID=tblIlce.ID INNER JOIN tblIl
		ON tblIlce.IlID= tblIl.ID INNER JOIN tblGorevlendirme
		ON tblPersonel.ID=tblGorevlendirme.PersonelID INNER JOIN tblProje
		ON tblGorevlendirme.ProjeID=tblProje.ID
	WHERE tblIl.IlAd='�stanbul'
	GROUP BY tblProje.ProjeAd
--cinsiyete g�re maa� toplamlar�n� g�ster
--cinsiyet    toplam
USE Sirket50
SELECT tblPersonel.Cinsiyet, SUM(tblPersonel.Maas) AS 'TOPLAM MAA�'
FROM tblPersonel
GROUP BY tblPersonel.Cinsiyet

--Ak�ll� robot projesindeki personellerin listesi
--PersonelAD SOYAD     �L     DEPARTMAN �NVAN
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

----ak�ll� robot projesinde yer alan personelden, ,stanbul ve ankarada ya�ayan kad�nlar�n 
----ad soyad ya�ad��� �whir proje ad�
USE Sirket50
SELECT tblPersonel.Ad, tblPersonel.Soyad, tblIl.IlAd, tblProje.ProjeAd
FROM
tblPersonel INNER JOIN tblIlce
	ON tblPersonel.IlceID=tblIlce.ID INNER JOIN tblIl
	ON tblIlce.IlID=tblIl.ID  INNER JOIN tblGorevlendirme
	ON tblPersonel.ID=tblGorevlendirme.PersonelID INNER JOIN tblProje
	ON tblGorevlendirme.ProjeID=tblProje.ID
	WHERE tblProje.ProjeAd='AKILLI ROBOT' AND tblPersonel.Cinsiyet='K' AND 
	(tblIl.IlAd='�stanbul' OR tblIl.IlAd='Ankara')
--LEFT JOIN
--JOIN ��LEM�NDE SOLDAK� tablonun t�m kay�tlar�n�, Sa�daki tablonun i�ine 
	
USE Sirket50
SELECT tblIl.IlAd,tblIlce.IlceAd FROM tblIl LEFT JOIN tblIlce ON tblIl.ID=tblIlce.IlID
--hangi projeye ka personel gelmi� not: personel atamas� yap�lmam�� projeler de g�sterilsin
USE Sirket50
SELECT tblProje.ProjeAd, COUNT(tblGorevlendirme.ProjeID) AS 'PROJE SAYISI'
FROM
tblProje LEFT JOIN tblGorevlendirme
	ON tblProje.ID=tblGorevlendirme.ProjeID
	GROUP BY tblProje.ProjeAd
	--�LLERE G�RE PROJE SAYISI proje-g�revlendirme-personel-il�e-il
USE Sirket50
SELECT tblIl.IlAd, COUNT(tblGorevlendirme.ProjeID) 
FROM
tblProje JOIN tblGorevlendirme
	ON tblProje.ID=tblGorevlendirme.ProjeID JOIN tblPersonel
	ON tblGorevlendirme.PersonelID=tblPersonel.ID INNER JOIN tblIlce
	ON tblPersonel.IlceID=tblIlce.ID RIGHT JOIN tblIl
	ON tblIlce.IlID=tblIl.ID
	GROUP BY tblIl.IlAd