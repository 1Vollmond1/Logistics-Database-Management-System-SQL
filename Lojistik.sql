create database lojistik;
go 
use lojistik;
go
create table Tedarikçi(Tedarikçi_ID int, T_Adres nvarchar(300), T_telefon nvarchar(11), T_eposta nvarchar(50), Firma_Adý nvarchar(50), PRIMARY key(Tedarikçi_ID));
create table Araç(Plaka nvarchar(10), A_durumu nvarchar(20), A_Tipi nvarchar(30), A_Kapasite int, PRIMARY key (Plaka));
create table Depo(Depo_Tipi nvarchar(30), Kapasite int, Depo_ID int, D_Adres nvarchar(300), PRIMARY key(Depo_ID));
create table Müsteri(M_Ýsmi nvarchar(50) not null, Müþteri_ID int, M_Adres nvarchar(300),M_Telefon nvarchar(11), M_eposta nvarchar(50),  PRIMARY key(Müþteri_ID))
create table Ürün(Ürün_ID int, kategori nvarchar(50), Ürün_adý nvarchar(30), Birim_fiyat float, PRIMARY key (Ürün_ID));
create table Sipariþ(Sipariþ_ID int,Müþteri_ID int, sipariþ_T date,teslim_T date , sipariþ_durumu nvarchar(20), FOREIGN key (Müþteri_ID) REFERENCES Müsteri(Müþteri_ID), PRIMARY key(Sipariþ_ID));
create table Sipariþ_Detayý (Sipariþ_ID int, Ürün_ID int, Miktar int, FOREIGN key (Sipariþ_ID) REFERENCES Sipariþ(Sipariþ_ID), FOREIGN key (Ürün_ID) REFERENCES Ürün(Ürün_ID));
create table Stok(Stok_ID int, Depo_ID int, Ürün_ID int, Tedarikçi_ID int, Raf_NO nvarchar(20), Stok_Adý nvarchar(50), Miktar int,Güncelleme_T DATE,FOREIGN key(Depo_ID) REFERENCES Depo(Depo_ID), FOREIGN key(Ürün_ID) REFERENCES Ürün(Ürün_ID), FOREIGN key(Tedarikçi_ID) REFERENCES Tedarikçi(Tedarikçi_ID),  PRIMARY key (Stok_ID));
create table Personel(Personel_ID int,Depo_ID int, Plaka nvarchar(10), Görev nvarchar(30), P_Telefon nvarchar(11), P_Ýsmi nvarchar(50),FOREIGN key (Depo_ID) REFERENCES Depo(Depo_ID), FOREIGN key(Plaka) REFERENCES Araç(Plaka), PRIMARY key (Personel_ID));
create table Taþýma (Plaka nvarchar(10), Sipariþ_ID int, FOREIGN key (Plaka) REFERENCES Araç(Plaka),FOREIGN key (Sipariþ_ID) REFERENCES Sipariþ(Sipariþ_ID));
INSERT INTO Araç 
VALUES ('06 AK 1983', 'Bakýmda', 'Týr', 1800);

INSERT INTO Araç 
VALUES ('06 TRT 456', 'Yolda', 'Kamyon', 1500);

INSERT INTO Araç 
VALUES ('07 HF 3310', 'Yolda', 'Kamyon', 1200);

INSERT INTO Araç 
VALUES ('16 BR 907', 'Müsait', 'Týr', 2200);

INSERT INTO Araç 
VALUES ('27 ZK 584', 'Müsait', 'Týr', 2100);

INSERT INTO Araç 
VALUES ('34 ABC 123', 'Müsait', 'Týr', 2000);

INSERT INTO Araç 
VALUES ('35 EGE 789', 'Bakýmda', 'Kamyonet', 800);

INSERT INTO Araç 
VALUES ('35 MZ 4521', 'Bakýmda', 'Kamyon', 1250);

INSERT INTO Araç 
VALUES ('38 KA 611', 'Yolda', 'Kamyonet', 700);

INSERT INTO Araç 
VALUES ('61 TR 2024', 'Müsait', 'Kamyonet', 850);
INSERT INTO Müsteri
VALUES ('Ahmet Yýlmaz', 1, 'Ýstanbul / Kadýköy, Hasanpaþa Mah. Rýhtým Cad. No:45', '05301112233', 'ahmetyilmaz@mail.com');

INSERT INTO Müsteri
VALUES ('Ayþe Demir', 2, 'Ýzmir / Bornova, Kazýmdirik Mah. 156 Sok. No:12', '05307778899', 'aysedemir@mail.com');

