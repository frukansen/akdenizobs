create database obs_odev
use obs_odev

create table fakulte(
f_no varchar(3) primary key,
f_ad varchar(50) not null,
f_adres text default 'KAMP�S',
f_tel varchar(11),
dk_sicil varchar(6),
)

create table tur(
tur_no varchar(1) primary key,
tur_ad varchar(50)
)

create table alan(
alan_no int identity (1,1) primary key,
alan_ad varchar(50),
)

create table unvan(
unvan_no int identity (1,1) primary key,
unvan_ad varchar(50),
)

create table kimlik(
tc_kimlik varchar(11) primary key,
ad varchar(50),
s_ad varchar(50),
d_tarih date,
tel varchar(11),
mail varchar(50),
d_yer varchar(50),
a_ad varchar(50),
b_ad varchar(50),
resim image,
)

create table bolum(
bolum_no varchar(2) primary key,
bolum_ad varchar(50),
f_no varchar(3),
tur_no varchar(1),
bb_sicil varchar(6),
)

create table personel(
sicil varchar(6) primary key,
tc_kimlik varchar(11),
bolum_no varchar(2),
unvan_no int,
alan_no int,
)

create table ders(
ders_kod varchar(6) primary key,
ders_ad varchar(50),
t int,
u int,
k int,
akts int,
bolum_no varchar(2),
yyil varchar(1),
)

create table donem(
donem_no varchar(3) primary key,
donem varchar(50),
)

create table ders_personel(
ders_kayit_no int identity (1,1) primary key,
sicil varchar(6),
ders_kod varchar(6),
donem_no varchar(3),
)

create table kayit_tur(
kayit_tur_no int identity(1,1) primary key,
kayit_tur varchar(50),
)

create table ogr_durum(
ogr_durum_no int identity(1,1) primary key,
ogr_durum varchar(50),
)

create table ogr_kayit(
ogr_no varchar(11) primary key,
tc_kimlik varchar(11),
bolum_no varchar(2),
k_tarih date,
kayit_tur_no int,
m_tarih date,
gno float,
ogr_durum_no int,
)

create table ders_durum(
ders_durum_no varchar(1) primary key,
ders_durum varchar(50),
)

create table ders_kayit(
ders_kayit_no int identity(1,1) primary key,
ogr_no varchar(11),
ders_kod varchar(6),
vize int default 0,
final int default 0,
uygulama int default 0,
butunleme int default 0,
ders_durum_no varchar(1),
donem_no varchar(3),
)

alter table fakulte add constraint fk_fakulte_personel foreign key (dk_sicil) references personel(sicil)

alter table bolum add constraint fk_bolum_fakulte foreign key (f_no) references fakulte(f_no)
alter table bolum add constraint fk_bolum_tur foreign key (tur_no) references tur(tur_no)
alter table bolum add constraint fk_bolum_personel foreign key (bb_sicil) references personel(sicil)

alter table personel add constraint fk_personel_kimlik foreign key (tc_kimlik) references kimlik(tc_kimlik)
alter table personel add constraint fk_personel_bolum foreign key (bolum_no) references bolum(bolum_no)
alter table personel add constraint fk_bolum_unvan foreign key (unvan_no) references unvan(unvan_no)
alter table personel add constraint fk_bolum_alan foreign key (alan_no) references alan(alan_no)

alter table ders add constraint fk_ders_bolum foreign key (bolum_no) references bolum(bolum_no)

alter table ders_personel add constraint fk_ders_personel_personel foreign key (sicil) references personel(sicil)
alter table ders_personel add constraint fk_ders_personel_ders foreign key (ders_kod) references ders(ders_kod)
alter table ders_personel add constraint fk_ders_personel_donem foreign key (donem_no) references donem(donem_no)

alter table ogr_kayit add constraint fk_ogr_kayit_kimlik foreign key (tc_kimlik) references kimlik(tc_kimlik)
alter table ogr_kayit add constraint fk_ogr_kayit_bolum foreign key (bolum_no) references bolum(bolum_no)
alter table ogr_kayit add constraint fk_ogr_kayit_kayit_tur foreign key (kayit_tur_no) references kayit_tur(kayit_tur_no)
alter table ogr_kayit add constraint fk_ogr_kayit_ogr_durum foreign key (ogr_durum_no) references ogr_durum(ogr_durum_no)

alter table ders_kayit add constraint fk_ders_kayit_ogr_kayit foreign key (ogr_no) references ogr_kayit(ogr_no)
alter table ders_kayit add constraint fk_ders_kayit_ders foreign key (ders_kod) references ders(ders_kod)
alter table ders_kayit add constraint fk_ders_kayit_ders_durum foreign key (ders_durum_no) references ders_durum(ders_durum_no)
alter table ders_kayit add constraint fk_ders_kayit_donem foreign key (donem_no) references donem(donem_no)
alter table ders_kayit add constraint chk_ders_kayit_vize check (vize<=100 and vize >=0)
alter table ders_kayit add constraint chk_ders_kayit_final check (final <= 100 and final >= 0)
alter table ders_kayit add constraint chk_ders_kayit_uyg check (uygulama<=100 and uygulama >=0)
alter table ders_kayit add constraint chk_ders_kayit_but check (butunleme<=100 and butunleme >=0)

/*��renciler*/
insert into kimlik values('32882498658','HASAN AL�','�ZTOP','07/05/1986','5308321216','halioztop.ybs@gmail.com','ISPARTA','AY�E','MEHMET',NULL)
insert into kimlik values('11111111111','ENG�N','B�YAR','07/05/2002','5308603510','enginbiyar.ybs@gmail.com','BALIKES�R','YAREN','ENG�N',NULL)
insert into kimlik values('11111111112','EN�S','AYDEM�R','07/05/2001','5322148186','enisaydemir.ybs@gmail.com','ANTALYA','S�NEM','DEM�R',NULL)
insert into kimlik values('11111111113','CELAL','ALTAN','07/05/2003','5457280929','celalaltan.ybs@gmail.com','KASTAMONU','NALAN','ALTAN',NULL)
insert into kimlik values('11111111114','AZRA YA�MUR','KAPANCI','07/05/2004','5308603510','azrakapanci.ybs@gmail.com','�ZM�R','ZARA','ARAS',NULL)
insert into kimlik values('11111111115','FATMA G�L','ATIL','07/04/2004','5550410803','fatil.ybs@gmail.com','NAZ�LL�','DEN�Z','AKIN',NULL)
insert into kimlik values('11111111116','HAL�L �BRAH�M','D�ZC�','05-17-2004','5444312004','hibrahim.ybs@gmail.com','OSMAN�YE','AL�YE','OSMAN',NULL)
insert into kimlik values('11111111117','�MER FARUK','TEMS�LC�','07/09/2004','5424426517','�faruk.ybs@gmail.com','ANTALYA','FATMA','POLAT',NULL)
insert into kimlik values('11111111118','���EK','YAL�IN','07/05/2005','5331472404','�yalcin.ybs@gmail.com','�ZM�R','AZRA','HAKAN',NULL)
insert into kimlik values('11111111119','CAN','GAD�RL�','01/01/2004','5538165454','CGAD�RL�.ybs@gmail.com','ANTALYA','HAYDAR','AL�YE',NULL)
insert into kimlik values('11111111120','SEYMEN','BALCI','01/01/2004','5453109117','sbalci.ybs@gmail.com','�ANAKKALE','EM�NE','EKREM',NULL)
insert into kimlik values('11111111121','BAHADIR','TOPALO�LU','01/01/2004','5435854180','btoplaoglu.ybs@gmail.com','BURSA','BAHAR','BAHR�',NULL)
insert into kimlik values('11111111122','AY�E','B�ROL','01/01/2004','5531317198','abirol.ybs@gmail.com','ALANYA','AY�E','B�ROL',NULL)
insert into kimlik values('11111111123','MERTCAN','G��O�LU','01/01/2004','5367980476','MERTCAN.ybs@gmail.com','S�NOP','CANAN','MERT',NULL)
insert into kimlik values('11111111124','MUSTAFA MER��','KARAPINAR','01/01/2004','5351000000','mmeric.ybs@gmail.com','ANTALYA','AY�E','MUSTAFA',NULL)
insert into kimlik values('11111111125','BURAK','�NC�','01/01/2004','1001001000','B�NC�.ybs@gmail.com','AYDIN','G�LS�M','RAMAZAN',NULL)

