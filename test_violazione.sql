USE Universita;

INSERT INTO Studente
    values(999999,'Medicina','Aldo','Bianchi','1994-08-11','ASDSHN96L21F240K',NULL);
INSERT INTO Docente
    values(540222,'Università Roma','Rosa','Surri','1970-05-13','DFFDDN96L51D111P',NULL);
INSERT INTO Modulo
    values(698544,'CCC','Calcolo',6);
INSERT INTO Modulo
    values(580083,'MD','Matematica',9);
INSERT INTO Esame
    values(999999,580083,540222,'2020-01-21',17,'Ottimo esame');
INSERT INTO Corso_Laurea
    values(502130,'NULL','Laurea Medicina');
INSERT INTO Dipartimento
    values(658911,'Uniba');
INSERT INTO Sede
    values(541055,'via Roma','Rosa');
INSERT INTO Sede_Dipartimento
    values(541055,658911,'Laurea M.');
