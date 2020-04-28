CREATE TABLE Pracownicy ( 
PESEL varchar(11)  PRIMARY KEY CHECK (PESEL LIKE REPLICATE('[0-9]', 11)),
Imiê varchar(20) not null check (Imiê like REPLICATE( '[a-zA-¯]', LEN(Imiê))),
Nazwisko varchar(20) not null check (Nazwisko like REPLICATE( '[a-zA-¯]', LEN(Nazwisko))));

CREATE TABLE Gatunki(
Nazwa_gatunku varchar(30) PRIMARY KEY check (Nazwa_gatunku like REPLICATE( '[a-zA-¯ ]', LEN(Nazwa_gatunku))));

CREATE TABLE Wybiegi(  
Nr_wybiegu varchar(20) PRIMARY KEY,
Pole_powierzchni float not null check (Pole_powierzchni > 0),
Nazwa_Gatunku varchar(30) REFERENCES Gatunki
);

CREATE TABLE Zwierzêta (  
Imiê varchar(20)  PRIMARY KEY check (Imiê like REPLICATE( '[a-zA-¯]', LEN(Imiê))),
Nazwa_gatunku varchar (30) REFERENCES Gatunki not null,
Numer varchar(20) REFERENCES Wybiegi,
Data_urodzenia date not null,
Data_œmierci date);

CREATE TABLE Godziny ( 
Godzina  time PRIMARY KEY);

CREATE TABLE Diety ( 
Uwagi varchar(30) ,
Nr_Diety int identity(1,1)  PRIMARY KEY);

CREATE TABLE Sk³adniki(  
Nazwa_Sk³adnika varchar (20) PRIMARY KEY,
Obecny_stan float check(Obecny_stan>=0),
);

CREATE TABLE Pozycje_Diet (  
Nr_Diety int REFERENCES Diety,
Nazwa varchar (20) REFERENCES Sk³adniki,
Iloœæ smallint not null check (Iloœæ>0),
PRIMARY KEY(Nr_Diety, Nazwa),
);

CREATE TABLE Planowane_Posi³ki(
Imiê varchar (20) REFERENCES Zwierzêta,
Godzina time REFERENCES Godziny,
Nr_Diety int REFERENCES Diety,
PRIMARY KEY (Imiê, Nr_Diety, Godzina));

create table Karmienia(
Data date not null,
Imiê varchar (20),        
Godzina time ,
Nr_Diety int not null,
FOREIGN KEY (Imiê,Nr_Diety,Godzina)
  REFERENCES Planowane_Posi³ki(Imiê,Nr_Diety,Godzina),
  PESEL varchar(11) references Pracownicy not null,
PRIMARY KEY( Data, Godzina, Imiê));

create table Faktyczny_Stan(
Data date ,
Godzina time,
Imiê varchar(20),
foreign key (Data, Godzina, Imiê) references Karmienia,
Nr_Diety int ,
Nazwa varchar (20) ,
foreign key (Nr_Diety, Nazwa) references Pozycje_Diet,
Iloœæ_podanego_jedzenia float not null check (Iloœæ_podanego_jedzenia >=0),
primary key(Data, Nr_Diety, Nazwa, Imiê, Godzina),
);

create table Prac_Zwierz(
PESEL VARCHAR(11) references Pracownicy,
Imiê varchar (20) references Zwierzêta,
primary key(PESEL, Imiê));