/*personeller*/
insert into kimlik values('10000000000','RAMAZAN','ERTURGUT',NULL,'2422272079','rerturgut@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000001','HAKAN','ER',NULL,'2422274400','erhakan@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000002','�erife G�zde','Y�RM�BE�O�LU',NULL,'2422274400','gozdey@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000003','SEZG�N','IRMAK',NULL,'2422274400','sezgin@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000004','FAHR�YE','MERD�VENC�',NULL,'2422274400','fahriye@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000005','�M�R','TOSUN',NULL,'2422274400','omurtosun@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000006','HAL�L','�ZEK�C�O�LU',NULL,'2422274400','hozekicioglu@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000007','�brahim Taylan','D�RTYOL',NULL,'2422274400','taylandortyol@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000008','Ay�en CO�KUN','�ELEN',NULL,'2422274400','aysencoskun@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000009','YUNUS','KILI�',NULL,'2422274400','yunuskilic@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000010','SEDA','S�NMEZ',NULL,'2422274400','sedasonmez@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000011','Kerim K�r�at','�EV�K',NULL,'2422274400','kcevik@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000012','Raife Meltem','YETK�N �ZB�K',NULL,'2422274400',' rmyetkin@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000013','F�L�Z','YET�Z',NULL,'2422274400','filizyetiz@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000014','NURAY','AKAR',NULL,'2422274400','nurayyapici@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000015','NUR�','AV�ARG�L',NULL,'2422274400','nuriavsarligil@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000016','TAYFUN','Y�R�K',NULL,'2422274400','tayfunyoruk@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000017','CENK','TUFAN',NULL,'2422274400','cenktufan@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000018','AY�EG�L','C��ER',NULL,'2422274400','aysegulc@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000019','Nihan','�KS�Z NAR�N�',NULL,'2422274400','nihanoksuz@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000020','Mustafa �zer','ALPSAR',NULL,'2422274400','oalpar@akdeniz.edu.tr',NULL,NULL,NULL,NULL)/*HATALI KAYIT*/
 /* kay�t d�zeltme*/
update kimlik set s_ad='ALPAR' where s_ad='ALPSAR'

insert into kimlik values('10000000021','H�SEY�N','TOPUZ',NULL,'2422274400','huseyintopuz@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000022','Atiye Beyhan','AKAY',NULL,'2422274400','beyhanyilmaz@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000023','AHMET','T�RKMEN',NULL,'2422274400','aturkmen@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000024','N�SA','EK��L�',NULL,'2422274400','nisaeksili@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000025','G�RAY','TONGU�',NULL,'2422274400','guraytonguc@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000026','AHMET','KAYAX',NULL,'2422274400','ahmetkaya@akdeniz.edu.tr',NULL,NULL,NULL,NULL) /*HATALI KAYIT*/
 /* kay�t d�zeltme*/
update kimlik set s_ad='KAYA' where s_ad='KAYAX'

insert into kimlik values('10000000027','FURKAN','YILDIRIM',NULL,'2422274400','furkanyildirim@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000028','OSMAN','YAKIT',NULL,'2422274400','oyakit@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000029','�SMA�L','KARAY�N',NULL,'2422274400','ismailkarayun@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000030','Ay�a','KANGAL DEM�R',NULL,'2422274400','aycakangal@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000031','NAC�','B�Y�KDA�',NULL,'2422274400','nbuyukdag@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000032','IRMAK','DALDIR',NULL,'2422274400','irmakdaldir@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000033','Artu� Eren','CO�KUN',NULL,'2422274400','erencoskun@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000034','Nesrin','KO� USTALI',NULL,'2422274400','nesrinkoc@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000035','ASLI','G�VEN',NULL,'2422274400','asakarya@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000036','TUBA','SARI',NULL,'2422274400','tubasari@akdeniz.edu.tr',NULL,NULL,NULL,NULL)
insert into kimlik values('10000000036','TUBA','SARI',NULL,'2422274400','tubasari@akdeniz.edu.tr',NULL,NULL,NULL,NULL)

/*
insert into donem values('001','2022-2023 BAHAR')  /* hatal� kay�t girildi*/
delete from donem where donem_no='001'  /* KAYIT S�LME G�REV� ���N*/ */

insert into donem values('001','2022-2023 G�Z')
insert into donem values('002','2022-2023 BAHAR') 
insert into donem values('003','2023-2024 G�Z')
insert into donem values('004','2023-2024 BAHAR') 
insert into donem values('005','2024-2025 G�Z')
insert into donem values('006','2024-2025 BAHAR') 
insert into donem values('007','2025-2026 G�Z')
insert into donem values('008','2025-2026 BAHAR')

insert into kayit_tur values('YKS �LE KAYIT')
insert into kayit_tur values('YATAY GE��� �LE KAYIT')
insert into kayit_tur values('D�KEY GE��� �LE KAYIT')
insert into kayit_tur values('Y�KSEK��REN�M AFFI �LE YEN�DEN KAYIT')


insert into ogr_durum values('AKT�F')
insert into ogr_durum values('PAS�F-DONDURMA')
insert into ogr_durum values('PAS�F-ATILMA')
insert into ogr_durum values('PAS�F-MEZUN')


insert into ders_durum values('1','GE�T�')
insert into ders_durum values('2','KALDI')
insert into ders_durum values('3','SORUMLU GE�T�')


insert into tur values('1','�NL�SANS')
insert into tur values('2','L�SANS')


insert into alan values('YAZILIM')
insert into alan values('DONANIM')
insert into alan values('�NSAN KAYNAKLARI')
insert into alan values('PAZARLAMA')
insert into alan values('S�GORTA')
insert into alan values('BANKACILIK')
insert into alan values('HAVACILIK')
insert into alan values('T�CARET')


insert into unvan values('PROFES�R DOKTOR')
insert into unvan values('DO�ENT DOKTOR')
insert into unvan values('DOKTOR ��RET�M �YES�')
insert into unvan values('ARA�TIRMA G�REVL�S�')


