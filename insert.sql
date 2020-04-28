---/pracownicy
insert into Pracownicy 
(Imi�, Nazwisko, PESEL) 
values ('Ewa', 'Lejk', 95051004509)

insert into Pracownicy 
(Imi�, Nazwisko, PESEL) 
values ('Jan', 'Nowak', 93051004509)

insert into Pracownicy 
(Imi�, Nazwisko, PESEL) 
values ('Piotr', 'Kowalski', 92051004509)

insert into Pracownicy 
(Imi�, Nazwisko, PESEL) 
values ('Anna', 'Zawadzka', 92031004509)

insert into Pracownicy 
(Imi�, Nazwisko, PESEL) 
values ('Joanna', 'Kowalska', 91051004509)

--/pracownicy-koniec

--/Gatunki
insert into Gatunki
(Nazwa_Gatunku)
values('S�o� afryka�ski')

insert into Gatunki
(Nazwa_Gatunku)
values('�yrafa r�wnikowa')

insert into Gatunki
(Nazwa_Gatunku)
values('Zebra r�wnikowa')

insert into Gatunki
(Nazwa_Gatunku)
values('Wilk szary')

insert into Gatunki
(Nazwa_Gatunku)
values('Lew afryka�ski')

insert into Gatunki
(Nazwa_Gatunku)
values('Tygrys azjatycki')

insert into Gatunki
(Nazwa_Gatunku)
values('Lemur kappa')

--/koniec zwierz�ta

--/Wybiegi

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('A1', 20, ( 'Lemur kappa'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('C8', 100, ( 'S�o� afryka�ski'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('D12', 100, ('�yrafa r�wnikowa'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('SP2', 400, ('Zebra r�wnikowa'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('C1', 100, ('Wilk szary'))

insert into Wybiegi
(Nr_wybiegu, Pole_powierzchni, Nazwa_Gatunku)
values ('C2', 50, ('Lew afryka�ski'))

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

insert into Zwierz�ta
(Imi�, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Nina', '2001-12-31',( 'S�o� afryka�ski'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = 'S�o� afryka�ski'))

insert into Zwierz�ta
(Imi�, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Stachu', '2002-02-11',('�yrafa r�wnikowa'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = '�yrafa r�wnikowa'))

insert into Zwierz�ta
(Imi�, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Ala', '2012-12-31',( 'Zebra r�wnikowa'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = 'Zebra r�wnikowa'))

insert into Zwierz�ta
(Imi�, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Zdzich', '2012-02-21',('Wilk szary'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = 'Wilk szary'))

insert into Zwierz�ta
(Imi�, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Witek', '2014-03-31',('Lemur kappa'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = 'Lemur kappa'))

insert into Zwierz�ta
(Imi�, Data_urodzenia, Nazwa_gatunku, Numer)
values ('Ola', '2012-12-11',('Lemur kappa'), 
(select Nr_Wybiegu from Wybiegi where Nazwa_Gatunku = 'Lemur kappa'))

--/zwierz�ta koniec

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

--/Sk�adniki
insert into Sk�adniki 
(Nazwa_Sk�adnika, Obecny_stan)
values ('Trawa', 100)

insert into Sk�adniki 
(Nazwa_Sk�adnika, Obecny_stan)
values ('Banany', 50)

insert into Sk�adniki 
(Nazwa_Sk�adnika, Obecny_stan)
values ('Termity', 10)

insert into Sk�adniki 
(Nazwa_Sk�adnika, Obecny_stan)
values ('Mango', 20)

insert into Sk�adniki 
(Nazwa_Sk�adnika, Obecny_stan)
values ('Pomara�cze', 30)

insert into Sk�adniki 
(Nazwa_Sk�adnika, Obecny_stan)
values ('Li�cie bananowca', 20)

insert into Sk�adniki 
(Nazwa_Sk�adnika, Obecny_stan)
values ('Mi�so wieprzowe', 50)

insert into Sk�adniki 
(Nazwa_Sk�adnika, Obecny_stan)
values ('Mi�so drobiowe', 50)


--/koniec skadniki


--/Diety, Pozycje Diet, Planowane Posi�ki

insert into Diety(Uwagi) values (null)
	insert into Planowane_Posi�ki 
	(Imi�, Godzina, Nr_Diety)
	values (('Nina'),('14:00:00'), IDENT_CURRENT('Diety'))

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Ilo��) 
	values (IDENT_CURRENT('Diety'),'Banany', 20)

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Ilo��)
	values (IDENT_CURRENT('Diety'), 'Trawa', 50) 

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Ilo��)
	values (IDENT_CURRENT('Diety'), 'Li�cie bananowca', 10)

insert into Diety(Uwagi) values(null)
	
	insert into Planowane_Posi�ki(Imi�, Godzina, Nr_Diety)
	values('Witek', '15:00:00', IDENT_CURRENT('Diety'))
	 
	insert into Planowane_Posi�ki(Imi�, Godzina, Nr_Diety)
	values('Ola', '15:00:00', IDENT_CURRENT('Diety'))

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Ilo��)
	values (IDENT_CURRENT('Diety'),'Mango', 1)

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Ilo��)
	values (IDENT_CURRENT('Diety'),'Banany', 1)

	insert into Pozycje_Diet(Nr_Diety, Nazwa, Ilo��)
	values (IDENT_CURRENT('Diety'),'Termity', 1)

insert into Diety(Uwagi) values(null)

	insert into Planowane_Posi�ki(Imi�, Godzina, Nr_Diety)
	values ('Stachu','19:30:00', IDENT_CURRENT('Diety'))

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Ilo��)
	values(IDENT_CURRENT('Diety'), 'Trawa', 10)

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Ilo��)
	values(IDENT_CURRENT('Diety'), 'Banany', 2)

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Ilo��)
	values(IDENT_CURRENT('Diety'), 'Mango', 5)

insert into Diety(Uwagi) values (null)

	insert into Planowane_Posi�ki(Imi�, Godzina,Nr_Diety)
	values ('Ala', '06:00:00', IDENT_CURRENT('Diety'))

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Ilo��)
	values(IDENT_CURRENT('Diety'), 'Trawa', 10)

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Ilo��)
	values(IDENT_CURRENT('Diety'), 'Li�cie bananowca', 5)

insert into Diety(Uwagi) values (null)

	insert into Planowane_Posi�ki(Imi�, Godzina,Nr_Diety)
	values ('Zdzich', '06:00:00', IDENT_CURRENT('Diety'))

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Ilo��)
	values(IDENT_CURRENT('Diety'), 'Mi�so drobiowe', 5)

insert into Diety(Uwagi) values (null)

	insert into Planowane_Posi�ki(Imi�, Godzina,Nr_Diety)
	values ('Zdzich', '14:00:00', IDENT_CURRENT('Diety'))
	
	insert into Pozycje_Diet(Nr_Diety,Nazwa,Ilo��)
	values(IDENT_CURRENT('Diety'), 'Mi�so drobiowe', 5)

	insert into Pozycje_Diet(Nr_Diety,Nazwa,Ilo��)
	values(IDENT_CURRENT('Diety'), 'Mi�so wieprzowe', 5)

	--/Diety, Pozycje Diet, Planowane Posi�ki- koniec

---/Faktyczny stan,karmienia

insert into Karmienia(Data, Godzina, Imi�,Nr_Diety, PESEL)
values('12.13.2015','15:00:00', 'Witek', (select Nr_Diety from 
Planowane_Posi�ki where Imi�='Witek' and Godzina='15:00:00'), 95051004509)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Witek' and Godzina='15:00:00'), 'Banany', 'Witek','15:00:00', 0.9)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Witek' and Godzina='15:00:00'), 'Mango', 'Witek','15:00:00', 1)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Witek' and Godzina='15:00:00'), 'Termity', 'Witek','15:00:00', 0.9)