INSERT INTO Müsteri
VALUES ('Mehmet Karaca', 3, 'Ankara / Çankaya, Kýzýlay Mah. Atatürk Bulvarý No:87', '05304445566', 'mehmetkaraca@mail.com');

INSERT INTO Müsteri
VALUES ('Emre Polat', 4, 'Ankara / Sincan, Malazgirt Mah. 27. Sokak No:19', '05389990011', 'emrepolat@mail.com');

INSERT INTO Müsteri
VALUES ('Derya Aksoy', 5, 'Ýstanbul / Kartal, Atalar Mah. Þehit Ahmet Akyol Sok. No:7', '05390001122', 'deryaaksoy@mail.com');

INSERT INTO Müsteri
VALUES ('Elif Aydýn', 6, 'Ýstanbul / Maltepe, Cevizli Mah. Baðdat Cad. No:210', '05334445566', 'elifaydin@mail.com');

INSERT INTO Müsteri
VALUES ('Burak Þahin', 7, 'Ankara / Keçiören, Etlik Mah. General Doktor Tevfik Saðlam Cad. No:34', '05345556677', 'buraksahin@mail.com');

INSERT INTO Müsteri
VALUES ('Zeynep Koç', 8, 'Ýstanbul / Beylikdüzü, Adnan Kahveci Mah. Yavuz Sultan Selim Blv. No:78', '05356667788', 'zeynepkoc@mail.com');

INSERT INTO Müsteri
VALUES ('Emre Yýldýz', 9, 'Ankara / Etimesgut, Eryaman Mah. 2. Etap 45. Sok. No:19', '05367778899', 'emreyildiz@mail.com');

INSERT INTO Müsteri
VALUES ('Fatma Çelik', 10, 'Ýstanbul / Kartal, Yakacýk Yeni Mah. Samandýra Cad. No:61', '05378889900', 'fatmacelik@mail.com');

INSERT INTO Depo
VALUES ('Merkez Depo', 18000, 1, 'Ýstanbul / Tuzla, Organize Sanayi Bölgesi, Depo Cad. No:120');

INSERT INTO Depo
VALUES ('Merkez Depo', 20000, 2, 'Kayseri / Melikgazi, Hunat Mah. Lojistik Sok. No:45');

INSERT INTO Depo
VALUES ('Bölge Deposu', 9000, 3, 'Ankara / Sincan, Yenikent Mah. Lojistik Sok. No:36');

INSERT INTO Depo
VALUES ('Bölge Deposu', 7000, 4, 'Ýzmir / Karþýyaka, Bostanlý Mah. Lojistik Sok. No:18');

INSERT INTO Depo
VALUES ('Bölge Deposu', 6500, 5, 'Bursa / Nilüfer, Görükle Dumlupýnar Mah. Lojistik Sok. No:8');

INSERT INTO Depo
VALUES ('Bölge Deposu', 7200, 6, 'Antalta / Muratpaþa, Fener Mah. Lojistik Sok. No:78');

INSERT INTO Depo
VALUES ('Bölge Deposu', 8000, 7, 'Samsun / Atakum, Mimar Sinan Mah. Lojistik Sok. No:55');

INSERT INTO Depo
VALUES ('Bölge Deposu', 8600, 8, 'Konya / Selçuklu, Yazýr Mah. Lojistik Sok. No:21');

INSERT INTO Depo
VALUES ('Bölge Deposu', 9000, 9, 'Gaziantep / Þehitkamil, Ýbrahimli Mah. Lojistik Sok. No:17');

INSERT INTO Depo
VALUES ('Bölge Deposu', 7800, 10, 'Trabzon / Ortahisar, Boztepe Mah. Lojistik Sok. No:3');

INSERT INTO Personel
VALUES (1, NULL, '34 ABC 123', 'Þoför', '05411112233', 'Mehmet Yýlmaz');

INSERT INTO Personel
VALUES (2, NULL, '06 TRT 456', 'Þoför', '05412223344', 'Ahmet Kaya');

INSERT INTO Personel
VALUES (3, NULL, '35 EGE 789', 'Þoför', '05324187694', 'Evliya Çelebi');

INSERT INTO Personel
VALUES (4, NULL, '06 AK 1983', 'Þoför', '05416244556', 'Testo Taylan');

INSERT INTO Personel
VALUES (5, NULL, '16 BR 907', 'Þoför', '05419023318', 'Zeynep Büyükarslan');