insert into fakulte values('001','UYGULAMALI B�L�MLER FAK�LTES�','KAMP�S','2422272079',null)
insert into fakulte values('002','Di� Hekimli�i Fak�ltesi','Akdeniz �niversitesi Di� Hekimli�i Fak�ltesi Dumlup�nar Bulvar� 07058 Kamp�s','2423106967',null)
insert into fakulte values('003','Edebiyat Fak�ltesi','Akdeniz �niversitesi Edebiyat Fak�ltesi Dumlup�nar Bulvar� 07058 Kampus','2423102334',null)
insert into fakulte values('004','E�itim Fak�ltesi','Akdeniz �niversitesi E�itim Fak�ltesi Dekanl��� Dumlup�nar Bulvar�, Kampus','2423101527',null)
insert into fakulte values('005','Fen Fak�ltesi Fak�ltesi','Akdeniz �niversitesi Fen Fak�ltesi P�narba�� Mah. Dumlup�nar Bul. Kamp�s ','2422278936',null)
insert into fakulte values('006','G�zel Sanatlar Fak�ltesi','Akdeniz �niversitesi G�zel Sanatlar Fak�ltesi Dekanl��� Dumlup�nar Bulvar� 07058 Kampus ','2423106200',null)
insert into fakulte values('007','Hem�irelik Fak�ltesi','Akdeniz �niversitesi Dumlup�nar Bulvar�, Akdeniz �niversitesi Yerle�kesi','2422261358',null)
insert into fakulte values('008','Hukuk Fak�ltesi','Akdeniz �niversitesi Dumlup�nar Bulvar�, Akdeniz �niversitesi Yerle�kesi','2422276975',null)
insert into fakulte values('009','�ktisadi ve �dari Bilimler Fak�ltesi','Akdeniz �niversitesi Dumlup�nar Bulvar�, Akdeniz �niversitesi Yerle�kesi','2423101810',null)
insert into fakulte values('010','�lahiyat Fak�ltesi','Akdeniz �niversitesi Dumlup�nar Bulvar� 07058','2423106888',null)
insert into fakulte values('011','�leti�im Fak�ltesi','Akdeniz �niversitesi Dumlup�nar Bulvar� 07058','2423101553',null)
insert into fakulte values('012','Kemer Denizcilik Fak�ltesi','Kemer Denizcilik Fak�ltesi Su �r�nleri Fak�ltesi','2422274400',null)
insert into fakulte values('013','Kumluca Sa�l�k Bilimleri Fak�ltesi','Temel E�itim Mah. Spor Cad. No: 14 Kumluca ','2428870910',null)
insert into fakulte values('014','Manavgat Sosyal ve Be�eri Bilimler Fak�ltesi','Manavgat Sosyal ve Be�eri Bilimler Fak�ltesi 07600 ','2425038977',null)
insert into fakulte values('015','Manavgat Turizm Fak�ltesi','Manavgat MATSO Turizm Fak�ltesi 07600','2427427026',null)
insert into fakulte values('016','Mimarl�k Fak�ltesi','Akdeniz �niversitesi Mimarl�k Fak�ltesi (Edebiyat Fak�ltesi G�neyi)','2422274400',null)
insert into fakulte values('017','M�hendislik Fak�ltesi','M�hendislik Fak�ltesi Dumlup�nar Bulvar�, Akdeniz �niversitesi Yerle�kesi','2423106300',null)
insert into fakulte values('018','Sa�l�k Bilimleri Fak�ltesi','Sa�l�k Bilimleri Fak�ltesi P�narba�� Mah. Dumlup�nar Blv. 07058','2422275565',null)
insert into fakulte values('019','Serik ��letme Fak�ltesi','K�kez Mahallesi 3002 Sok. No: 1 Serik','2427125021',null)
insert into fakulte values('020','Spor Bilimleri Fak�ltesi','Spor Bilimleri Fak�ltesi, Dumlup�nar Bulvar�, Yerle�ke, ','2423101779',null)
insert into fakulte values('021','Su �r�nleri Fak�ltesi','Akdeniz �niversitesi Su �r�nleri Fak�ltesi Dumlup�nar Bulvar� Yerle�ke','2423101973',null)
insert into fakulte values('022','T�p Fak�ltesi','Akdeniz �niversitesi T�p Fak�ltesi Morfoloji Binas� Yerle�ke','2422496900',null)
insert into fakulte values('023','Turizm Fak�ltesi','Akdeniz �niversitesi Yerle�kesi, Dumlup�nar Bulvar� 07058','2422274550',null)
insert into fakulte values('024','Ziraat Fak�ltesi','Akdeniz �niversitesi, Ziraat Fak�ltesi - 07059','2423102474',null)


insert into bolum values('01','Y�NET�M B�L���M S�STEMLER�','001','2',NULL)
insert into bolum values('02','ULUSLARARASI T�CARET VE LOJ�ST�K','001','2',NULL)
insert into bolum values('03','PAZARLAMA','001','2',NULL)
insert into bolum values('04','F�NANS VE BANKACILIK','001','2',NULL)
insert into bolum values('05','S�GORTACILIK','001','2',NULL)
insert into bolum values('06','HAVACILIK','001','2',NULL)


/*1. yar�y�l dersleri*/
insert into ders values('YBS151','Bili�im Sistemleri ve Teknolojilerine Giri�',2,0,2,4,'01','1')
insert into ders values('YBS153','Algoritma ve Programlamaya Giri�',3,0,3,4,'01','1')
insert into ders values('YBS155','Matematik',3,0,3,4,'01','1')
insert into ders values('YBS157','Pazarlama �lkeleri',3,0,3,4,'01','1')
insert into ders values('YBS159','�ktisada Giri� I',3,0,3,4,'01','1')
insert into ders values('TDB101','T�rk Dili I',2,0,2,2,'01','1')
insert into ders values('ATA101','Atat�rk �lkeleri ve �nk�lap Tarihi I',2,0,2,2,'01','1')
insert into ders values('YBD101','�ngilizce I',2,0,2,4,'01','1')
insert into ders values('KPD101','Kariyer Planlama',1,0,1,2,'01','1')
/*2. yar�y�l dersleri*/
insert into ders values('YBS152','Y�netim ve Organizasyon',3,0,3,5,'01','2')
insert into ders values('YBS154','�leri D�zey Ofis Uygulamalar�',2,0,2,4,'01','2')
insert into ders values('YBS156','Bilgisayar Donan�m� ve ��letim Sistemleri',3,0,3,4,'01','2')
insert into ders values('YBS158','Veri Yap�lar� ve Algoritmalar',3,0,3,5,'01','2')
insert into ders values('YBS160','�ktisada Giri� II',3,0,3,4,'01','2')
insert into ders values('TDB102','T�rk Dili II',2,0,2,2,'01','2')
insert into ders values('ATA102','Atat�rk �lkeleri ve �nk�lap Tarihi II',2,0,2,2,'01','2')
insert into ders values('YBD102','�ngilizce II',2,0,2,4,'01','2')
/*3. yar�y�l dersleri*/
insert into ders values('YBS251','Nesne Y�nelimli Programlama - 1',3,0,3,4,'01','3')
insert into ders values('YBS253','Web Tabanl� Programlama - 1',3,0,3,4,'01','3')
insert into ders values('YBS255','Veritaban�na Giri�',3,0,3,4,'01','3')
insert into ders values('YBS257','Proje Y�netimi',3,0,3,4,'01','3')
insert into ders values('YBS259','�rg�tsel Davran��',3,0,3,4,'01','3')
insert into ders values('YBS261','�statistik I',3,0,3,3,'01','3')
insert into ders values('YBS263','Uygulamal� Giri�imcilik',3,0,3,4,'01','3')
insert into ders values('YBS265','Genel Muhasebe I ',3,0,3,3,'01','3')
/*4. yar�y�l dersleri*/
insert into ders values('YBS252','Nesne Y�nelimli Programlama - 2',3,0,3,4,'01','4')
insert into ders values('YBS254','Web Tabanl� Programlama - 2',3,0,3,4,'01','4')
insert into ders values('YBS256','Veritaban�na Y�netim Sistemleri',3,0,3,4,'01','4')
insert into ders values('YBS258','Bilimsel Ara�t�rma Y�ntemleri',3,0,3,4,'01','4')
insert into ders values('YBS260','�retim Y�netimi',3,0,3,4,'01','4')
insert into ders values('YBS262','�statistik II',3,0,3,3,'01','4')
insert into ders values('YBS264','Sistem Analizi ve Tasar�m�',3,0,3,4,'01','4')
insert into ders values('YBS266','Genel Muhasebe II',3,0,3,3,'01','4')
/*5. yar�y�l dersleri*/
insert into ders values('YBS351','Veri �leti�imi ve Bilgisayar A�lar�',3,0,3,5,'01','5')
insert into ders values('YBS353','Mobil Uygulama Geli�tirme',3,0,3,5,'01','5')
insert into ders values('YBS355','Grafik ve Bili�im Aray�z Tasar�m�',3,0,3,4,'01','5')
insert into ders values('YBS357','Y�neylem Ara�t�rmas� I',3,0,3,4,'01','5')
insert into ders values('TDP301','Toplumsal Duyarl�l�k ve Katk�',2,0,2,2,'01','5')
insert into ders values('YBS361','Karar Verme Teknikleri',3,0,3,4,'01','5')
/* 5.yar�y�l se�meli dersler*/
insert into ders values('YBS381','Dijital �r�n Y�netimi',3,0,3,3,'01','5')
insert into ders values('YBS383','Bilgisayarl� Muhasebe',3,0,3,3,'01','5')
insert into ders values('YBS385','Bili�im Hukuku',3,0,3,3,'01','5')
insert into ders values('YBS387','T�ketici Davran��lar�',3,0,3,3,'01','5')
insert into ders values('YBS389','Stratejik Y�netim',3,0,3,3,'01','5')

