-- Krzysztof Kołacki 19728 semsetr V
-- Przedmiot: Zaawasnowane Systemy Baz Danych
-- Temat: Wypożyczalnia samochodów

SET SERVEROUTPUT ON 
/


CREATE OR REPLACE PACKAGE pak_WypSam AS

     PROCEDURE dodaj_klienta(id INTEGER, imie VARCHAR2, nazwisko VARCHAR2, data_urodzenia DATE, telefon VARCHAR2, nr_dowodu VARCHAR2, adres INTEGER);
     PROCEDURE usun_klienta(id INTEGER);
     PROCEDURE dodaj_wypozyczenie(id INTEGER, data_wypozyczenia DATE, data_oddania DATE, id_klienta INTEGER, opis VARCHAR2, id_samochodu INTEGER, id_pracownika INTEGER);
     PROCEDURE dodaj_samochod(id INTEGER, marka VARCHAR2, model VARCHAR2, rok_produkcji DATE, przebieg INTEGER, numer_rejestracyjny VARCHAR2, ubezpieczenia_id INTEGER, przeglady_id INTEGER, promocje_id INTEGER, cena_za_dzien INTEGER);
     PROCEDURE dodaj_opinie(id INTEGER,data DATE, ocena INTEGER, komentarz VARCHAR2, id_klienta INTEGER, id_wypozyczenia INTEGER);
     PROCEDURE dodaj_przypomnienie(id INTEGER, data DATE, wiadomosc VARCHAR2, id_wypozyczenia INTEGER);

     FUNCTION liczba_dni_wypozyczenia(id_wyp INTEGER) RETURN INTEGER;
     FUNCTION cena_wypozyczenia(id_wyp INTEGER) RETURN INTEGER;
     FUNCTION lista_opinii(id_samochod NUMBER) RETURN VARCHAR2;
     FUNCTION lista_samochodow_dostepne(data DATE) RETURN VARCHAR2;
     FUNCTION lista_klientow_przypomnienie(id_samochod NUMBER) RETURN VARCHAR2;
     FUNCTION lista_samochodow(id_klient NUMBER) RETURN VARCHAR2;

    -- przeciążona procedurę dodaj_opinie która przyjmuje tylko id, ocena, id_klienta, id_wypozyczenia
    PROCEDURE dodaj_opinie(id INTEGER, ocena INTEGER, id_klienta INTEGER, id_wypozyczenia INTEGER);
    -- przeciążona funkcja cena_wypozyczenia która przyjmuje id_wypozyczenia oraz mnożnik
    FUNCTION cena_wypozyczenia(id_wyp INTEGER, mnoznik INTEGER) RETURN INTEGER; 

END;