INSERT INTO Personel
VALUES (6, NULL, '07 HF 3310', 'Þoför', '05536714052', 'Gizem Ünlü');

INSERT INTO Personel
VALUES (7, NULL, '38 KA 611', 'Þoför', '05362849107', 'Muhsin Dündar');

INSERT INTO Personel
VALUES (8, NULL, '61 TR 2024', 'Þoför', '05491156839', 'Mehmet Keskin');

INSERT INTO Personel
VALUES (9, NULL, '27 ZK 584', 'Þoför', '05558032264', 'Mustafa Topaloðlu');

INSERT INTO Personel
VALUES (10, NULL, '35 MZ 4521', 'Þoför', '05304975681', 'Ömer Yiðit');

INSERT INTO Personel
VALUES (11, 1, NULL, 'Depo Memuru', '05413334455', 'Ali Demir');

INSERT INTO Personel
VALUES (12, 2, NULL, 'Depo Memuru', '05411134556', 'Ziya Koper');

INSERT INTO Personel
VALUES (13, 3, NULL, 'Depo Memuru', '05447620945', 'Serkan Aydýn');

INSERT INTO Personel
VALUES (14, 4, NULL, 'Depo Memuru', '05381348820', 'Zeynep Þahin');

INSERT INTO Personel
VALUES (15, 5, NULL, 'Depo Memuru', '05429513706', 'Cansu Polat');

INSERT INTO Personel
VALUES (16, 6, NULL, 'Depo Memuru', '05514206593', 'Polat Alemdar');

INSERT INTO Personel
VALUES (17, 7, NULL, 'Depo Memuru', '05376891472', 'Merve Yýldýz');

INSERT INTO Personel
VALUES (18, 8, NULL, 'Depo Memuru', '05463089751', 'Burak Çetin');

INSERT INTO Personel
VALUES (19, 9, NULL, 'Depo Memuru', '05541768240', 'Emre Demir');

INSERT INTO Personel
VALUES (20, 10, NULL, 'Depo Memuru', '05359402168', 'Elif Kaya');

INSERT INTO Sipariþ
VALUES (1, 1, '2025-12-05', NULL, 'Hazýrlanýyor');

INSERT INTO Sipariþ
VALUES (2, 2, '2025-12-06', '2026-01-02', 'Teslim');

INSERT INTO Sipariþ
VALUES (3, 3, '2025-12-07', '2026-01-02', 'Teslim');

INSERT INTO Sipariþ
VALUES (4, 4, '2025-12-08', NULL, 'iptal');

INSERT INTO Sipariþ
VALUES (5, 5, '2025-12-08', NULL, 'Hazýrlanýyor');

INSERT INTO Sipariþ
VALUES (6, 6, '2025-12-09', NULL, 'Yolda');

INSERT INTO Sipariþ
VALUES (7, 7, '2025-12-09', NULL, 'Yolda');

INSERT INTO Sipariþ
VALUES (8, 8, '2025-12-10', '2026-01-02', 'Teslim');

INSERT INTO Sipariþ
VALUES (9, 9, '2025-12-10', NULL, 'Hazýrlanýyor');

INSERT INTO Sipariþ
VALUES (10, 10, '2025-12-11', NULL, 'Yolda');

INSERT INTO Ürün
VALUES (1, 'Elektronik', 'Laptop', 25000);

INSERT INTO Ürün
VALUES (2, 'Elektronik', 'Kulaklýk', 1500);

INSERT INTO Ürün
VALUES (3, 'Gýda', 'Makarna', 12);

INSERT INTO Ürün
VALUES (4, 'Gýda', 'Konserve Tavuk', 45);

INSERT INTO Ürün
VALUES (5, 'Temizlik', 'Çamaþýr Deterjaný', 180);

INSERT INTO Ürün
VALUES (6, 'Temizlik', 'Bulaþýk Deterjaný', 95);

INSERT INTO Ürün
VALUES (7, 'Mobilya', 'Ofis Sandalyesi', 2450);

INSERT INTO Ürün
VALUES (8, 'Mobilya', 'Çalýþma Masasý', 5200);

INSERT INTO Ürün
VALUES (9, 'Giyim', 'Deri Ceket', 800);

INSERT INTO Ürün
VALUES (10, 'Giyim', 'Kumaþ Pantolon ', 750);

INSERT INTO Sipariþ_Detayý
VALUES (1, 1, 5);

