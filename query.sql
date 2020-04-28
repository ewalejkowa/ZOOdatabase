/* I.Zapytanie o iloœæ zwierz¹t na ka¿dym wybiegu, jaki gatunek zamieszkuje dany wybieg, jakie jest jego pole powierzchni
oraz ile œrednio m2 przypada na jedno zwierzê. sortowane od najwiêkszej iloœci na wybiegu, a potem alfabetycznie po
nazwach gatunków*/

select Numer , count(*) as Iloœæ_Zwierz¹t, Z.Nazwa_gatunku,  Pole_powierzchni, (Pole_powierzchni/count(*)) as œrednia_na_zwierzê
from Zwierzêta Z,Wybiegi
where Z.Numer = Nr_wybiegu
group by Numer, Z.Nazwa_gatunku, Pole_powierzchni
order by Iloœæ_Zwierz¹t desc ,Z.Nazwa_gatunku   

/* II.Zapytanie o listê pracowników, iloœæ zwierz¹t jakimi siê zajmuj¹, iloœæ karmieñ jakie dokonali obecnie, oraz ró¿nica 
miêdzy planow¹ iloœci¹ do wykonania. Sortujemy po iloœci zwierz¹t, którymi pracownik siê opiekuje, a potem alfabetycznie 
po nazwiksach*/

select K.Imiê, K.PESEL, Nazwisko,count(*) as iloœæ_zwierz¹t, 
(select count(*) from Karmienia, Pracownicy 
where Karmienia.PESEL= Pracownicy.PESEL and K.PESEL = Karmienia.PESEL) as iloœæ_karmieñ,
(select count(*) from Karmienia,Prac_Zwierz
where Prac_Zwierz.PESEL = K.PESEL and Prac_Zwierz.Imiê = Karmienia.Imiê and Karmienia.PESEL!= K.PESEL   )  as ró¿nica_planowanych_do_wykonania
from Pracownicy K join  Prac_Zwierz P
on  K.PESEL = P.PESEL
group by K.Imiê, Nazwisko, K.PESEL
order by iloœæ_zwierz¹t , Nazwisko 


/*III. Zapyatnie o wkazanie ile razy ka¿da z diet zosta³a wykorzystana przy planowaniu posi³ku, sortujemy wg "popularnoœci" diety*/

select count(*) as iloœæ_zwierz¹t , P.Nr_Diety from Planowane_Posi³ki P, Diety D
where P.Nr_Diety = D.Nr_Diety
group by P.Nr_Diety
order by iloœæ_zwierz¹t

/*IV.Harmonogram dnia- zapytanie o wszystkie karmienia jakie powinny byæ wykonane przez ca³y dzieñ, Imiê i nazwisko pracownika
, który powinien karmienia dokonaæ, nr diety wg której karmienie ma byæ dokonane, imiê zwierzêcia oraz nr wybiegu, na któym karmienie 
ma siê odbyæ. Sortujemy po godzinach, a potem po nazwiskach pracowników-alfabetycznie*/

select Godzina, P.Imiê, P.Nazwisko, Nr_Diety, Numer as Numer_Wybiegu, Z.Imiê as Imiê_zwierzêcia
from Pracownicy P, Planowane_Posi³ki ,Zwierzêta Z , Prac_Zwierz 
where Planowane_Posi³ki.Imiê = Z.Imiê and P.PESEL = Prac_Zwierz.PESEL and Prac_Zwierz.Imiê = Z.Imiê
order by Godzina, P.Nazwisko  

/* V.Zapytanie o ró¿nicê jaka wynios³a przy karmieniu zwierz¹t(miêdzy planowanym posi³kiem a faktycznym stanem).Podana zostaje nazwa
sk³adnik przy którym wyst¹pi³a ta ró¿nica, nr diety, imiê zwierzêcia, data karmienia przy którym wyst¹pi³a ró¿nica oraz jego godzina.
Sortujemy po ró¿nucy-od najwiêkszej , a nastêpnie alfabetycznie po nazwach sk³¹dników*/

select F.Nazwa , P.Iloœæ -F.Iloœæ_podanego_jedzenia as Ró¿nica_kg,F.Nr_Diety, F.Imiê, F.Data, F.Godzina
from Faktyczny_Stan F join Pozycje_Diet P
on  F.Nazwa =P.Nazwa and F.Nr_Diety = P.Nr_Diety and  P.Iloœæ -F.Iloœæ_podanego_jedzenia >0 
group by F.Nazwa,F.Nr_Diety, F.Imiê, F.Data, F.Godzina,P.Iloœæ -F.Iloœæ_podanego_jedzenia
order by Ró¿nica_kg desc, F.Nazwa

/*VI. Zapytanie o dzienne zapotrzebowanie na ka¿dy ze sk³¹dników, oraz o obecny stan w magazynie */

select  Nazwa,sum(Iloœæ)as Suma, Obecny_stan
from Pozycje_Diet D, Planowane_Posi³ki P, Sk³adniki   where D.Nr_Diety = P.Nr_Diety  and Nazwa_Sk³adnika = D.Nazwa
group by  Nazwa, Obecny_stan

/* VII. Zapytanie o codzienn¹ iloœæ karmieñ dla ka¿dego z zwierz¹t, a tak¿e o sumê jedzenia spo¿ywanego przez ca³y dzieñ, Imiê tego zwierzêcia, Nazwê
gatunku.Sortujemy malej¹co wg sumy spo¿ywanego jedzenia, a potem alfabetycznie po imionach zwierz¹t. Zapytanie korzysta z widoku-Suma*/

select sum(suma_po¿ywienia) as suma_po¿ywienia_dziennie,count (*)as Liczba_karmieñ_dziennie , Suma.Imiê,
Suma.Nazwa_Gatunku from Suma join Planowane_Posi³ki P
on  Suma.Imiê = P.Imiê and Suma.Nr_Diety = P.Nr_Diety
group by Suma.Imiê, Suma.Numer_Wybiegu,  Suma.Nazwa_Gatunku, P.Imiê
order by suma_po¿ywienia_dziennie desc, Imiê

/*WIDOK, widok wyodrêbnia dla ka¿dego zwierzêcia sumê po¿ywienia zjedzonego podczas jednego karmienia-wg jednej diety. Wyodrêbnie imiê zwierzêcia, nr
wybiegu, na którym siê znajduje oraz nr diety wg której karmienie jest przeprowadzane.*/

create view Suma as select Z.Imiê, Numer as Numer_Wybiegu,  P.Nr_Diety,Nazwa_Gatunku,
(select sum(Iloœæ) from Pozycje_Diet  where Pozycje_Diet.Nr_Diety = P.Nr_Diety  ) as suma_po¿ywienia
 from Zwierzêta Z , Planowane_Posi³ki P
where Z.Imiê=P.Imiê
group by Z.Imiê,Numer, Nazwa_Gatunku, P.Nr_Diety
with check option







