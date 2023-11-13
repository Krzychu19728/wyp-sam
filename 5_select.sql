-- Krzysztof Kołacki 19728 semsetr V
-- Przedmiot: Zaawasnowane Systemy Baz Danych
-- Temat: Wypożyczalnia samochodów

-- Znajdź wszystkich klientów, którzy wypożyczyli samochód marki Audi i mają więcej niż 23 lat oraz mają imię zaczynające się na literę H posortuj ich po nazwisku. Wyświetl nazwę miasta i kod pocztowy klienta. Wyświelt marki samochodów, które wypożyczyli. Wyświetl na ilcze czasu, ile dni wypożyczył samochód oraz cenę samochodu za dzień.
SELECT klienci.id_klienta, klienci.imie, klienci.nazwisko, klienci.data_urodzenia, adresy.miasto, adresy.kod_pocztowy, samochody.marka, wypozyczenia.data_wypozyczenia, wypozyczenia.data_zwrotu, samochody.cena_za_dzien FROM klienci INNER JOIN adresy ON klienci.adresy_id_adres = adresy.id_adres INNER JOIN wypozyczenia ON klienci.id_klienta = wypozyczenia.klienci_id_klienta INNER JOIN samochody ON wypozyczenia.samochody_id_samochod = samochody.id_samochod WHERE id_klienta IN (SELECT klienci_id_klienta FROM wypozyczenia WHERE samochody_id_samochod IN (SELECT id_samochod FROM samochody WHERE marka = 'Audi')) AND data_urodzenia < '1999-01-01' AND imie LIKE 'H%' ORDER BY nazwisko; 

--  widok 
CREATE VIEW klienci_wypozyczenia AS SELECT klienci.id_klienta, klienci.imie, klienci.nazwisko, klienci.data_urodzenia, adresy.miasto, adresy.kod_pocztowy, samochody.marka, wypozyczenia.data_wypozyczenia, wypozyczenia.data_zwrotu, samochody.cena_za_dzien FROM klienci INNER JOIN adresy ON klienci.adresy_id_adres = adresy.id_adres INNER JOIN wypozyczenia ON klienci.id_klienta = wypozyczenia.klienci_id_klienta INNER JOIN samochody ON wypozyczenia.samochody_id_samochod = samochody.id_samochod WHERE id_klienta IN (SELECT klienci_id_klienta FROM wypozyczenia WHERE samochody_id_samochod IN (SELECT id_samochod FROM samochody WHERE marka = 'Audi')) AND data_urodzenia < '1999-01-01' AND imie LIKE 'H%' ORDER BY nazwisko;
SELECT * FROM klienci_wypozyczenia;


-- wyświetl nazwę akcesorium, koszt akcesorium, markę i model samochodu który posiada dany akcesorium. Wyświetl tylko akcesoria, które kosztują mniej niż 100 zł. Wyświetl nazwę ubezpieczenia samochodu.
SELECT akcesoria.nazwa, akcesoria.koszt, samochody.marka, samochody.model, ubezpieczenia.nazwa as "ubezpieczenie" FROM akcesoria INNER JOIN akcesoria_samochodow ON akcesoria.id = akcesoria_samochodow.akcesoria_id INNER JOIN samochody ON akcesoria_samochodow.samochody_id_samochod = samochody.id_samochod INNER JOIN ubezpieczenia ON samochody.ubezpieczenia_id = ubezpieczenia.id WHERE akcesoria.koszt < 100;

-- widok 
CREATE VIEW widok_akcesoria AS SELECT akcesoria.nazwa, akcesoria.koszt, samochody.marka, samochody.model, ubezpieczenia.nazwa as "ubezpieczenie" FROM akcesoria INNER JOIN akcesoria_samochodow ON akcesoria.id = akcesoria_samochodow.akcesoria_id INNER JOIN samochody ON akcesoria_samochodow.samochody_id_samochod = samochody.id_samochod INNER JOIN ubezpieczenia ON samochody.ubezpieczenia_id = ubezpieczenia.id WHERE akcesoria.koszt < 100;
SELECT * FROM widok_akcesoria;