INSERT INTO Sipariþ_Detayý
VALUES (1, 2, 20);

INSERT INTO Sipariþ_Detayý
VALUES (2, 3, 300);

INSERT INTO Sipariþ_Detayý
VALUES (3, 4, 150);

INSERT INTO Sipariþ_Detayý
VALUES (3, 2, 50);

INSERT INTO Sipariþ_Detayý
VALUES (4, 3, 150);

INSERT INTO Sipariþ_Detayý
VALUES (4, 4, 200);

INSERT INTO Sipariþ_Detayý
VALUES (5, 3, 300);

INSERT INTO Sipariþ_Detayý
VALUES (5, 4, 250);

INSERT INTO Sipariþ_Detayý
VALUES (6, 5, 50);

INSERT INTO Sipariþ_Detayý
VALUES (6, 6, 60);

INSERT INTO Sipariþ_Detayý
VALUES (7, 5, 100);

INSERT INTO Sipariþ_Detayý
VALUES (7, 6, 80);

INSERT INTO Sipariþ_Detayý
VALUES (8, 8, 20);

INSERT INTO Sipariþ_Detayý
VALUES (8, 7, 20);

INSERT INTO Sipariþ_Detayý
VALUES (9, 5, 100);

INSERT INTO Sipariþ_Detayý
VALUES (10, 2, 10);

INSERT INTO Sipariþ_Detayý
VALUES (10, 2, 50);

INSERT INTO Taþýma
VALUES ('34 ABC 123', 1);

INSERT INTO Taþýma
VALUES ('06 TRT 456', 2);

INSERT INTO Taþýma
VALUES ('35 EGE 789', 3);

INSERT INTO Taþýma
VALUES ('06 AK 1983', 4);

INSERT INTO Taþýma
VALUES ('35 MZ 4521', 5);

INSERT INTO Taþýma
VALUES ('16 BR 907', 6);

INSERT INTO Taþýma
VALUES ('07 HF 3310', 7);

INSERT INTO Taþýma
VALUES ('38 KA 611', 8);

INSERT INTO Taþýma
VALUES ('61 TR 2024', 9);

INSERT INTO Taþýma
VALUES ('27 ZK 584', 10);

INSERT INTO Tedarikçi
VALUES (1, 'Ýstanbul / Pendik, Batý Mah. Ankara Cad. No:63 D:2', '02122223344', 'ted1@mail.com', 'Teknoloji AÞ');

INSERT INTO Tedarikçi
VALUES (2, 'Ankara / Altýndað / Karapürçek Mah. 454. Cad. No:12 D:3', '03125556677', 'ted2@mail.com', 'Dijitalleþme Ltd');

INSERT INTO Tedarikçi
VALUES (3, 'Ýstanbul / Pendik / Kaynarca Mah. E-5 Yan Yol No:112', '02164889977', 'ted3@mail.com', 'Besinsel AÞ');

INSERT INTO Tedarikçi
VALUES (4, 'Ankara / Siteler / Mobilyacýlar Sanayi Sitesi 12. Cad. No:45', '03123445566', 'ted4@mail.com', 'Gýdasal Ltd');

INSERT INTO Tedarikçi
VALUES (5, 'Ýzmir / Karþýyaka / Alaybey Mah. Cemal Gürsel Cad. No:102 D:5', '05405597304', 'ted5@mail.com', 'Temiþ iþ Ltd');

INSERT INTO Tedarikçi
VALUES (6, 'Antalya / Muratpaþa / Lara Mah. Çaðlayan Sok. No:27', '05508124936', 'ted6@mail.com', 'Hijyenik AÞ');

INSERT INTO Tedarikçi
VALUES (7, 'Bursa / Nilüfer / Özlüce Mah. 19 Mayýs Cad. No:66 D:8', '05332679015', 'ted7@mail.com', 'Genç Oda Ltd');

INSERT INTO Tedarikçi
VALUES (8, 'Kayseri / Melikgazi / Alpaslan Mah. Sivas Bulvarý No:210', '05476945827', 'ted8@mail.com', 'Mobilya AÞ');

INSERT INTO Tedarikçi
VALUES (9, 'Samsun / Atakum / Denizevleri Mah. Adnan Menderes Bulv. No:89', '05523810699', 'ted9@mail.com', 'Moda Tasarým Ltd');

INSERT INTO Tedarikçi
VALUES (10, 'Konya / Selçuklu / Yazýr Mah. Beyþehir Cad. No:134 D:3', '05437891246', 'ted10@mail.com', 'Stilist Ltd');