/*6. yar�y�l dersleri*/
insert into ders values('YBS352','Bilgi Sistemleri Entegrasyonu ',3,0,3,4,'01','6')
insert into ders values('YBS354','Yapay Zek� ve Makine ��renmesi ',3,0,3,4,'01','6')
insert into ders values('YBS356','�nsan Kaynaklar� Y�netimi',3,0,3,4,'01','6')
insert into ders values('YBS358','Y�neylem Ara�t�rmas� II',3,0,3,4,'01','6')
insert into ders values('YBS360','Sistem Y�netimi ve G�venli�i',3,0,3,4,'01','6')
insert into ders values('YBS362',' Finansal Y�netim',3,0,3,4,'01','6')
/*6. yar�y�l se�meli dersler*/
insert into ders values('YBS382','�nsan Bilgisayar Etkile�imi',2,0,2,3,'01','6')
insert into ders values('YBS384','Sim�lasyon Modelleri ve Analizi',3,0,3,3,'01','6')
insert into ders values('YBS386','Bilgisayar Tabanl� Optimizasyon Uygulamalar� ',3,0,3,3,'01','6')

/*7. yar�y�l dersleri*/
insert into ders values('YBS451','Kurumsal Kaynak Planlama',3,0,3,5,'01','7')
insert into ders values('YBS453','Y�netim Bili�im Sistemlerinde G�ncel Konular',2,0,2,5,'01','7')
/*7. yar�y�l secmeli dersler*/
insert into ders values('YBS481','Kurumsal Veri Y�netimi',3,0,3,4,'01','7')
insert into ders values('YBS483','Uygulamal� Veri Madencili�i',3,0,3,4,'01','7')
insert into ders values('YBS485','Derin ��renme',3,0,3,4,'01','7')
insert into ders values('YBS487','M��teri �li�kileri Y�netimi',3,0,3,4,'01','7')
insert into ders values('YBS489','Tedarik Zinciri Y�netimi',3,0,3,4,'01','7')
insert into ders values('YBS491','E-�� Y�netimi',3,0,3,4,'01','7')
insert into ders values('YBS493','Maliyet Muhasebesi ',3,0,3,4,'01','7')
insert into ders values('YBS495','Robotik Uygulamalar�',3,0,3,4,'01','7')

/*8. yar�y�l dersleri*/
insert into ders values('YBS402','�� Yerinde E�itim',0,40,0,30,'01','8')

/* hoca veri giri�i*/
insert into personel values('100000','10000000003','01',1,1)
insert into personel values('111111','10000000000',null,1,8)
insert into personel values('111112','10000000001','04',1,6)
insert into personel values('111113','10000000002','02',1,8)
insert into personel values('111114','10000000004','02',1,8)
insert into personel values('111115','10000000005','01',2,1)
insert into personel values('111116','10000000006','02',2,8)
insert into personel values('111117','10000000007','03',2,4)
insert into personel values('111118','10000000008','03',2,4)
insert into personel values('111119','10000000009','05',2,5)
insert into personel values('111120','10000000010','04',2,6)
insert into personel values('999999','10000000011','01',2,1)
insert into personel values('111121','10000000012','03',2,4)
insert into personel values('111122','10000000013','05',2,5)
insert into personel values('111123','10000000014','01',2,3)
insert into personel values('111124','10000000015','04',2,6)
insert into personel values('111125','10000000016','01',2,1)
insert into personel values('111126','10000000017','06',2,7)
insert into personel values('111127','10000000018','04',2,6)
insert into personel values('111128','10000000019','04',2,6)
insert into personel values('111129','10000000020','06',3,7)
insert into personel values('111130','10000000021','02',3,8)
insert into personel values('111131','10000000022','02',3,8)
insert into personel values('111132','10000000023','05',3,4)
insert into personel values('111133','10000000024','06',3,7)
insert into personel values('111134','10000000025','01',3,2)
insert into personel values('111135','10000000026','04',3,6)
insert into personel values('111136','10000000027','04',3,6)
insert into personel values('111137','10000000028','02',3,8)
insert into personel values('111138','10000000029','02',3,8)
insert into personel values('111139','10000000030','03',3,4)
insert into personel values('111140','10000000031','03',3,4)
insert into personel values('111141','10000000032','02',4,8)
insert into personel values('111142','10000000033','02',4,8)
insert into personel values('111143','10000000034','02',4,8)
insert into personel values('111144','10000000035','03',4,4)
insert into personel values('111145','10000000036','01',4,3)


/*ders_personel veri giri�i 2022/2023 G�Z*/
insert into ders_personel values('111134', 'YBS151', '001')
insert into ders_personel values('111115', 'YBS153', '001')
insert into ders_personel values('111115', 'YBS155', '001')
insert into ders_personel values('111132', 'YBS157', '001')
insert into ders_personel values('111131', 'YBS159', '001')
insert into ders_personel values(NULL, 'TDB101', '001')
insert into ders_personel values(NULL, 'ATA101', '001')
insert into ders_personel values(NULL, 'YBD101', '001')
insert into ders_personel values('111123', 'KPD101', '001')

/*ders_personel veri giri�i 2022/2023 BAHAR*/
insert into ders_personel values('111123', 'YBS152', '002')
insert into ders_personel values('111125', 'YBS154', '002')
insert into ders_personel values('111134', 'YBS156', '002')
insert into ders_personel values('999999', 'YBS158', '002')
insert into ders_personel values('111122', 'YBS160', '002')
insert into ders_personel values(NULL, 'TDB102', '002')
insert into ders_personel values(NULL, 'ATA102', '002')
insert into ders_personel values(NULL, 'YBD102', '002')

/*ders_personel veri giri�i 2023/2024 G�Z*/
insert into ders_personel values('111125', 'YBS251', '003')
insert into ders_personel values('111125', 'YBS253', '003')
insert into ders_personel values('999999', 'YBS255', '003')
insert into ders_personel values('111115', 'YBS257', '003')
insert into ders_personel values('111123', 'YBS259', '003')
insert into ders_personel values('111124', 'YBS261', '003')
insert into ders_personel values('111123', 'YBS263', '003')
insert into ders_personel values('111136', 'YBS265', '003')

/*ders_personel veri giri�i 2023/2024 G�BAHAR*/
insert into ders_personel values('111125', 'YBS252', '004')
insert into ders_personel values('111125', 'YBS254', '004')
insert into ders_personel values('999999', 'YBS256', '004')
insert into ders_personel values('100000', 'YBS258', '004')
insert into ders_personel values('111115', 'YBS260', '004')
insert into ders_personel values('111124', 'YBS262', '004')
insert into ders_personel values('111115', 'YBS264', '004')
insert into ders_personel values('111136', 'YBS266', '004')

/* ogr_kayit tablo veri giri�i*/
insert into ogr_kayit values('20224703008', '32872161954', '01', '2022/08/22', 1, null, 3.88, 1)
insert into ogr_kayit values('20220000001', '11111111111', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000002', '11111111112', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000003', '11111111113', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000004', '11111111114', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000005', '11111111115', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000006', '11111111117', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000007', '11111111118', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000008', '11111111119', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000009', '11111111120', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000010', '11111111121', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000011', '11111111122', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000012', '11111111123', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000013', '11111111124', '01', '2022/08/22', 1, null, null, 1)
insert into ogr_kayit values('20220000014', '11111111125', '01', '2022/08/22', 1, null, null, 1)

