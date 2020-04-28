---/pracownicy
insert into Pracownicy 
(Imiê, Nazwisko, PESEL) 
values ('Ewa', 'Lejk', 95051004509)

insert into Pracownicy 
(Imiê, Nazwisko, PESEL) 
values ('Jan', 'Nowak', 93051004509)

insert into Pracownicy 
(Imiê, Nazwisko, PESEL) 
values ('Piotr', 'Kowalski', 92051004509)

insert into Pracownicy 
(Imiê, Nazwisko, PESEL) 
values ('Anna', 'Zawadzka', 92031004509)

insert into Pracownicy 
(Imiê, Nazwisko, PESEL) 
values ('Joanna', 'Kowalska', 91051004509)

--/pracownicy-koniec

--/Gatunki
insert into Gatunki
(Nazwa_Gatunku)
values('S³oñ afrykañski')

insert into Gatunki
(Nazwa_Gatunku)
values('¯yrafa równikowa')

insert into Gatunki
(Nazwa_Gatunku)
values('Zebra równikowa')

insert into Gatunki
(Nazwa_Gatunku)
values('Wilk szary')

insert into Gatunki
(Nazwa_Gatunku)
values('Lew afrykañski')

insert into Gatunki
(Nazwa_Gatunku)
values('Tygrys azjatycki')

insert into Gatunki
(Nazwa_Gatunku)
values('Lemur kappa')

--/koniec zwierzêta

--/Wybiegi

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('A1', 20, ( 'Lemur kappa'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('C8', 100, ( 'S³oñ afrykañski'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('D12', 100, ('¯yrafa równikowa'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('SP2', 400, ('Zebra równikowa'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('C1', 100, ('Wilk szary'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('C2', 50, ('Lew afrykañski'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('D1', 100, ('Tygrys azjatycki'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni)
values ('G2', 30)

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni)
values ('G3', 100)

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni)
values ('G4', 20)

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni)
values ('N2', 80)


--/koniec wybiegi

insert into Zwierzêta
(Imiê, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Nina', '2001-12-31',( 'S³oñ afrykañski'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = 'S³oñ afrykañski'))

insert into Zwierzêta
(Imiê, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Stachu', '2002-02-11',('¯yrafa równikowa'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = '¯yrafa równikowa'))

insert into Zwierzêta
(Imiê, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Ala', '2012-12-31',( 'Zebra równikowa'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = 'Zebra równikowa'))

insert into Zwierzêta
(Imiê, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Zdzich', '2012-02-21',('Wilk szary'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = 'Wilk szary'))

insert into Zwierzêta
(Imiê, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Witek', '2014-03-31',('Lemur kappa'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = 'Lemur kappa'))

insert into Zwierzêta
(Imiê, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Ola', '2012-12-11',('Lemur kappa'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = 'Lemur kappa'))

--/zwierzêta koniec

--/Godziny

insert into Godziny
(Godzina)
values ('14:00:00')

insert into Godziny
(Godzina)
values ('06:00:00')

insert into Godziny
(Godzina)
values ('08:00:00')

insert into Godziny
(Godzina)
values ('12:30:00')

insert into Godziny
(Godzina)
values ('15:00:00')

insert into Godziny
(Godzina)
values ('18:00:00')

insert into Godziny
(Godzina)
values ('19:30:00')

--/koniec Godziny

--/Sk³adniki
insert into Sk³adniki 
(Nazwa_Sk³adnika, Obecny_stan)
values ('Trawa', 100)

insert into Sk³adniki 
(Nazwa_Sk³adnika, Obecny_stan)
values ('Banany', 50)

insert into Sk³adniki 
(Nazwa_Sk³adnika, Obecny_stan)
values ('Termity', 10)

insert into Sk³adniki 
(Nazwa_Sk³adnika, Obecny_stan)
values ('Mango', 20)

insert into Sk³adniki 
(Nazwa_Sk³adnika, Obecny_stan)
values ('Pomarañcze', 30)

insert into Sk³adniki 
(Nazwa_Sk³adnika, Obecny_stan)
values ('Liœcie bananowca', 20)

insert into Sk³adniki 
(Nazwa_Sk³adnika, Obecny_stan)
values ('Miêso wieprzowe', 50)

insert into Sk³adniki 
(Nazwa_Sk³adnika, Obecny_stan)
values ('Miêso drobiowe', 50)


--/koniec skadniki


--/Diety, Pozycje Diet, Planowane Posi³ki

insert into Diety(Uwagi) values (null)
	insert into Planowane_Posi³ki 
	(Imiê, Godzina, Nr_Diety)
	values (('Nina'),('14:00:00'), IDENT_CURRENT('Diety'))

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Iloœæ) 
	values (IDENT_CURRENT('Diety'),'Banany', 20)

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Iloœæ)
	values (IDENT_CURRENT('Diety'), 'Trawa', 50) 

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Iloœæ)
	values (IDENT_CURRENT('Diety'), 'Liœcie bananowca', 10)

insert into Diety(Uwagi) values(null)
	
	insert into Planowane_Posi³ki(Imiê, Godzina, Nr_Diety)
	values('Witek', '15:00:00', IDENT_CURRENT('Diety'))
	 
	insert into Planowane_Posi³ki(Imiê, Godzina, Nr_Diety)
	values('Ola', '15:00:00', IDENT_CURRENT('Diety'))

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Iloœæ)
	values (IDENT_CURRENT('Diety'),'Mango', 1)

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Iloœæ)
	values (IDENT_CURRENT('Diety'),'Banany', 1)

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Iloœæ)
	values (IDENT_CURRENT('Diety'),'Termity', 1)

insert into Diety(Uwagi) values(null)

	insert into Planowane_Posi³ki(Imiê, Godzina, Nr_Diety)
	values ('Stachu','19:30:00', IDENT_CURRENT('Diety'))

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Iloœæ)
	values(IDENT_CURRENT('Diety'), 'Trawa', 10)

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Iloœæ)
	values(IDENT_CURRENT('Diety'), 'Banany', 2)

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Iloœæ)
	values(IDENT_CURRENT('Diety'), 'Mango', 5)

insert into Diety(Uwagi) values (null)

	insert into Planowane_Posi³ki(Imiê, Godzina,Nr_Diety)
	values ('Ala', '06:00:00', IDENT_CURRENT('Diety'))

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Iloœæ)
	values(IDENT_CURRENT('Diety'), 'Trawa', 10)

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Iloœæ)
	values(IDENT_CURRENT('Diety'), 'Liœcie bananowca', 5)

insert into Diety(Uwagi) values (null)

	insert into Planowane_Posi³ki(Imiê, Godzina,Nr_Diety)
	values ('Zdzich', '06:00:00', IDENT_CURRENT('Diety'))

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Iloœæ)
	values(IDENT_CURRENT('Diety'), 'Miêso drobiowe', 5)

insert into Diety(Uwagi) values (null)

	insert into Planowane_Posi³ki(Imiê, Godzina,Nr_Diety)
	values ('Zdzich', '14:00:00', IDENT_CURRENT('Diety'))
	
	insert into Pozycje_Diet(Nr_Diety,Nazwa,Iloœæ)
	values(IDENT_CURRENT('Diety'), 'Miêso drobiowe', 5)

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Iloœæ)
	values(IDENT_CURRENT('Diety'), 'Miêso wieprzowe', 5)

	--/Diety, Pozycje Diet, Planowane Posi³ki- koniec

---/Faktyczny stan,karmienia

insert into Karmienia(Data, Godzina, Imiê,Nr_Diety, PESEL)
values('12.13.2015','15:00:00', 'Witek', (select Nr_Diety from 
Planowane_Posi³ki where Imiê='Witek' and Godzina='15:00:00'), 95051004509)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Witek' and Godzina='15:00:00'), 'Banany', 'Witek','15:00:00', 0.9)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Witek' and Godzina='15:00:00'), 'Mango', 'Witek','15:00:00', 1)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Witek' and Godzina='15:00:00'), 'Termity', 'Witek','15:00:00', 0.9)

insert into Karmienia(Data, Godzina, Imiê,Nr_Diety, PESEL)
values('12.13.2015','15:00:00', 'Ola', (select Nr_Diety from
 Planowane_Posi³ki where Imiê='Ola' and Godzina='15:00:00'), 95051004509)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Ola' and Godzina='15:00:00'), 'Banany', 'Ola','15:00:00', 0.9)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Ola' and Godzina='15:00:00'), 'Mango', 'Ola','15:00:00', 1)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Ola' and Godzina='15:00:00'), 'Termity', 'Ola','15:00:00', 0.9)

