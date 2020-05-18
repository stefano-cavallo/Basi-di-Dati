CREATE DATABASE if not exists Universita;

USE Universita;

DROP TABLE if exists Studente;
CREATE TABLE Studente(
    Matricola numeric(6) check(Matricola>0),
    Corso_Laurea varchar(30),
    Nome varchar(30) not null,
    Cognome varchar(30) not null,
    Data_nascita date not null,
    Codice_fiscale char(16),
    Foto blob,
    primary key(Matricola,Codice_fiscale)
    );

DROP TABLE if exists Docente;
CREATE TABLE Docente(
    Matricola numeric(6) check(Matricola>0),
    Dipartimento varchar(100),
    Nome varchar(30) not null,
    Cognome varchar(30) not null,
    Data_nascita date not null,
    Codice_fiscale char(16),
    Foto blob,
    primary key(Matricola,Codice_fiscale)
    );

DROP TABLE if exists Modulo;
CREATE TABLE Modulo(
    Codice varchar(10) not null,
    Nome varchar(30) primary key,
    Descrizione varchar(30),
    CFU numeric(2) not null
    );

DROP TABLE if exists Esame;
CREATE TABLE Esame(
    Matricola_Studente numeric(6) check(Matricola_Studente>0),
    Codice_Modulo varchar(10),
    Matricola_Docente numeric(6) check(Matricola_Docente>0),
    Data date,
    Voto numeric(2) check(Voto >=18 And Voto <=30),
    Note varchar(100),
    primary key(Matricola_Studente,Matricola_Docente)
    );

DROP TABLE if exists Corso_Laurea;
CREATE TABLE Corso_Laurea(
  Codice char(3) primary key,
  Nome varchar(30) not null,
  Descrizione varchar(80)
);

DROP TABLE if exists Dipartimento;
CREATE TABLE Dipartimento(
  Codice numeric(6) check(Codice>0) primary key,
  Nome varchar(30) not null
);

DROP TABLE if exists Sede;
CREATE TABLE Sede(
  Codice char(4) primary key,
  Indirizzo varchar(30),
  Citta varchar(30) unique
);

DROP TABLE if exists Sede_Dipartimento;
CREATE TABLE Sede_Dipartimento(
  Codice_Sede char(4) references Sede(Codice) on delete no action on update cascade,
  Codice_Dipartimento numeric(6) references Dipartimento(Codice) on delete no action on update cascade,
  Note varchar(30),
  primary key(Codice_Sede,Codice_Dipartimento)
);


INSERT INTO Studente
    values(696976,'AAA','Stefano','Cavallo','1996-07-21','CVLSFN96L21F152S',NULL);
INSERT INTO Studente
    values(123456,'ICD','Aldo','Boni','1987-05-01','ALDSGN87L01F187B',NULL);
INSERT INTO Studente
    values(975820,'ICD','Maria','Zecca','1974-12-31','MZECCE74F31F252S',NULL);
INSERT INTO Studente
    values(312011,'MMM','Lorenzo','Neri','1990-05-11','LONEZO90Z11A112F',NULL);
INSERT INTO Docente
    values(147963,'Architettura','Cristian','Ferrari','1957-03-12','CRFEES91R10K552S',NULL);
INSERT INTO Docente
    values(546001,'Biologia','Leonardo','Gallo','1991-10-02','LGLLER91R10K552S',NULL);
INSERT INTO Docente
    values(973156,'Chimica','Alessandro','Romano','1979-01-21','ALSRMA91R10P882S',NULL);
INSERT INTO Docente
    values(632588,'Informatica','Mattia','Ricci','1976-08-08','MTTRCC81C13K554S',NULL);
INSERT INTO Modulo
    values('BDD','BDD','Basi di dati',9);
INSERT INTO Modulo
    values('PPM','PPM','Progettazione',12);
INSERT INTO Modulo
    values('MET','METODI','Metodi osservazione',9);
INSERT INTO Modulo
    values('ING','INGEGNERIA','Ingegneria software',12);
INSERT INTO Esame
    values(696976,'BDD',147963,'2020-03-21',25,'Ottimo esame');
INSERT INTO Esame
    values(312011,'MET',632588,'2019-08-01',17,'Esame non superato');
INSERT INTO Esame
    values(975820,'ING',973156,'2018-07-15',30,'Ottimo esame, ok');
INSERT INTO Esame
    values(123456,'PPM',546001,'2020-01-25',28,'Esame superato');
INSERT INTO Corso_Laurea
    values('ICD','Informatica ICD Taranto','Laurea Informatica');
INSERT INTO Corso_Laurea
    values('ARC','Architettura','Laurea in architettura');
INSERT INTO Corso_Laurea
    values('OKL','Medicina','Laurea in medicina');
INSERT INTO Corso_Laurea
    values('MMM','Lingue','Laurea lingue orientali');
INSERT INTO Dipartimento
    values(111964,'Uniba');
INSERT INTO Dipartimento
    values(841066,'Med');
INSERT INTO Dipartimento
    values(312155,'Arch');
INSERT INTO Dipartimento
    values(478201,'Rom');
INSERT INTO Sede
    values('INFO','via Brindisi','Taranto');
INSERT INTO Sede
    values('MEDI','via Arco','Bari');
INSERT INTO Sede
    values('ARCH','via Montelupo','Roma');
INSERT INTO Sede
    values('LING','via Barchi','Brindisi');
INSERT INTO Sede_Dipartimento
    values('INFO',312155,'Sede universita');
INSERT INTO Sede_Dipartimento
    values('LING',478201,'Sede triennale');
INSERT INTO Sede_Dipartimento
    values('MEDI',111964,'Universita sede');
INSERT INTO Sede_Dipartimento
    values('ARCH',841066,'Sede di uni');