/*1. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20224703008', 'YBS151', 96,96,NULL,NULL,'1', '001')
insert into ders_kayit values('20224703008', 'YBS153', 90,100,NULL,NULL,'1', '001')
insert into ders_kayit values('20224703008', 'YBS155', 95,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20224703008', 'YBS157', 100,100,NULL,NULL,'1', '001')
insert into ders_kayit values('20224703008', 'YBS159', 100,100,NULL,NULL,'1', '001')
insert into ders_kayit values('20224703008', 'TDB101', 95,95,NULL,NULL,'1', '001')
insert into ders_kayit values('20224703008', 'YBD101', 95,95,NULL,NULL,'1', '001')
insert into ders_kayit values('20224703008', 'KPD101', 85,96,NULL,NULL,'1', '001')
insert into ders_kayit values('20224703008', 'ATA101', 70,100,NULL,NULL,'1', '001')

/*1. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20224703008', 'YBS152', 100,100,NULL,NULL,'1', '002')
insert into ders_kayit values('20224703008', 'YBS154', 90,95,NULL,NULL,'1', '002')
insert into ders_kayit values('20224703008', 'YBS156', 92,92,NULL,NULL,'1', '002')
insert into ders_kayit values('20224703008', 'YBS158', 63,65,NULL,NULL,'1', '002')
insert into ders_kayit values('20224703008', 'YBS160', 85,75,NULL,NULL,'1', '002')
insert into ders_kayit values('20224703008', 'TDB102', 85,80,NULL,NULL,'1', '002')
insert into ders_kayit values('20224703008', 'YBD102', 95,95,NULL,NULL,'1', '002')
insert into ders_kayit values('20224703008', 'ATA102', 95,100,NULL,NULL,'1', '002')

/*1. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20224703008', 'YBS251', 96,92,NULL,NULL,'1', '003')
insert into ders_kayit values('20224703008', 'YBS253', 80,68,NULL,NULL,'1', '003')
insert into ders_kayit values('20224703008', 'YBS255', 80,78,NULL,NULL,'1', '003')
insert into ders_kayit values('20224703008', 'YBS257', 75,90,NULL,NULL,'1', '003')
insert into ders_kayit values('20224703008', 'YBS259', 100,84,NULL,NULL,'1', '003')
insert into ders_kayit values('20224703008', 'YBS261', 95,90,NULL,NULL,'1', '003')
insert into ders_kayit values('20224703008', 'YBS263', 94,92,NULL,NULL,'1', '003')
insert into ders_kayit values('20224703008', 'YBS265', 80,90,NULL,NULL,'1', '003')

/*2. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000001', 'YBS151', 90,90,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000001', 'YBS153', 75,85,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000001', 'YBS155', 75,85,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000001', 'YBS157', 68,86,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000001', 'YBS159', 90,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000001', 'TDB101', 75,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000001', 'YBD101', 85,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000001', 'KPD101', 78,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000001', 'ATA101', 100,100,NULL,NULL,'1', '001')

/*2. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000001', 'YBS152', 68,86,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000001', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000001', 'YBS156', 86,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000001', 'YBS158', 69,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000001', 'YBS160', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000001', 'TDB102', 80,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000001', 'YBD102', 65,59,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000001', 'ATA102', 59,90,NULL,NULL,'1', '002')

/*2. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000001', 'YBS251', 92,96,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000001', 'YBS253', 68,86,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000001', 'YBS255', 78,87,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000001', 'YBS257', 57,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000001', 'YBS259', 100,100,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000001', 'YBS261', 59,95,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000001', 'YBS263', 49,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000001', 'YBS265', 90,80,NULL,NULL,'1', '003')

/*3. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000002', 'YBS151', 65,56,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000002', 'YBS153', 58,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000002', 'YBS155', 75,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000002', 'YBS157', 68,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000002', 'YBS159', 53,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000002', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000002', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000002', 'KPD101', 59,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000002', 'ATA101', 60,69,NULL,NULL,'1', '001')

/*3. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000002', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000002', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000002', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000002', 'YBS158', 69,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000002', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000002', 'TDB102', 60,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000002', 'YBD102', 65,59,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000002', 'ATA102', 59,90,NULL,NULL,'1', '002')

/*3. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000002', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000002', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000002', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000002', 'YBS257', 57,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000002', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000002', 'YBS261', 59,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000002', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000002', 'YBS265', 80,80,NULL,NULL,'1', '003')

/*4. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000003', 'YBS151', 75,57,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000003', 'YBS153', 85,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000003', 'YBS155', 96,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000003', 'YBS157', 65,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000003', 'YBS159', 75,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000003', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000003', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000003', 'KPD101', 59,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000003', 'ATA101', 60,69,NULL,NULL,'1', '001')

/*4. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000003', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000003', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000003', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000003', 'YBS158', 69,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000003', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000003', 'TDB102', 60,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000003', 'YBD102', 65,59,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000003', 'ATA102', 95,90,NULL,NULL,'1', '002')

/*4. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000003', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000003', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000003', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000003', 'YBS257', 75,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000003', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000003', 'YBS261', 59,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000003', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000003', 'YBS265', 80,80,NULL,NULL,'1', '003')

/*5. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000004', 'YBS151', 90,90,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000004', 'YBS153', 75,85,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000004', 'YBS155', 75,85,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000004', 'YBS157', 68,86,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000004', 'YBS159', 90,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000004', 'TDB101', 75,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000004', 'YBD101', 85,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000004', 'KPD101', 78,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000004', 'ATA101', 68,86,NULL,NULL,'1', '001')

/*5. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000004', 'YBS152', 68,86,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000004', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000004', 'YBS156', 86,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000004', 'YBS158', 69,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000004', 'YBS160', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000004', 'TDB102', 80,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000004', 'YBD102', 65,59,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000004', 'ATA102', 59,90,NULL,NULL,'1', '002')

/*5. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000004', 'YBS251', 92,96,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000004', 'YBS253', 68,86,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000004', 'YBS255', 78,87,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000004', 'YBS257', 57,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000004', 'YBS259', 75,95,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000004', 'YBS261', 59,95,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000004', 'YBS263', 49,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000004', 'YBS265', 90,80,NULL,NULL,'1', '003')

/*6. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000005', 'YBS151', 65,56,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000005', 'YBS153', 82,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000005', 'YBS155', 75,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000005', 'YBS157', 68,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000005', 'YBS159', 65,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000005', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000005', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000005', 'KPD101', 59,84,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000005', 'ATA101', 85,69,NULL,NULL,'1', '001')

/*6. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000005', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000005', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000005', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000005', 'YBS158', 69,79,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000005', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000005', 'TDB102', 60,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000005', 'YBD102', 65,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000005', 'ATA102', 62,90,NULL,NULL,'1', '002')

/*6. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000005', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000005', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000005', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000005', 'YBS257', 75,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000005', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000005', 'YBS261', 95,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000005', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000005', 'YBS265', 80,80,NULL,NULL,'1', '003')

/*7. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000006', 'YBS151', 75,57,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000006', 'YBS153', 85,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000006', 'YBS155', 96,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000006', 'YBS157', 65,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000006', 'YBS159', 75,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000006', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000006', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000006', 'KPD101', 59,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000006', 'ATA101', 60,69,NULL,NULL,'1', '001')

/*7. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000006', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000006', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000006', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000006', 'YBS158', 69,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000006', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000006', 'TDB102', 60,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000006', 'YBD102', 65,59,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000006', 'ATA102', 95,90,NULL,NULL,'1', '002')

/*7. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000006', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000006', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000006', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000006', 'YBS257', 75,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000006', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000006', 'YBS261', 59,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000006', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000006', 'YBS265', 80,80,NULL,NULL,'1', '003')

/*8. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000007', 'YBS151', 75,57,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000007', 'YBS153', 85,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000007', 'YBS155', 96,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000007', 'YBS157', 65,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000007', 'YBS159', 75,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000007', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000007', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000007', 'KPD101', 59,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000007', 'ATA101', 60,69,NULL,NULL,'1', '001')

/*8. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000007', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000007', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000007', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000007', 'YBS158', 69,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000007', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000007', 'TDB102', 60,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000007', 'YBD102', 65,59,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000007', 'ATA102', 95,90,NULL,NULL,'1', '002')

/*8. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000007', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000007', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000007', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000007', 'YBS257', 75,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000007', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000007', 'YBS261', 59,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000007', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000007', 'YBS265', 80,80,NULL,NULL,'1', '003')

/*9. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000008', 'YBS151', 65,56,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000008', 'YBS153', 82,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000008', 'YBS155', 75,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000008', 'YBS157', 68,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000008', 'YBS159', 65,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000008', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000008', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000008', 'KPD101', 59,84,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000008', 'ATA101', 85,69,NULL,NULL,'1', '001')

/*9. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000008', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000008', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000008', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000008', 'YBS158', 69,79,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000008', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000008', 'TDB102', 60,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000008', 'YBD102', 65,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000008', 'ATA102', 62,90,NULL,NULL,'1', '002')

/*9. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000008', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000008', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000008', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000008', 'YBS257', 75,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000008', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000008', 'YBS261', 95,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000008', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000008', 'YBS265', 80,80,NULL,NULL,'1', '003')

/*10. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000009', 'YBS151', 75,57,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000009', 'YBS153', 85,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000009', 'YBS155', 96,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000009', 'YBS157', 65,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000009', 'YBS159', 75,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000009', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000009', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000009', 'KPD101', 59,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000009', 'ATA101', 60,69,NULL,NULL,'1', '001')

/*10. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000009', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000009', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000009', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000009', 'YBS158', 69,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000009', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000009', 'TDB102', 60,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000009', 'YBD102', 65,59,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000009', 'ATA102', 95,90,NULL,NULL,'1', '002')

/*10. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000009', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000009', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000009', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000009', 'YBS257', 75,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000009', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000009', 'YBS261', 59,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000009', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000009', 'YBS265', 80,80,NULL,NULL,'1', '003')

---------------------------------------------------------------------------------

/*11. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000010', 'YBS151', 75,57,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000010', 'YBS153', 85,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000010', 'YBS155', 96,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000010', 'YBS157', 65,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000010', 'YBS159', 75,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000010', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000010', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000010', 'KPD101', 59,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000010', 'ATA101', 60,69,NULL,NULL,'1', '001')

/*11. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000010', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000010', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000010', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000010', 'YBS158', 69,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000010', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000010', 'TDB102', 60,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000010', 'YBD102', 65,59,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000010', 'ATA102', 95,90,NULL,NULL,'1', '002')

/*11. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000010', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000010', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000010', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000010', 'YBS257', 75,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000010', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000010', 'YBS261', 59,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000010', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000010', 'YBS265', 80,80,NULL,NULL,'1', '003')

/*12. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000011', 'YBS151', 75,57,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000011', 'YBS153', 85,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000011', 'YBS155', 96,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000011', 'YBS157', 65,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000011', 'YBS159', 75,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000011', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000011', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000011', 'KPD101', 59,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000011', 'ATA101', 60,69,NULL,NULL,'1', '001')

/*12. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000011', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000011', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000011', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000011', 'YBS158', 69,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000011', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000011', 'TDB102', 60,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000011', 'YBD102', 65,59,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000011', 'ATA102', 95,90,NULL,NULL,'1', '002')

/*12. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000011', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000011', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000011', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000011', 'YBS257', 75,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000011', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000011', 'YBS261', 59,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000011', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000011', 'YBS265', 80,80,NULL,NULL,'1', '003')

/*13. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000012', 'YBS151', 65,56,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000012', 'YBS153', 82,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000012', 'YBS155', 75,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000012', 'YBS157', 68,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000012', 'YBS159', 65,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000012', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000012', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000012', 'KPD101', 59,84,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000012', 'ATA101', 85,69,NULL,NULL,'1', '001')

/*13. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000012', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000012', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000012', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000012', 'YBS158', 69,79,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000012', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000012', 'TDB102', 60,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000012', 'YBD102', 65,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000012', 'ATA102', 62,90,NULL,NULL,'1', '002')

/*13. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000012', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000012', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000012', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000012', 'YBS257', 75,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000012', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000012', 'YBS261', 95,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000012', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000012', 'YBS265', 80,80,NULL,NULL,'1', '003')

/*14. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000013', 'YBS151', 75,57,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000013', 'YBS153', 85,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000013', 'YBS155', 96,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000013', 'YBS157', 65,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000013', 'YBS159', 75,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000013', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000013', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000013', 'KPD101', 59,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000013', 'ATA101', 60,69,NULL,NULL,'1', '001')

/*14. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000013', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000013', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000013', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000013', 'YBS158', 69,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000013', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000013', 'TDB102', 60,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000013', 'YBD102', 65,59,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000013', 'ATA102', 95,90,NULL,NULL,'1', '002')

/*14. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000013', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000013', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000013', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000013', 'YBS257', 75,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000013', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000013', 'YBS261', 59,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000013', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000013', 'YBS265', 80,80,NULL,NULL,'1', '003')

/*15. OGRENCI 1. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000014', 'YBS151', 75,57,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000014', 'YBS153', 85,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000014', 'YBS155', 96,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000014', 'YBS157', 65,65,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000014', 'YBS159', 75,70,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000014', 'TDB101', 65,75,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000014', 'YBD101', 58,58,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000014', 'KPD101', 59,69,NULL,NULL,'1', '001')
insert into ders_kayit values('20220000014', 'ATA101', 60,69,NULL,NULL,'1', '001')

/*15. OGRENCI 2. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000014', 'YBS152', 59,69,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000014', 'YBS154', 75,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000014', 'YBS156', 68,78,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000014', 'YBS158', 69,85,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000014', 'YBS160', 75,57,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000014', 'TDB102', 60,58,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000014', 'YBD102', 65,59,NULL,NULL,'1', '002')
insert into ders_kayit values('20220000014', 'ATA102', 95,90,NULL,NULL,'1', '002')

/*15. OGRENCI 3. DONEM ders kayit veri giri�i*/
insert into ders_kayit values('20220000014', 'YBS251', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000014', 'YBS253', 68,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000014', 'YBS255', 78,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000014', 'YBS257', 75,75,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000014', 'YBS259', 80,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000014', 'YBS261', 59,80,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000014', 'YBS263', 70,94,NULL,NULL,'1', '003')
insert into ders_kayit values('20220000014', 'YBS265', 80,80,NULL,NULL,'1', '003')
/* t�m �dev bitti */


