/*
  1. PROJnome,descrizione(SEL CFU=9(Modulo))
  Restituisce la lista dei moduli(nome,descrizione) che hanno CFU=9
*/
select Nome,Descrizione
from Modulo
where CFU=9;

/*
  2.PROJMatricola,Nome,Cognome(SELEtà>60 (Docente))
  Restituisce la lista dei docenti(matricola,nome,cognome) che hanno più di 60 anni
*/
select Matricola,Nome,cognome
from Docente
where timestampdiff(year,Data_nascita, curdate())>60;


/*
  3.
  Restituisce la lista dei docenti(nome,cognome,nome di dipartimento), ordinati dal più piccolo al più grande
*/
select Nome, Cognome,Dipartimento
from Docente
order by Data_nascita desc;

/*
  4.PROJindirizzo,citta(JOIN codice=INFO(SEDE))
  Restituisce la lista della sede(indirizzo,citta) con il codice INFO
*/
select Indirizzo,citta
from Sede
where Codice='INFO';


/*
  5.Restituisce la lista del nome del dipartimento,la lista della citta e indirizzo per ogni sede e infine l'ordinamento del nome
  del dipartimento, la citta e infine l'indirizzo della sede
*/
select Dipartimento.Nome,Sede.Citta,Sede.Indirizzo
from Sede_Dipartimento JOIN Sede ON Sede_Dipartimento.Codice_Sede = Sede.Codice JOIN Dipartimento ON Dipartimento.Codice=Codice_Dipartimento
order by Dipartimento.Nome, Sede.Citta,Sede.Indirizzo;

/*
  6.
  Mostra il nome dei dipartimenti che hanno la sede a Bari
*/
select Dipartimento.Nome
from Sede_Dipartimento JOIN Sede ON Sede_Dipartimento.Codice_Sede=Sede.Codice JOIN Dipartimento ON Dipartimento.Codice=Codice_Dipartimento
where Citta="Bari";

/*
  7.Mostra il nome dei dipartimenti che non hanno la sede a Brindisi
*/
select Dipartimento.Nome
from Sede_Dipartimento JOIN Sede ON Sede_Dipartimento.Codice_Sede=Sede.Codice JOIN Dipartimento ON Dipartimento.Codice=Codice_Dipartimento
where Citta !="Brindisi";

/*
  8.Mostra la media, il numero degli esami sostenuti e il totale dei CFU dello studente con matricola 123456
*/
select avg(Esame.Voto) as MediaVoto,Count(*) as NumeroEsami,Sum(Modulo.CFU) as SommaCFU
from Studente JOIN Esame ON Studente.Matricola=Esame.Matricola_Studente JOIN Modulo ON Modulo.Codice=Codice_Modulo
where Matricola= 123456;

/*
  9.Mostra il nome,cognome,nome del corso di laurea, media e numeri esami sostenuti dallo studente con matricola 123456
*/
select Studente.Nome,Studente.Cognome,Studente.Corso_Laurea,avg(Esame.Voto) as MediaVoto,Count(*) as NumeroEsami
from Studente JOIN Esame ON Studente.Matricola=Esame.Matricola_Studente JOIN Modulo ON Modulo.Codice=Codice_Modulo
where Matricola = 123456;

/*
  10.Mostra il codice,nomme e voto medio di ogni modulo e subito dopo faccio l'ordinamento dalla media più alta a quella più bassa
*/
select Modulo.Codice,Modulo.Nome,avg(Esame.Voto) as Voti
from Modulo JOIN Esame ON Codice_Modulo = Codice
group by Modulo.Codice
order by Voti desc;

/*
  11.
*/

/*
  12.Mostra la matricola, il nome,il cognome, la data di nascita e la media con il numero degli esami sostenuti per ogni studente
*/
select Matricola,Nome,Cognome,Data_nascita,avg(Voto) as Media_Voti,Count(*) as Numero_Esami
from Studente JOIN Esame ON Matricola = Matricola_Studente
group by Matricola;

/*
13.Mostra la matrice, il nome,il cognome, la data di nascita e la media con il numero degli esami sostenuti per ogni studente del corso di Laurea
con codice 'ICD' e che abbia media maggiore di 27
*/
select Matricola,Nome,Cognome,Data_nascita,avg(Voto) as Media_Voti,Count(*) as Numero_Esami
from Studente JOIN Esame ON Studente.Matricola = Esame.Matricola_Studente
group by Matricola,Corso_Laurea
having Corso_Laurea='ICD' and Media_Voti>27;

/*
  14.Mostra il nome,cognome e data di nascita di tutti gli studenti che non hanno superato nessun esame
*/
select distinct Nome,Cognome,Data_nascita
from Studente
where not exists(select *
                  from Esame
                  where Matricola= Matricola_Studente);

/*
  15.Mostra la matricola di tutti gli studenti che hanno superato almeno un esame e hanno preso voti maggiori di 26
*/
select distinct Matricola
from Studente
where exists(select *
              from esame
              where Matricola= Matricola_Studente and Voto>26);

/*
  16.
*/

/*
  17.Mostra matricola , nome, cognome e voto di ogni studente che ha preso un voto maggiore della media nel modulo BDD
*/
select Matricola,Nome,Cognome,Voto
from Studente JOIN Esame ON Matricola = Matricola_Studente
where Codice_Modulo = 'BDD' and Voto >(select avg(Voto)
                              from Esame);
