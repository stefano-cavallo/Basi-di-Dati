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
    Dipartimento varchar(30),
    Nome varchar(30) not null,
    Cognome varchar(30) not null,
    Data_nascita date not null,
    Codice_fiscale char(16),
    Foto blob,
    primary key(Matricola,Codice_fiscale)
    );

DROP TABLE if exists Modulo;
CREATE TABLE Modulo(
    Codice numeric(6) check(Codice>0) primary key,
    Nome varchar(30) not null,
    Descrizione varchar(30),
    CFU numeric(2) not null
    );

DROP TABLE if exists Esame;
CREATE TABLE Esame(
    Matricola_Studente numeric(6) check(Matricola_Studente>0),
    Codice_Modulo numeric(6) check(Codice_Modulo>0),
    Matricola_Docente numeric(6) check(Matricola_Docente>0),
    Data date,
    Voto numeric(2) check(Voto >=18 And Voto <=30),
    Note varchar(30),
    primary key(Matricola_Studente,Matricola_Docente)
    );

DROP TABLE if exists Corso_Laurea;
CREATE TABLE Corso_Laurea(
  Codice numeric(6) check(Codice>0) primary key,
  Nome varchar(30) not null,
  Descrizione varchar(30)
);

DROP TABLE if exists Dipartimento;
CREATE TABLE Dipartimento(
  Codice numeric(6) check(Codice>0) primary key,
  Nome varchar(30) not null
);

DROP TABLE if exists Sede;
CREATE TABLE Sede(
  Codice numeric(6) check(Codice>0) primary key,
  Indirizzo varchar(30),
  Citta varchar(30) unique
);

DROP TABLE if exists Sede_Dipartimento;
CREATE TABLE Sede_Dipartimento(
  Codice_Sede numeric(6) references Sede(Codice) on delete no action on update cascade,
  Codice_Dipartimento numeric(6) references Dipartimento(Codice) on delete no action on update cascade,
  Note varchar(30),
  primary key(Codice_Sede,Codice_Dipartimento)
);


INSERT INTO Studente
    values(696976,'Informatica ICD Taranto','Stefano','Cavallo','1996-07-21','CVLSFN96L21F152S',NULL);
INSERT INTO Docente
    values(659822,'Università degli studi di Ba','Aldo','Rossi','1981-05-21','DFFDDN96L51F152S',NULL);
INSERT INTO Modulo
    values(584744,'BDD','Basi di dati',9);
INSERT INTO Modulo
    values(580084,'IG','Ingegneria',12);
INSERT INTO Esame
    values(696976,580084,659822,'2020-01-21',25,'Ottimo esame');
INSERT INTO Corso_Laurea
    values(688000,'Informatica ICD Taranto','Laurea Informatica');
INSERT INTO Dipartimento
    values(111964,'Uniba');
INSERT INTO Sede
    values(690906,'via Brindisi','Taranto');
INSERT INTO Sede_Dipartimento
    values(690906,111964,'Laurea triennale');