/*02,04,2024 tarihli ders

DCL - veri kontrol dili

GRANT komutu - veri taban� ve nesneler �zerinde izinler vermek i�in kullan�l�r.
grant(all veya izinler) on(nesne veya veritaban�) to (kullan�c�)
grant crate table TO deneme
grant select ON ders_kayit TO hasanali
grant all ON ders_kayit TO hasanali
grant update, delete, select ON ders_kayit TO hasanali
***login olu�turmaya da bak***

DENY komutu - veri taban� ve nesneler �zerinde engellemeler koyma i�in kullan�l�r.
deny grantten hiyerar�ik olarak �sttedir.
deny(all veya izinler) on(nesne veya veritaban�) to (kullan�c�)
deny crate table TO deneme
deny select ON ders_kayit TO hasanali
deny all ON ders_kayit TO hasanali
deny update, delete, select ON ders_kayit TO hasanali

REVOKE komutu - veri taban� ve nesneler �zerinde izin ve engellemeleri iptal etmek i�in kullan�l�r.
revoke (all veya izinler) on(nesne veya veritaban�) to (kullan�c�)
revoke crate table TO deneme
revoke select ON ders_kayit TO hasanali
revoke all ON ders_kayit TO hasanali
revoke update, delete, select ON ders_kayit TO hasanali*/