INSERT INTO Stok 
	VALUES (1, 1, 1, 1, 'A1', 'Laptop Stok', 170, '2025-12-01');
INSERT INTO Stok 
	VALUES (2, 2, 1, 1, 'B1', 'Laptop Stok', 600, '2025-12-01');
INSERT INTO Stok 
	VALUES (3, 3, 1, 1, 'C1', 'Laptop Stok', 340, '2025-12-01');
INSERT INTO Stok 
	VALUES (4, 4, 1, 1, 'D1', 'Laptop Stok', 340, '2025-12-01');
INSERT INTO Stok 
	VALUES (5, 5, 1, 1, 'E1', 'Laptop Stok', 335, '2025-12-01');
INSERT INTO Stok 
	VALUES (6, 6, 1, 1, 'F1', 'Laptop Stok', 600, '2025-12-01');
INSERT INTO Stok 
	VALUES (7, 7, 1, 1, 'G1', 'Laptop Stok', 600, '2025-12-01');
INSERT INTO Stok 
	VALUES (8, 8, 1, 1, 'H1', 'Laptop Stok', 600, '2025-12-01');
INSERT INTO Stok 
	VALUES (9, 9, 1, 1, 'I1', 'Laptop Stok', 600, '2025-12-01');
INSERT INTO Stok 
	VALUES (10, 10, 1, 1, 'J1', 'Laptop Stok', 340, '2025-12-01');

INSERT INTO Stok VALUES (11, 1, 2, 2, 'A2', 'Kulaklýk Stok', 500, '2025-12-01');
INSERT INTO Stok VALUES (12, 2, 2, 2, 'B2', 'Kulaklýk Stok', 500, '2025-12-01');
INSERT INTO Stok VALUES (13, 3, 2, 2, 'C2', 'Kulaklýk Stok', 500, '2025-12-01');
INSERT INTO Stok VALUES (14, 4, 2, 2, 'D2', 'Kulaklýk Stok', 500, '2025-12-01');
INSERT INTO Stok VALUES (15, 5, 2, 2, 'E2', 'Kulaklýk Stok', 500, '2025-12-01');
INSERT INTO Stok VALUES (16, 6, 2, 2, 'F2', 'Kulaklýk Stok', 500, '2025-12-01');
INSERT INTO Stok VALUES (17, 7, 2, 2, 'G2', 'Kulaklýk Stok', 500, '2025-12-01');
INSERT INTO Stok VALUES (18, 8, 2, 2, 'H2', 'Kulaklýk Stok', 500, '2025-12-01');
INSERT INTO Stok VALUES (19, 9, 2, 2, 'I2', 'Kulaklýk Stok', 500, '2025-12-01');
INSERT INTO Stok VALUES (20, 10, 2, 2, 'J2', 'Kulaklýk Stok', 500, '2025-12-01');

INSERT INTO Stok VALUES (21, 1, 3, 3, 'A3', 'Makarna Stok', 950, '2025-12-01');
INSERT INTO Stok VALUES (22, 2, 3, 3, 'B3', 'Makarna Stok', 950, '2025-12-01');
INSERT INTO Stok VALUES (23, 3, 3, 3, 'C3', 'Makarna Stok', 950, '2025-12-01');
INSERT INTO Stok VALUES (24, 4, 3, 3, 'D3', 'Makarna Stok', 950, '2025-12-01');
INSERT INTO Stok VALUES (25, 5, 3, 3, 'E3', 'Makarna Stok', 950, '2025-12-01');
INSERT INTO Stok VALUES (26, 6, 3, 3, 'F3', 'Makarna Stok', 950, '2025-12-01');
INSERT INTO Stok VALUES (27, 7, 3, 3, 'G3', 'Makarna Stok', 950, '2025-12-01');
INSERT INTO Stok VALUES (28, 8, 3, 3, 'H3', 'Makarna Stok', 950, '2025-12-01');
INSERT INTO Stok VALUES (29, 9, 3, 3, 'I3', 'Makarna Stok', 950, '2025-12-01');
INSERT INTO Stok VALUES (30, 10, 3, 3, 'J3', 'Makarna Stok', 950, '2025-12-01');