CREATE OR REPLACE PACKAGE body pak_WypSam IS
    PROCEDURE dodaj_klienta(id INTEGER, imie VARCHAR2, nazwisko VARCHAR2, data_urodzenia DATE, telefon VARCHAR2, nr_dowodu VARCHAR2, adres INTEGER) IS
        BEGIN
            INSERT INTO klienci (id_klienta, imie, nazwisko, data_urodzenia, numer_telefonu, numer_dowodu, adresy_id_adres) VALUES (id, imie, nazwisko, data_urodzenia, telefon, nr_dowodu, adres);
        END;
    PROCEDURE usun_klienta(id INTEGER) IS
        BEGIN
            DELETE FROM klienci WHERE id_klienta = id;
        END;
    PROCEDURE dodaj_wypozyczenie(id INTEGER, data_wypozyczenia DATE, data_oddania DATE, id_klienta INTEGER, opis VARCHAR2, id_samochodu INTEGER, id_pracownika INTEGER) IS
        BEGIN
            INSERT INTO wypozyczenia (id_wypozyczenia, data_wypozyczenia, data_zwrotu, klienci_id_klienta, opis, samochody_id_samochod, pracownicy_id_pracownika) VALUES (id, data_wypozyczenia, data_oddania, id_klienta, opis, id_samochodu, id_pracownika);
        END;
    PROCEDURE dodaj_samochod(id INTEGER, marka VARCHAR2, model VARCHAR2, rok_produkcji DATE, przebieg INTEGER, numer_rejestracyjny VARCHAR2, ubezpieczenia_id INTEGER, przeglady_id INTEGER, promocje_id INTEGER, cena_za_dzien INTEGER) IS        
        BEGIN
            INSERT INTO samochody (id_samochod, marka, model, rok_produkcji, przebieg, numer_rejestracyjny, ubezpieczenia_id, przeglady_id, promocje_id, cena_za_dzien) VALUES (id, marka, model, rok_produkcji, przebieg, numer_rejestracyjny, ubezpieczenia_id, przeglady_id, promocje_id, cena_za_dzien);
        END;
    PROCEDURE dodaj_opinie(id INTEGER,data DATE, ocena INTEGER, komentarz VARCHAR2, id_klienta INTEGER, id_wypozyczenia INTEGER) IS
        BEGIN
            INSERT INTO opinie (id, data, ocena, komentarz, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (id, data, ocena, komentarz, id_klienta, id_wypozyczenia);
        END;
    PROCEDURE dodaj_opinie(id INTEGER, ocena INTEGER, id_klienta INTEGER, id_wypozyczenia INTEGER) IS
        BEGIN
            INSERT INTO opinie (id, ocena, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (id, ocena, id_klienta, id_wypozyczenia);
        END;
    PROCEDURE dodaj_przypomnienie(id INTEGER, data DATE, wiadomosc VARCHAR2, id_wypozyczenia INTEGER) IS
        BEGIN
            INSERT INTO przypomnienia (id, data, wiadomosc, wypozyczenia_id_wypozyczenia) VALUES (id, data, wiadomosc, id_wypozyczenia);
        END;

    FUNCTION liczba_dni_wypozyczenia(id_wyp INTEGER) RETURN INTEGER IS
        liczba_dni INTEGER;
        BEGIN
            SELECT (data_zwrotu - data_wypozyczenia) AS "liczba dni" INTO liczba_dni FROM wypozyczenia WHERE id_wypozyczenia = id_wyp;
            RETURN liczba_dni;
        END;
    FUNCTION cena_wypozyczenia(id_wyp INTEGER) RETURN INTEGER IS
        cena INTEGER;
        BEGIN
            SELECT (liczba_dni_wypozyczenia(id_wyp) * s.cena_za_dzien) AS "cena wypożyczenia" INTO cena FROM wypozyczenia w, samochody s WHERE w.samochody_id_samochod = s.id_samochod AND w.id_wypozyczenia = id_wyp;
            RETURN cena;
        END;
    FUNCTION cena_wypozyczenia(id_wyp INTEGER, mnoznik INTEGER) RETURN INTEGER IS
        cena INTEGER;
        BEGIN
            SELECT (liczba_dni_wypozyczenia(id_wyp) * s.cena_za_dzien) AS "cena wypożyczenia" INTO cena FROM wypozyczenia w, samochody s WHERE w.samochody_id_samochod = s.id_samochod AND w.id_wypozyczenia = id_wyp;
            RETURN (cena*mnoznik);
        END;
    FUNCTION lista_opinii(id_samochod NUMBER) RETURN VARCHAR2 IS
        lista VARCHAR2(1000);
        BEGIN
            SELECT LISTAGG(o.komentarz, ', ') WITHIN GROUP (ORDER BY o.komentarz) INTO lista FROM opinie o, wypozyczenia w WHERE o.wypozyczenia_id_wypozyczenia = w.id_wypozyczenia AND w.samochody_id_samochod = id_samochod;
            RETURN lista;
        END;
    FUNCTION lista_samochodow_dostepne(data DATE) RETURN VARCHAR2 IS
        lista VARCHAR2(1000);
        BEGIN
            SELECT LISTAGG(s.marka || ' ' || s.model, ', ') WITHIN GROUP (ORDER BY s.marka) INTO lista FROM samochody s, wypozyczenia w WHERE s.id_samochod = w.samochody_id_samochod AND w.data_wypozyczenia = data;
            RETURN lista;
        END;
    FUNCTION lista_samochodow(id_klient NUMBER) RETURN VARCHAR2 IS
        lista VARCHAR2(1000);
        BEGIN
            SELECT LISTAGG(s.marka || ' ' || s.model, ', ') WITHIN GROUP (ORDER BY s.marka) INTO lista FROM samochody s, wypozyczenia w WHERE s.id_samochod = w.samochody_id_samochod AND w.klienci_id_klienta = id_klient;
            RETURN lista;
        END;
    FUNCTION lista_klientow_przypomnienie(id_samochod NUMBER) RETURN VARCHAR2 IS
        lista VARCHAR2(1000);
        BEGIN
            SELECT LISTAGG(k.imie || ' ' || k.nazwisko, ', ') WITHIN GROUP (ORDER BY k.imie) INTO lista FROM klienci k, wypozyczenia w, przypomnienia p WHERE k.id_klienta = w.klienci_id_klienta AND w.samochody_id_samochod = id_samochod AND w.id_wypozyczenia = p.id;
            RETURN lista;
        END;
END pak_WypSam;

-- Testowanie
SELECT * FROM klienci;

BEGIN 
    pak_WypSam.dodaj_klienta(7, 'Dawid', 'Nowiuski', TO_DATE('2000-03-11', 'YYYY-MM-DD'), '593821123', '1822470319', 1);
END;

SELECT * FROM klienci;

BEGIN 
    pak_WypSam.usun_klienta(7);
END;

SELECT * FROM klienci;

SELECT * FROM wypozyczenia;

BEGIN 
    pak_WypSam.dodaj_wypozyczenie(15, TO_DATE('2020-03-11', 'YYYY-MM-DD'), TO_DATE('2020-03-15', 'YYYY-MM-DD'), 1, 'opis', 1, 1);
END;

SELECT * FROM wypozyczenia;

SELECT * FROM samochody;

BEGIN 
    pak_WypSam.dodaj_samochod(10, 'Ferrari', 'Portofino', TO_DATE('2018-03-11', 'YYYY-MM-DD'), 20000, 'KR 12355', 1, 1, 4, 1000);
END;

SELECT * FROM samochody;

SELECT * FROM opinie;

BEGIN 
    pak_WypSam.dodaj_opinie(10, TO_DATE('2020-03-11', 'YYYY-MM-DD'), 5, 'Super gites!!!', 1, 1);
END;

SELECT * FROM opinie;

-- przeciążona procedura dodaj_opinie
BEGIN 
    pak_WypSam.dodaj_opinie(11, 3, 2, 4);
END;

SELECT pak_WypSam.liczba_dni_wypozyczenia(4) FROM dual;

SELECT pak_WypSam.cena_wypozyczenia(5) FROM dual;

-- przeciążona funkcja cena_wypozyczenia
SELECT pak_WypSam.cena_wypozyczenia(5, 2) FROM dual;

SELECT pak_WypSam.lista_opinii(4) FROM dual;

SELECT pak_WypSam.lista_samochodow_dostepne(TO_DATE('2023-03-11', 'YYYY-MM-DD')) FROM dual;

SELECT pak_WypSam.lista_klientow_przypomnienie(4) FROM dual;

SELECT pak_WypSam.lista_samochodow(2) FROM dual;


DROP PACKAGE pak_WypSam;






