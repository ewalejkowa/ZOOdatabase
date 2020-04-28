CREATE TABLE Pracownicy ( 
PESEL varchar(11)  PRIMARY KEY CHECK (PESEL LIKE REPLICATE('[0-9]', 11)),
Imi� varchar(20) not null check (Imi� like REPLICATE( '[a-zA-�]', LEN(Imi�))),
Nazwisko varchar(20) not null check (Nazwisko like REPLICATE( '[a-zA-�]', LEN(Nazwisko))));

CREATE TABLE Gatunki(
Nazwa_gatunku varchar(30) PRIMARY KEY check (Nazwa_gatunku like REPLICATE( '[a-zA-� ]', LEN(Nazwa_gatunku))));

CREATE TABLE Wybiegi(  
Nr_wybiegu varchar(20) PRIMARY KEY,
Pole_powierzchni float not null check (Pole_powierzchni > 0),
Nazwa_Gatunku varchar(30) REFERENCES Gatunki
);

CREATE TABLE Zwierz�ta (  
Imi� varchar(20)  PRIMARY KEY check (Imi� like REPLICATE( '[a-zA-�]', LEN(Imi�))),
Nazwa_gatunku varchar (30) REFERENCES Gatunki not null,
Numer varchar(20) REFERENCES Wybiegi,
Data_urodzenia date not null,
Data_�mierci date);

CREATE TABLE Godziny ( 
Godzina  time PRIMARY KEY);

CREATE TABLE Diety ( 
Uwagi varchar(30) ,
Nr_Diety int identity(1,1)  PRIMARY KEY);

CREATE TABLE Sk�adniki(  
Nazwa_Sk�adnika varchar (20) PRIMARY KEY,
Obecny_stan float check(Obecny_stan>=0),
);

CREATE TABLE Pozycje_Diet (  
Nr_Diety int REFERENCES Diety,
Nazwa varchar (20) REFERENCES Sk�adniki,
Ilo�� smallint not null check (Ilo��>0),
PRIMARY KEY(Nr_Diety, Nazwa),
);

CREATE TABLE Planowane_Posi�ki(
Imi� varchar (20) REFERENCES Zwierz�ta,
Godzina time REFERENCES Godziny,
Nr_Diety int REFERENCES Diety,
PRIMARY KEY (Imi�, Nr_Diety, Godzina));

create table Karmienia(
Data date not null,
Imi� varchar (20),        
Godzina time ,
Nr_Diety int not null,
FOREIGN KEY (Imi�,Nr_Diety,Godzina)
  REFERENCES Planowane_Posi�ki(Imi�,Nr_Diety,Godzina),
  PESEL varchar(11) references Pracownicy not null,
PRIMARY KEY( Data, Godzina, Imi�));

create table Faktyczny_Stan(
Data date ,
Godzina time,
Imi� varchar(20),
foreign key (Data, Godzina, Imi�) references Karmienia,
Nr_Diety int ,
Nazwa varchar (20) ,
foreign key (Nr_Diety, Nazwa) references Pozycje_Diet,
Ilo��_podanego_jedzenia float not null check (Ilo��_podanego_jedzenia >=0),
primary key(Data, Nr_Diety, Nazwa, Imi�, Godzina),
);

create table Prac_Zwierz(
PESEL VARCHAR(11) references Pracownicy,
Imi� varchar (20) references Zwierz�ta,
primary key(PESEL, Imi�));












