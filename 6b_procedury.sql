-- Krzysztof Kołacki 19728 semsetr V
-- Przedmiot: Zaawasnowane Systemy Baz Danych
-- Temat: Wypożyczalnia samochodów

SET SERVEROUTPUT ON 
/


-- Procedura która dodaje nową opinię do bazy danych.

CREATE OR REPLACE PROCEDURE dodaj_opinie(id INTEGER,data DATE, ocena INTEGER, komentarz VARCHAR2, id_klienta INTEGER, id_wypozyczenia INTEGER)
IS
    BEGIN
        INSERT INTO opinie (id, data, ocena, komentarz, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (id, data, ocena, komentarz, id_klienta, id_wypozyczenia);
    END;
/

CALL dodaj_opinie(7, TO_DATE('2023-03-11', 'YYYY-MM-DD'), 4, 'Okej!', 4, 3);

DROP PROCEDURE dodaj_opinie;

select * from opinie

-- Procedura która dodaje nowe przypomnienie do bazy danych.

CREATE OR REPLACE PROCEDURE dodaj_przypomnienie(id INTEGER, data DATE, wiadomosc VARCHAR2, id_wypozyczenia INTEGER)
IS
    BEGIN
        INSERT INTO przypomnienia (id, data, wiadomosc, wypozyczenia_id_wypozyczenia) VALUES (id, data, wiadomosc, id_wypozyczenia);
    END;
/

CALL dodaj_przypomnienie(7, TO_DATE('2023-03-11', 'YYYY-MM-DD'), 'Nowe przypomnienie o wypożyczeniu', 3);

DROP PROCEDURE dodaj_przypomnienie;

select * from przypomnienia

-- Procedura która dodaje nowy samochód do bazy danych.

CREATE OR REPLACE PROCEDURE dodaj_samochod(id INTEGER, marka VARCHAR2, model VARCHAR2, rok_produkcji DATE, przebieg INTEGER, numer_rejestracyjny VARCHAR2, ubezpieczenia_id INTEGER, przeglady_id INTEGER, promocje_id INTEGER, cena_za_dzien INTEGER)
IS
    BEGIN
        INSERT INTO samochody (id_samochod, marka, model, rok_produkcji, przebieg, numer_rejestracyjny, ubezpieczenia_id, przeglady_id, promocje_id, cena_za_dzien) VALUES (id, marka, model, rok_produkcji, przebieg, numer_rejestracyjny, ubezpieczenia_id, przeglady_id, promocje_id, cena_za_dzien);
    END;
/

CALL dodaj_samochod(7, 'Fiat', 'Panda', TO_DATE('2020-03-11', 'YYYY-MM-DD'), 100000, 'KR 12345', 1, 1, 4, 100);

DROP PROCEDURE dodaj_samochod;

select * from samochody


-- Procedura która dodaje nowego klienta do bazy danych.

CREATE OR REPLACE PROCEDURE dodaj_klienta(id INTEGER, imie VARCHAR2, nazwisko VARCHAR2, data_urodzenia DATE, telefon VARCHAR2, nr_dowodu VARCHAR2, adres INTEGER)
IS
    BEGIN
        INSERT INTO klienci (id_klienta, imie, nazwisko, data_urodzenia, numer_telefonu, numer_dowodu, adresy_id_adres) VALUES (id, imie, nazwisko, data_urodzenia, telefon, nr_dowodu, adres);
    END;
/

CALL dodaj_klienta(7, 'Dawid', 'Nowiuski', TO_DATE('2000-03-11', 'YYYY-MM-DD'), '593821123', '1822470319', 1);

DROP PROCEDURE dodaj_klienta;

select * from klienci

-- Procedura która usuwa klienta z bazy danych po id.

CREATE OR REPLACE PROCEDURE usun_klienta(id INTEGER)
IS
    BEGIN
        DELETE FROM klienci WHERE id_klienta = id;
    END;
/

CALL usun_klienta(7);

DROP PROCEDURE usun_klienta;

-- Procedura która dodaje nowe wypożyczenie do bazy danych.

CREATE OR REPLACE PROCEDURE dodaj_wypozyczenie(id INTEGER, data_wypozyczenia DATE, data_oddania DATE, id_klienta INTEGER, opis VARCHAR2, id_samochodu INTEGER, id_pracownika INTEGER)
IS
    BEGIN
        INSERT INTO wypozyczenia (id_wypozyczenia, data_wypozyczenia, data_zwrotu, klienci_id_klienta, opis, samochody_id_samochod, pracownicy_id_pracownika) VALUES (id, data_wypozyczenia, data_oddania, id_klienta, opis, id_samochodu, id_pracownika);
    END;
/

CALL dodaj_wypozyczenie(10, TO_DATE('2023-03-11', 'YYYY-MM-DD'), TO_DATE('2023-04-11', 'YYYY-MM-DD'), 4, 'Super nowe wypozyczenie!', 2, 1);

DROP PROCEDURE dodaj_wypozyczenie;

select * from wypozyczenia