/* SELECT komutu 

select * from ders
select ders_kod,ders_ad,akts from ders
select ogr_no from ders_kayit

distinc select te sorgu yap�lan kay�tta birden �ok veri d�nerse bunu teke indirmek i�in kullan�l�r
select distinc(ogr_no) from ders_kayit - ders kayd� yapan ��renciler
select distinc(sicil) from ders_personel - derse giren personeller
order by - s�ralama
select * from fakulte order by f_ad - fakulteleri ad�na g�re s�rala
select * from ders_kayit order by final - final notlar�na g�re s�ralar(defaultta  k���kten b�y��e)
select * from ders_kayit order by final desc - �imdi b�y�kten k����e s�ralar
select * from kimlik order by ad - kimlik tablosunu ada g�re s�rala
select * from kimlik order by ad, s_ad - kimlik tablosunu ada sonra soyada g�re alfabetik  s�rala
select * from kimlik order by ad desc, s_ad desc - kimlik tablosunu ada sonra soyada g�re ters alfabetik  s�rala

select * from ders where yyil=5 order by ders_ad - ders tablosundan 5. d�nem dersleri getir ve ders ad�na g�re s�rala

S�TUNLAR ���N (g�rsel olarak) takma isim kullanma  AS komutu

select tc_kimlik, ad,s_ad,d_tarih from kimlik order by d_tarih desc 
select tc_kimlik as [Kimlik Numaras�], ad as Ad�,s_ad as Soyad�,d_tarih as [Do�um Tarihi] from kimlik order by d_tarih desc 

select ders_kod as [Dersin Ad�],ders_ad as [Dersin Ad�],akts as AKTS from ders

MATEMAT�KSEL ��LEMLER
select ogr_no, ders_kod, vize, final from ders_kayit
select ogr_no, ders_kod, vize*0.4+final*0.6 as ORTALAMA from ders_kayit
select ogr_no, ders_kod, vize*0.4+final*0.6 as ORTALAMA from ders_kayit where ders_kod='YBS156' and vize > 70

ALFASAYISAL VER� s�tunlar�n birle�tirilmesi
select tc_kimlik, ad+" "+s_ad as [Ad-Soyad] from kimlik

KO�ULA ba�l� sorgulamalar
select * from ders_kayit where vize<65 and ders_kod='ATA102'
select * from ders_kayit where vize>65 or ders_kod='ATA102'
select * from ders_kayit where vize<>65 or ders_kod='ATA102'

TAR�H KO�ULU

select * from kimlik where d_tarih>'2002-11-06'
select * from kimlik where d_tarih<'2002-11-06'
select * from kimlik where d_tarih='2002-11-06'

NOT �n�ne geldi�i de�erin tersini yapar
select * from ders_kayit where not vize = 65 */
 

 /* vize sonras� hafta*/

 /* string fonksiyomnlar*/
 /* in komutu between komutu like komutu % operat�r� substring ve  kullan�m�*/
 select * from ogr_kayit
 select * from kimlik where ad like 'a%' /* ad� a ile ba�layan*/
 select * from kimlik where ad like '%a' /* ad� a ile biten*/
 select * from kimlik where ad like '%a%' /* ad�nda a bulunan*/
 select * from kimlik where ad like 'a____' /*ad� a ile ba�lay�p sonra 4 karakteri olan yani 5 harfli a ile ba�layan*/

 select SUBSTRING (ad,1,5) from kimlik /* kesip almaya yarar kimlik tablosunda ki t�m adlar�n  1-5 karakterleri aras�n� al�r*/
 select substring (ogr_no,1,4), ders_kod, vize from ders_kayit /* ders_kayit tablosundan ��renci nosunun kay�t y�l� k�sm�n� ve notlar� getirdik.*/
 select upper(ad) from kimlik /* kimlik tablosundan ad verilerini buyuk harfli d�nd�r�r*/
 select lower (ad) from kimlik /* kimlik tablosundan ad verilerini kucuk harfli d�nd�r�r*/
 select rtrim(ltrim(ad)) from kimlik /*bo�luklar� atar rtim sa�dan ltrim soldan*/
 select ad,s_ad from kimlik
 select ad,LEN(ad) as [Ad uzunluk],s_ad, len(s_ad) as [Soyad uzunluk] from kimlik /* len string verinin uzunlu�unu verir*/
 select replace(ad,'a','b') from kimlik /* verinin g�sterimini de�i�tirir ad da bulunan a lar�n hepsini b yapt�k*/
 select ogr_no, ders_kod, vize, final, replace(ders_durum_no, '1', 'Ge�ti') as durum from ders_kayit /* bu sekilde 1 olan verileri ge�ti olarak g�sterdik*/
 select bolum_ad, replace(f_no, '001', 'UBF') from bolum /* bolum tablosunda f_no su 1 olanlar� ubf �eklinde g�sterdik*/
 /* as s�tun ba�l�klar�n�n g�sterimini de�i�tirir replace ise veririn g�sterimini de�i�tirir*/

 /* say�sal fonksiyonlar*/

 /* ABS komutu mutlak de�erini al�r yan� negatif say�lar� pozitife cevirir*/
 select ABS(-3) from fakulte /* kac fakulte varsa o kadar -3 � mutlak de�erini ald�. benim verilerimde - kay�t yok o yuzden*/
 /* floor ve celling a�a�� yuvarlama da floor yukar� yuvarlamada ceiling normal yuvarlamada ise round kullan�l�r*/
 select distinct(ogr_no), vize*0.4+final*0.6 as ORT, round(84.625,1) as yuvarlanm�� from ders_kayit where ders_kod='YBS265'
 select ogr_no, vize*0.4+final*0.6 as ORT, floor(vize*0.4+final*0.6) from ders_kayit
 select ogr_no, vize*0.4+final*0.6 as ORT, ceiling(vize*0.4+final*0.6) from ders_kayit

 /* power sqrt �ss� ve k�k�n� alma*/ 
 /* mod alma %*/
 select  POWER(2,3) from ders_kayit
 select  SQRT(9) from ders_kayit
 select  95%10 from ders_kayit

 /*charindex aranan de�erin ilk bulunan indexini d�nd�r�r */  select ad,CHARINDEX('a', ad) from kimlik

 /* min max en alt ve en �st kay�tlar� getirir*/

 /* select case e�er yap�s� denebilir*/

select *, case ders_durum_no when  '1' then 'ge�ti' when '0'  then 'Kald�' else 'hata' end from ders_kayit


/* vize sonras� 3. ders 07/05 */
/* min max kullan�m�*/ 
/*select ogr_no from ders_kayit where ders_kod='YBS151' and max(vize)*/ 
select max(vize*0.4+final*0.6) as ORT from ders_kayit where ders_kod='YBS151'

/* sum komutu*/ 
select sum(AKTS) from ders /* ders tablosunun AKTS ler toplam�*/ 

select min(vize)as M�N_V�ZE, max(final)as MAX_F�NAL, sum(vize*0.4+final*0.6)as ORT_TOPLAM from ders_kayit 

/* avg komutu - otalama hesaplar*/

select avg(final) as ORT from ders_kayit where ders_kod='YBS151'

/* count komutu - bir s�tunda ka� de�er oldugunu bulmak i�in*/

select count(distinct(ogr_no)) from ders_kayit /* ders kaydi yapan ��renciler*/

/* grupland�rma fonksiyonlar�*/ 
/* select ogr_no from ders_kayit where ders_kod='YBS151' and group by ogr_no vize = having max(vize)   buraya tekrar bak */

select min(vize) , ders_kod from ders_kayit group by ders_kod
select avg(vize) as ORT , ders_kod from ders_kayit group by ders_kod
select ogr_no , avg(vize*0.4+final*0.6) as ORT from ders_kayit where ders_kod='YBS151' group by ogr_no order by ORT desc /* */
 /* gruplanacak fonksiyonlar max min sum avg ve count*/

 select ders_kod , avg (vize*0.4+final*0.6) as ORT , count(*) as K�S�SAYISI from ders_kayit group by ders_kod order by ORT desc

 select * from fakulte
 select f_adres from fakulte group by f_adres
 select yyil as YARIYIL, count (ders_kod) as DersSay�s�, sum(AKTS) as DersAKTS from ders group by yyil

 /* having komutu*/ 
 /* grupland�rma yap�l�rken �art fonksiyona ba�l� ise where ile de�il having ile �art yaz�l�r*/

 select ders_kod from ders_kayit
 select ders_kod from ders_kayit where ders_kod = 'YBS151' group by ders_kod
 select ders_kod, avg(vize*0.4+final*0.6) as  ORT from ders_kayit group by ders_kod having avg(vize*0.4+final*0.6)>70
 select bolum_no , count(sicil) from personel group by bolum_no
  select bolum_no, count(sicil) as SAYI  from personel group by bolum_no having count(sicil)>5


  /* tarih fonksiyonlar�*/
  select SYSDATETIME() as TAR�H
  select SYSDATETIMEOFFSET() as TAR�H /* meridyen belirtkeli saast*/
  select DATENAME(weekday, getdate()) as G�N
    select DATENAME(week, getdate()) as HAFTA
	  select DATENAME(MONTH, getdate()) as AY
	    select DATENAME(YEAR, getdate()) as YIL
			select DATENAME(DAYOFYEAR, getdate()) as y�l�nincig�n�

/* cast tip d�n���m�*/
/* select cast ('B�LG�SAYAR'  burada kald�m*/ 
/* having ve group by s�navda sorar�m sordugumu anlamazs�n�z dedi*/

/*14.05.2024 tarihli ders*/
/* tablo birle�tirme */

/* join ile tablo birle�tirerek birden fazla tqabloda sorgu yapma*/