INSERT INTO Stok VALUES (31, 1, 4, 4, 'A4', 'Konserve Tavuk Stok', 800, '2025-12-01');
INSERT INTO Stok VALUES (32, 2, 4, 4, 'B4', 'Konserve Tavuk Stok', 800, '2025-12-01');
INSERT INTO Stok VALUES (33, 3, 4, 4, 'C4', 'Konserve Tavuk Stok', 800, '2025-12-01');
INSERT INTO Stok VALUES (34, 4, 4, 4, 'D4', 'Konserve Tavuk Stok', 800, '2025-12-01');
INSERT INTO Stok VALUES (35, 5, 4, 4, 'E4', 'Konserve Tavuk Stok', 800, '2025-12-01');
INSERT INTO Stok VALUES (36, 6, 4, 4, 'F4', 'Konserve Tavuk Stok', 800, '2025-12-01');
INSERT INTO Stok VALUES (37, 7, 4, 4, 'G4', 'Konserve Tavuk Stok', 800, '2025-12-01');
INSERT INTO Stok VALUES (38, 8, 4, 4, 'H4', 'Konserve Tavuk Stok', 800, '2025-12-01');
INSERT INTO Stok VALUES (39, 9, 4, 4, 'I4', 'Konserve Tavuk Stok', 800, '2025-12-01');
INSERT INTO Stok VALUES (40, 10, 4, 4, 'J4', 'Konserve Tavuk Stok', 800, '2025-12-01');

