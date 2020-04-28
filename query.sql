/* I.Zapytanie o ilo�� zwierz�t na ka�dym wybiegu, jaki gatunek zamieszkuje dany wybieg, jakie jest jego pole powierzchni
oraz ile �rednio m2 przypada na jedno zwierz�. sortowane od najwi�kszej ilo�ci na wybiegu, a potem alfabetycznie po
nazwach gatunk�w*/

select Numer , count(*) as Ilo��_Zwierz�t, Z.Nazwa_gatunku,  Pole_powierzchni, (Pole_powierzchni/count(*)) as �rednia_na_zwierz�
from Zwierz�ta Z,Wybiegi
where Z.Numer = Nr_wybiegu
group by Numer, Z.Nazwa_gatunku, Pole_powierzchni
order by Ilo��_Zwierz�t desc ,Z.Nazwa_gatunku   

/* II.Zapytanie o list� pracownik�w, ilo�� zwierz�t jakimi si� zajmuj�, ilo�� karmie� jakie dokonali obecnie, oraz r�nica 
mi�dzy planow� ilo�ci� do wykonania. Sortujemy po ilo�ci zwierz�t, kt�rymi pracownik si� opiekuje, a potem alfabetycznie 
po nazwiksach*/

select K.Imi�, K.PESEL, Nazwisko,count(*) as ilo��_zwierz�t, 
(select count(*) from Karmienia, Pracownicy 
where Karmienia.PESEL= Pracownicy.PESEL and K.PESEL = Karmienia.PESEL) as ilo��_karmie�,
(select count(*) from Karmienia,Prac_Zwierz
where Prac_Zwierz.PESEL = K.PESEL and Prac_Zwierz.Imi� = Karmienia.Imi� and Karmienia.PESEL!= K.PESEL   )  as r�nica_planowanych_do_wykonania
from Pracownicy K join  Prac_Zwierz P
on  K.PESEL = P.PESEL
group by K.Imi�, Nazwisko, K.PESEL
order by ilo��_zwierz�t , Nazwisko 


/*III. Zapyatnie o wkazanie ile razy ka�da z diet zosta�a wykorzystana przy planowaniu posi�ku, sortujemy wg "popularno�ci" diety*/

select count(*) as ilo��_zwierz�t , P.Nr_Diety from Planowane_Posi�ki P, Diety D
where P.Nr_Diety = D.Nr_Diety
group by P.Nr_Diety
order by ilo��_zwierz�t

/*IV.Harmonogram dnia- zapytanie o wszystkie karmienia jakie powinny by� wykonane przez ca�y dzie�, Imi� i nazwisko pracownika
, kt�ry powinien karmienia dokona�, nr diety wg kt�rej karmienie ma by� dokonane, imi� zwierz�cia oraz nr wybiegu, na kt�ym karmienie 
ma si� odby�. Sortujemy po godzinach, a potem po nazwiskach pracownik�w-alfabetycznie*/

select Godzina, P.Imi�, P.Nazwisko, Nr_Diety, Numer as Numer_Wybiegu, Z.Imi� as Imi�_zwierz�cia
from Pracownicy P, Planowane_Posi�ki ,Zwierz�ta Z , Prac_Zwierz 
where Planowane_Posi�ki.Imi� = Z.Imi� and P.PESEL = Prac_Zwierz.PESEL and Prac_Zwierz.Imi� = Z.Imi�
order by Godzina, P.Nazwisko  

/* V.Zapytanie o r�nic� jaka wynios�a przy karmieniu zwierz�t(mi�dzy planowanym posi�kiem a faktycznym stanem).Podana zostaje nazwa
sk�adnik przy kt�rym wyst�pi�a ta r�nica, nr diety, imi� zwierz�cia, data karmienia przy kt�rym wyst�pi�a r�nica oraz jego godzina.
Sortujemy po r�nucy-od najwi�kszej , a nast�pnie alfabetycznie po nazwach sk��dnik�w*/

select F.Nazwa , P.Ilo�� -F.Ilo��_podanego_jedzenia as R�nica_kg,F.Nr_Diety, F.Imi�, F.Data, F.Godzina
from Faktyczny_Stan F join Pozycje_Diet P
on  F.Nazwa =P.Nazwa and F.Nr_Diety = P.Nr_Diety and  P.Ilo�� -F.Ilo��_podanego_jedzenia >0 
group by F.Nazwa,F.Nr_Diety, F.Imi�, F.Data, F.Godzina,P.Ilo�� -F.Ilo��_podanego_jedzenia
order by R�nica_kg desc, F.Nazwa

/*VI. Zapytanie o dzienne zapotrzebowanie na ka�dy ze sk��dnik�w, oraz o obecny stan w magazynie */

select  Nazwa,sum(Ilo��)as Suma, Obecny_stan
from Pozycje_Diet D, Planowane_Posi�ki P, Sk�adniki   where D.Nr_Diety = P.Nr_Diety  and Nazwa_Sk�adnika = D.Nazwa
group by  Nazwa, Obecny_stan

/* VII. Zapytanie o codzienn� ilo�� karmie� dla ka�dego z zwierz�t, a tak�e o sum� jedzenia spo�ywanego przez ca�y dzie�, Imi� tego zwierz�cia, Nazw�
gatunku.Sortujemy malej�co wg sumy spo�ywanego jedzenia, a potem alfabetycznie po imionach zwierz�t. Zapytanie korzysta z widoku-Suma*/

select sum(suma_po�ywienia) as suma_po�ywienia_dziennie,count (*)as Liczba_karmie�_dziennie , Suma.Imi�,
Suma.Nazwa_Gatunku from Suma join Planowane_Posi�ki P
on  Suma.Imi� = P.Imi� and Suma.Nr_Diety = P.Nr_Diety
group by Suma.Imi�, Suma.Numer_Wybiegu,  Suma.Nazwa_Gatunku, P.Imi�
order by suma_po�ywienia_dziennie desc, Imi�

/*WIDOK, widok wyodr�bnia dla ka�dego zwierz�cia sum� po�ywienia zjedzonego podczas jednego karmienia-wg jednej diety. Wyodr�bnie imi� zwierz�cia, nr
wybiegu, na kt�rym si� znajduje oraz nr diety wg kt�rej karmienie jest przeprowadzane.*/

create view Suma as select Z.Imi�, Numer as Numer_Wybiegu,  P.Nr_Diety,Nazwa_Gatunku,
(select sum(Ilo��) from Pozycje_Diet  where Pozycje_Diet.Nr_Diety = P.Nr_Diety  ) as suma_po�ywienia
 from Zwierz�ta Z , Planowane_Posi�ki P
where Z.Imi�=P.Imi�
group by Z.Imi�,Numer, Nazwa_Gatunku, P.Nr_Diety
with check option