select * from kimlik,ogr_kayit /* birden fazla tablodan t�m verileri cektik*/
select * from kimlik inner join ogr_kayit on kimlik.tc_kimlik=ogr_kayit.tc_kimlik /* burda ise ogr_kayit tablosunda tcsi 
kimlik tablosunda tc ye e�it olanlar yani ��renciler geldi*/
select ogr_kayit.ogr_no, kimlik. tc_kimlik, kimlik.ad, kimlik.s_ad from kimlik inner join ogr_kayit on kimlik.tc_kimlik=ogr_kayit.tc_kimlik
/* yukarda ise t�m alanlar� de�il sadece belli alanlar� cektik*/

/*select ogr_kayit.ogr_no, kimlik.tc_kimlik, kimlik.ad, kimlik.s_ad from kimlik inner join ogr_kayit where 
kimlik.tc_kimlik=ogr_kayit.tc_kimlik*/

/* full outer join left outer join right outer join*/
select * from kimlik left outer join ogr_kayit on kimlik.tc_kimlik=ogr_kayit.tc_kimlik
select * from kimlik right outer join ogr_kayit on kimlik.tc_kimlik=ogr_kayit.tc_kimlik
select * from kimlik full outer join ogr_kayit on kimlik.tc_kimlik=ogr_kayit.tc_kimlik
select * from kimlik join ogr_kayit on kimlik.tc_kimlik=ogr_kayit.tc_kimlik

select * from personel, unvan, kimlik 
select * from kimlik join personel on kimlik.tc_kimlik=personel.tc_kimlik join unvan on personel.unvan_no=unvan.unvan_no

select personel.sicil, unvan.unvan_ad, kimlik.ad, kimlik.s_ad from kimlik join personel on 
kimlik.tc_kimlik=personel.tc_kimlik join unvan on personel.unvan_no=unvan.unvan_no where unvan.unvan_ad='PROFES�R DOKTOR'/* join metod*/

select personel.sicil, unvan.unvan_ad, kimlik.ad, kimlik.s_ad from kimlik, personel, unvan where
kimlik.tc_kimlik=personel.tc_kimlik and personel.unvan_no=unvan.unvan_no/* noktal� metod*/

select ders.ders_kod, ders.ders_ad, ders.t, ders.u, ders.k, bolum.bolum_ad from donem join ders_kayit on 
donem.donem_no=ders_kayit.donem_no join ders on ders_kayit.ders_kod  = ders.ders_kod 
join bolum on ders.bolum_no=bolum.bolum_no where donem.donem='2023-2024 G�Z' group by ders.ders_kod, ders.ders_ad, ders.t, ders.u, 
ders.k, bolum.bolum_ad

select de.ders_kod, de.ders_ad,de.akts, dk.vize, dk.final, do.donem from ogr_kayit ok join ders_kayit dk on 
ok.ogr_no=dk.ogr_no join donem do on do.donem_no=dk.donem_no join ders de on de.ders_kod=dk.ders_kod where 
dk.ogr_no='20224703008' group by de.ders_kod, de.ders_ad,de.akts, dk.vize, dk.final, do.donem/* join*/

select de.ders_kod, de.ders_ad,de.akts, dk.vize, dk.final, do.donem from ogr_kayit ok, ders_kayit dk, donem do, ders de
where ok.ogr_no=dk.ogr_no and do.donem_no=dk.donem_no and de.ders_kod=dk.ders_kod and ok.ogr_no='20224703008'
group by de.ders_kod, de.ders_ad,de.akts, dk.vize, dk.final, do.donem/* noktal� metod*/

select de.ders_kod,de.ders_ad from ders de join ders_personel  dp on de.ders_kod=dp.ders_kod join donem do on dp.donem_no=do.donem_no
join personel pe on dp.sicil = pe.sicil join unvan un on pe.unvan_no=un.unvan_no join kimlik k on 
pe.tc_kimlik=k.tc_kimlik where un.unvan_ad='DO�ENT DOKTOR' and k.ad='Kerim K�r�at' and k.s_ad='�EV�K' and 
do.donem='2023-2024 BAHAR'/* do�.dr kerim k�r�at �evik in 2023/2024 bahar d�neminde girdi�i dersler  join li*/

select de.ders_kod,de.ders_ad from ders de,ders_personel  dp, donem do, personel pe, unvan un, kimlik k where 
de.ders_kod=dp.ders_kod and dp.donem_no=do.donem_no and dp.sicil=pe.sicil and pe.unvan_no=un.unvan_no and 
pe.tc_kimlik=k.tc_kimlik and un.unvan_ad='DO�ENT DOKTOR' and k.ad='Kerim K�r�at' and k.s_ad='�EV�K' and 
do.donem='2023-2024 BAHAR'/* noktal� metod*/

/* 21 may�s dersi*/
/* k�r�at �evi�in girdi�i dersleredn 90 ve �zeri alan ��rencilerin ��renci no ad soyad listeleyen sordu*/

/*select ok.ogr_no from personel per, ders_personel dp, unvan un, donem do, ders_kayit dk, ogr_kayit ok where 
per.sicil='0013' and  buras� eksik kald�*/



select * from kimlik k, personel pe, unvan un, alan a, bolum bol, fakulte fak where k.tc_kimlik=pe.tc_kimlik and
pe.unvan_no = un.unvan_no and pe.alan_no = a.alan_no and pe.bolum_no = bol.bolum_no and bol.f_no = fak.f_no and
fak.f_ad = 'UYGULAMALI B�L�MLER FAK�LTES�' and bol.bolum_ad = 'Y�NET�M B�L���M S�STEMLER�'
/* uygulamal� bilimler fak�ltesi ybs b�l�m� hocalar�n� hocalar�n� g�ster*/


/* inselect komutu*/ 
/* e�er birden fazla tablodan veri ceker ama tek tablodan veri g�sterirsek inselect kullan�labilir.*/ 
select ad, s_ad, tc_kimlik from kimlik where tc_kimlik in (select tc_kimlik from personel)
/* personel tablosunda ki tckimlik leri kimlik tablosundan i�i�e sorgu yoluyla �ektik*/ 
/* dikkat edilecek husus tek tablodan veri g�sterdik*/

select * from ogr_kayit where bolum_no in (select bolum_no from bolum where bolum_ad = 'Y�NET�M B�L���M S�STEMLER�')
/* ybs de okuyan ��rencilerin kay�tlar�*/

select * from kimlik where tc_kimlik in(select tc_kimlik from ogr_kayit where bolum_no 
in(select bolum_no from bolum where bolum_ad = 'Y�NET�M B�L���M S�STEMLER�'))
/* ybs ��rencilerinin kimlik bilgilerinin g�sterilmesi*/



select * from kimlik where tc_kimlik in(select tc_kimlik from personel where bolum_no in(select bolum_no from bolum
where bolum_ad = 'Y�NET�M B�L���M S�STEMLER�' and bolum_no in(select bolum_no from fakulte 
where f_ad = 'UYGULAMALI B�L�MLER FAK�LTES�')))
/* ubf-ybs bolumundeki personellerin listelenmesi*/


select * from kimlik where tc_kimlik in(select tc_kimlik from personel where bolum_no in(select bolum_no from bolum
where bolum_ad = 'Y�NET�M B�L���M S�STEMLER�' and 
unvan_no in(select unvan_no from unvan where unvan_ad = 'DO�ENT DOKTOR')))
/* ybs de ki do� dr. olan personellerin listelenmesi*/


select * from kimlik where tc_kimlik in(select tc_kimlik from ogr_kayit where ogr_no in(select ogr_no from ders_kayit
where donem_no in( select donem_no from donem where donem='2023-2024 G�Z') and ders_kod in(select ders_kod from ders
where ders_ad = 'Veritaban�na Giri�')))
/* 2023-2024 g�z d�neminde vtys dersine gire ��rencilerin listesi*/


select * from kimlik where tc_kimlik in(select tc_kimlik from ogr_kayit where ogr_no in(select ogr_no from ders_kayit
where donem_no in( select donem_no from donem where donem='2023-2024 G�Z') and ders_kod in(select ders_kod from ders
where ders_ad = 'Veritaban�na Giri�')and vize*0.4+final*0.6>=80))
/*2023-2024 g�z d�neminde  veritaban�na giri� dersinden 80 ortalaman�n �st�nde olan ��renciler listesi)