insert into Karmienia(Data, Godzina, Imi�,Nr_Diety, PESEL)
values('12.13.2015','15:00:00', 'Ola', (select Nr_Diety from
 Planowane_Posi�ki where Imi�='Ola' and Godzina='15:00:00'), 95051004509)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Ola' and Godzina='15:00:00'), 'Banany', 'Ola','15:00:00', 0.9)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Ola' and Godzina='15:00:00'), 'Mango', 'Ola','15:00:00', 1)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('12.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Ola' and Godzina='15:00:00'), 'Termity', 'Ola','15:00:00', 0.9)

insert into Karmienia(Data, Godzina, Imi�,Nr_Diety, PESEL)
values('10.13.2015','06:00:00', 'Zdzich', (select Nr_Diety from
 Planowane_Posi�ki where Imi�='Zdzich' and Godzina='06:00:00'), 95051004509)

insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Zdzich' and Godzina='06:00:00'), 'Mi�so drobiowe', 'Zdzich','06:00:00', 5)

insert into Karmienia(Data, Godzina, Imi�,Nr_Diety, PESEL)
values('10.13.2015','14:00:00', 'Zdzich', (select Nr_Diety from
 Planowane_Posi�ki where Imi�='Zdzich' and Godzina='14:00:00'), 95051004509)

 insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Zdzich' and Godzina='14:00:00'), 'Mi�so drobiowe', 'Zdzich','14:00:00', 5)

 insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Zdzich' and Godzina='14:00:00'), 'Mi�so wieprzowe', 'Zdzich','14:00:00', 4.8)

insert into Karmienia(Data, Godzina, Imi�,Nr_Diety, PESEL)
values('10.13.2015','14:00:00', 'Nina', (select Nr_Diety from
 Planowane_Posi�ki where Imi�='Nina' and Godzina='14:00:00'), 92031004509)

  insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Nina' and Godzina='14:00:00'), 'Banany', 'Nina','14:00:00', 10)

  insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Nina' and Godzina='14:00:00'), 'Trawa', 'Nina','14:00:00', 50)

  insert into Faktyczny_Stan(Data, Nr_Diety, Nazwa, Imi�, Godzina, Ilo��_podanego_jedzenia)
values('10.13.2015', (select Nr_Diety from Planowane_Posi�ki where Imi�='Nina' and Godzina='14:00:00'), 'Li�cie bananowca', 'Nina','14:00:00', 20)

---/Faktyczny stan,karmienia- koniec



--/prac-zwierz

insert into Prac_Zwierz(Imi�, PESEL)
values('Nina', 95051004509)

insert into Prac_Zwierz(Imi�, PESEL)
values('Zdzich', 93051004509)

insert into Prac_Zwierz(Imi�, PESEL)
values('Witek', 92051004509)

insert into Prac_Zwierz(Imi�, PESEL)
values('Ola', 92051004509)

insert into Prac_Zwierz(Imi�, PESEL)
values('Ala', 92031004509)

--/prac-zwierz-koniec