INSERT INTO Stok VALUES (41, 1, 5, 5, 'A5', 'Çamaþýr Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (42, 2, 5, 5, 'B5', 'Çamaþýr Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (43, 3, 5, 5, 'C5', 'Çamaþýr Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (44, 4, 5, 5, 'D5', 'Çamaþýr Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (45, 5, 5, 5, 'E5', 'Çamaþýr Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (46, 6, 5, 5, 'F5', 'Çamaþýr Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (47, 7, 5, 5, 'G5', 'Çamaþýr Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (48, 8, 5, 5, 'H5', 'Çamaþýr Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (49, 9, 5, 5, 'I5', 'Çamaþýr Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (50, 10, 5, 5, 'J5', 'Çamaþýr Deterjaný Stok', 600, '2025-12-01');

INSERT INTO Stok VALUES (51, 1, 6, 6, 'A6', 'Bulaþýk Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (52, 2, 6, 6, 'B6', 'Bulaþýk Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (53, 3, 6, 6, 'C6', 'Bulaþýk Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (54, 4, 6, 6, 'D6', 'Bulaþýk Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (55, 5, 6, 6, 'E6', 'Bulaþýk Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (56, 6, 6, 6, 'F6', 'Bulaþýk Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (57, 7, 6, 6, 'G6', 'Bulaþýk Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (58, 8, 6, 6, 'H6', 'Bulaþýk Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (59, 9, 6, 6, 'I6', 'Bulaþýk Deterjaný Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (60, 10, 6, 6, 'J6', 'Bulaþýk Deterjaný Stok', 600, '2025-12-01');

INSERT INTO Stok VALUES (61, 1, 7, 7, 'A7', 'Ofis Sandalyesi Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (62, 2, 7, 7, 'B7', 'Ofis Sandalyesi Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (63, 3, 7, 7, 'C7', 'Ofis Sandalyesi Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (64, 4, 7, 7, 'D7', 'Ofis Sandalyesi Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (65, 5, 7, 7, 'E7', 'Ofis Sandalyesi Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (66, 6, 7, 7, 'F7', 'Ofis Sandalyesi Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (67, 7, 7, 7, 'G7', 'Ofis Sandalyesi Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (68, 8, 7, 7, 'H7', 'Ofis Sandalyesi Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (69, 9, 7, 7, 'I7', 'Ofis Sandalyesi Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (70, 10, 7, 7, 'J7', 'Ofis Sandalyesi Stok', 600, '2025-12-01');

INSERT INTO Stok VALUES (71, 1, 8, 8, 'A8', 'Çalýþma Masasý Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (72, 2, 8, 8, 'B8', 'Çalýþma Masasý Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (73, 3, 8, 8, 'C8', 'Çalýþma Masasý Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (74, 4, 8, 8, 'D8', 'Çalýþma Masasý Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (75, 5, 8, 8, 'E8', 'Çalýþma Masasý Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (76, 6, 8, 8, 'F8', 'Çalýþma Masasý Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (77, 7, 8, 8, 'G8', 'Çalýþma Masasý Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (78, 8, 8, 8, 'H8', 'Çalýþma Masasý Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (79, 9, 8, 8, 'I8', 'Çalýþma Masasý Stok', 600, '2025-12-01');
INSERT INTO Stok VALUES (80, 10, 8, 8, 'J8', 'Çalýþma Masasý Stok', 600, '2025-12-01');

INSERT INTO Stok VALUES (81, 1, 9, 9, 'A9', 'Deri Ceket', 600, '2025-12-01');
INSERT INTO Stok VALUES (82, 2, 9, 9, 'B9', 'Deri Ceket', 600, '2025-12-01');
INSERT INTO Stok VALUES (83, 3, 9, 9, 'C9', 'Deri Ceket', 600, '2025-12-01');
INSERT INTO Stok VALUES (84, 4, 9, 9, 'D9', 'Deri Ceket', 600, '2025-12-01');
INSERT INTO Stok VALUES (85, 5, 9, 9, 'E9', 'Deri Ceket', 600, '2025-12-01');
INSERT INTO Stok VALUES (86, 6, 9, 9, 'F9', 'Deri Ceket', 600, '2025-12-01');
INSERT INTO Stok VALUES (87, 7, 9, 9, 'G9', 'Deri Ceket', 600, '2025-12-01');
INSERT INTO Stok VALUES (88, 8, 9, 9, 'H9', 'Deri Ceket', 600, '2025-12-01');
INSERT INTO Stok VALUES (89, 9, 9, 9, 'I9', 'Deri Ceket', 600, '2025-12-01');
INSERT INTO Stok VALUES (90, 10, 9, 9, 'J9', 'Deri Ceket', 600, '2025-12-01');

INSERT INTO Stok VALUES (91, 1, 10, 10, 'A10', 'Kumaþ Pantolon', 600, '2025-12-01');
INSERT INTO Stok VALUES (92, 2, 10, 10, 'B10', 'Kumaþ Pantolon', 600, '2025-12-01');
INSERT INTO Stok VALUES (93, 3, 10, 10, 'C10', 'Kumaþ Pantolon', 600, '2025-12-01');
INSERT INTO Stok VALUES (94, 4, 10, 10, 'D10', 'Kumaþ Pantolon', 600, '2025-12-01');
INSERT INTO Stok VALUES (95, 5, 10, 10, 'E10', 'Kumaþ Pantolon', 600, '2025-12-01');
INSERT INTO Stok VALUES (96, 6, 10, 10, 'F10', 'Kumaþ Pantolon', 600, '2025-12-01');
INSERT INTO Stok VALUES (97, 7, 10, 10, 'G10', 'Kumaþ Pantolon', 600, '2025-12-01');
INSERT INTO Stok VALUES (98, 8, 10, 10, 'H10', 'Kumaþ Pantolon', 600, '2025-12-01');
INSERT INTO Stok VALUES (99, 9, 10, 10, 'I10', 'Kumaþ Pantolon', 600, '2025-12-01');
INSERT INTO Stok VALUES (100, 10, 10, 10, 'J10', 'Kumaþ Pantolon', 600, '2025-12-01');

select Sipariþ_ID, Müþteri_ID, sipariþ_T, sipariþ_durumu from Sipariþ
where sipariþ_durumu ='Teslim'

select kategori, Ürün_adý, Birim_fiyat from Ürün
where Birim_fiyat>2400;

select Stok_Adý as SAdý, Raf_NO as RNo
from Tedarikçi as T,Stok as S
where T.Tedarikçi_ID=S.Tedarikçi_ID and T.Tedarikçi_ID=1

select Müsteri.M_Ýsmi from Müsteri

select * from Sipariþ
where sipariþ_T>'2025-12-08'

select * from Sipariþ
order by sipariþ_T DESC

select * from Stok
order by Raf_NO ASC

SELECT Müþteri_ID, COUNT(*) AS SiparisSayisi
FROM Sipariþ
GROUP BY Müþteri_ID;

SELECT D.Depo_ID, SUM(S.Miktar) AS ToplamUrun
FROM Stok as S
JOIN Depo as D ON S.Depo_ID = D.Depo_ID
GROUP BY D.Depo_ID;

SELECT Ü.Ürün_ID, Sum(S.Miktar) AS ToplamMiktar
from Sipariþ_Detayý as S
Join Ürün as Ü ON S.Ürün_ID = Ü.Ürün_ID
GROUP BY Ü.Ürün_ID;

select Depo_Tipi, Miktar from (Depo as D join Stok as S on D.Depo_ID=S.Depo_ID)
select * from (Personel as P join Depo as D on P.Depo_ID=D.Depo_ID)

SELECT Ürün_adý, Birim_fiyat FROM Ürün
WHERE Birim_fiyat > (SELECT AVG(Birim_fiyat) FROM Ürün);

go
create trigger trg_Stokekleme
on Stok
after update
as
begin
	if exists
	(
		select 1
		from inserted as s
		where
			s.Miktar<50
	)
		begin
			update Stok set Miktar=Miktar+300
			print 'stok baþarýyla yenilendi'
		end
	
end;

go
create trigger trg_Stokyetersiz
on Sipariþ_Detayý
after insert
as
begin
	If exists
	(
		select 1
		from inserted as i
		left join stok as s
			on s.Ürün_ID=i.Ürün_ID
		where
			i.Miktar>s.Miktar
	)
	begin
		print 'Yetersiz stok sipariþ talebi alýnamadý'
		rollback
	end;
	update s
	set s.Miktar = s.Miktar - i.Miktar
    from Stok as s
    join inserted as i
        on s.Ürün_ID = i.Ürün_ID;
	print 'sipariþiniz baþarýyla alýndý'
end;

go
create trigger trg_Sipariþiptali
on sipariþ
after update
as
begin
	if exists
	(
		select 1
		from inserted as s
		where s.sipariþ_durumu='iptal'
	)
		begin
			update st
			set st.Miktar = st.Miktar + sd.Miktar
			from Stok as st
			join Sipariþ_Detayý as sd
				on sd.Ürün_ID=st.Ürün_ID
			join inserted as s
				on s.Sipariþ_ID=sd.Sipariþ_ID
			print 'Sipariþ iptal edildi ve ürünler stoklara eklendi'
		end
end;

go
create trigger trg_teslim_tarihi_ekle
on sipariþ
after update
as
begin
	if exists
	(
		select 1
		from inserted as s
		where s.sipariþ_durumu='Teslim'
	)
		begin
			update s
			set s.teslim_T=GETDATE()
			from Sipariþ as s
			where s.sipariþ_durumu='Teslim'
			print 'Sipariþ teslim edildi, teslim tarihi kayýtlara geçildi'
		end
end

go
create trigger trg_stok_güncelleme_tarihi
on stok
after update
as
begin
	if exists
	(
		select 1
		from inserted as i
		join deleted as d
		on d.Stok_ID=i.Stok_ID
		where i.Miktar <>d.Miktar
	)
		begin
			update s
			set Güncelleme_T=GETDATE()
			from Stok as s
			join inserted as i
			on s.Stok_ID=i.Stok_ID
		end
end
drop trigger trg_stok_güncelleme_tarihi

update stok
set Miktar =170
where Stok_ID=1

update Stok
set Güncelleme_T = null

go
create function kategorikçaðýrma(@kategori nvarchar(50))
returns table
as
return
select * from Ürün where kategori =@kategori;

select * from dbo.kategorikçaðýrma('Elektronik')

go 
create function toplamfiyat(@SipariþID INT)
returns decimal (10,2)
as
begin
	Declare @toplam Decimal(10,2)
	select @toplam=sum(sd.Miktar*ü.Birim_fiyat)
	from Sipariþ_Detayý as sd
	join Ürün as ü
	on ü.Ürün_ID=sd.Ürün_ID
	where sd.Sipariþ_ID=@SipariþID
	return @Toplam
end

select dbo.toplamfiyat(1)

go
create function sipariþtekiürünsayýsý (@SipariþID INT)
returns INT
as
begin
	declare @sayac int;
	select @sayac = count(*)
	from Sipariþ_Detayý
	where Sipariþ_ID=@SipariþID

	return @sayac
end

select dbo.sipariþtekiürünsayýsý(5)

go
create function araçdurum (@plaka nvarchar(15))
returns nvarchar(10)
as
begin
	declare @durum nvarchar(10);
	declare @aracdurum nvarchar(10);
		select @aracdurum = A_durumu
		from Araç
		where Plaka =@plaka

		IF(@aracdurum='Yolda')
			set @durum = 'Dolu'
		else IF(@aracdurum='Bakimda'or @aracdurum='Müsait')
			set @durum = 'Boþ'
	
	return @durum
end

select dbo.araçdurum ('34 ABC 123')

go
create function toplamürün (@ürünID INT)
RETURNS INT
AS
BEGIN
	Declare @Toplamürün int

	select @Toplamürün=sum(Miktar)
	from Stok
	where Ürün_ID=@ürünID

	return @Toplamürün
	
END


select dbo.toplamürün (1)