insert into Karmienia(Data, Godzina, Imiê,Nr_Diety, PESEL)
values('10.13.2015','06:00:00', 'Zdzich', (select Nr_Diety from
 Planowane_Posi³ki where Imiê='Zdzich' and Godzina='06:00:00'), 95051004509)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Zdzich' and Godzina='06:00:00'), 'Miêso drobiowe', 'Zdzich','06:00:00', 5)

insert into Karmienia(Data, Godzina, Imiê,Nr_Diety, PESEL)
values('10.13.2015','14:00:00', 'Zdzich', (select Nr_Diety from
 Planowane_Posi³ki where Imiê='Zdzich' and Godzina='14:00:00'), 95051004509)

 insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Zdzich' and Godzina='14:00:00'), 'Miêso drobiowe', 'Zdzich','14:00:00', 5)

 insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Zdzich' and Godzina='14:00:00'), 'Miêso wieprzowe', 'Zdzich','14:00:00', 4.8)

insert into Karmienia(Data, Godzina, Imiê,Nr_Diety, PESEL)
values('10.13.2015','14:00:00', 'Nina', (select Nr_Diety from
 Planowane_Posi³ki where Imiê='Nina' and Godzina='14:00:00'), 92031004509)

  insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Nina' and Godzina='14:00:00'), 'Banany', 'Nina','14:00:00', 10)

  insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Nina' and Godzina='14:00:00'), 'Trawa', 'Nina','14:00:00', 50)

  insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imiê, Godzina, Iloœæ_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi³ki where Imiê='Nina' and Godzina='14:00:00'), 'Liœcie bananowca', 'Nina','14:00:00', 20)

---/Faktyczny stan,karmienia- koniec



--/prac-zwierz

insert into Prac_Zwierz(Imiê, PESEL)
values('Nina', 95051004509)

insert into Prac_Zwierz(Imiê, PESEL)
values('Zdzich', 93051004509)

insert into Prac_Zwierz(Imiê, PESEL)
values('Witek', 92051004509)

insert into Prac_Zwierz(Imiê, PESEL)
values('Ola', 92051004509)

insert into Prac_Zwierz(Imiê, PESEL)
values('Ala', 92031004509)

--/prac-zwierz-koniec