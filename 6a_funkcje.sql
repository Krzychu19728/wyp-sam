-- Krzysztof Kołacki 19728 semsetr V
-- Przedmiot: Zaawasnowane Systemy Baz Danych
-- Temat: Wypożyczalnia samochodów


SET SERVEROUTPUT ON 
/

-- Funkcja która zwraca listę samochodów, które wypożyczył klient o podanym id.

CREATE OR REPLACE FUNCTION lista_samochodow(id_klient NUMBER) RETURN VARCHAR2
IS
    lista VARCHAR2(1000);
    BEGIN
        SELECT LISTAGG(s.marka || ' ' || s.model, ', ') WITHIN GROUP (ORDER BY s.marka) INTO lista FROM samochody s, wypozyczenia w WHERE s.id_samochod = w.samochody_id_samochod AND w.klienci_id_klienta = id_klient;
        RETURN lista;
    END;
/

SELECT lista_samochodow(2) FROM dual;

DROP FUNCTION lista_samochodow;

-- Funkcja która zwraca listę klientów, którzy wypożyczyli samochód o podanym id i mają przypomnienie o wypożyczeniu.

CREATE OR REPLACE FUNCTION lista_klientow_przypomnienie(id_samochod NUMBER) RETURN VARCHAR2
IS
    lista VARCHAR2(1000);
    BEGIN
        SELECT LISTAGG(k.imie || ' ' || k.nazwisko, ', ') WITHIN GROUP (ORDER BY k.imie) INTO lista FROM klienci k, wypozyczenia w, przypomnienia p WHERE k.id_klienta = w.klienci_id_klienta AND w.samochody_id_samochod = id_samochod AND w.id_wypozyczenia = p.id;
        RETURN lista;
    END;
/

SELECT lista_klientow_przypomnienie(4) FROM dual;

DROP FUNCTION lista_klientow_przypomnienie;


-- Funkcja która zwraca listę samochodów, które zostały wypożyczone w podanym dniu.

CREATE OR REPLACE FUNCTION lista_samochodow_dostepne(data DATE) RETURN VARCHAR2
IS
    lista VARCHAR2(1000);
    BEGIN
        SELECT LISTAGG(s.marka || ' ' || s.model, ', ') WITHIN GROUP (ORDER BY s.marka) INTO lista FROM samochody s, wypozyczenia w WHERE s.id_samochod = w.samochody_id_samochod AND w.data_wypozyczenia = data;
        RETURN lista;
    END;
/

SELECT lista_samochodow_dostepne(TO_DATE('2023-03-11', 'YYYY-MM-DD')) FROM dual;

DROP FUNCTION lista_samochodow_dostepne;

-- Funkcja która zwraca listę opinii gdy poda się id samochodu.

CREATE OR REPLACE FUNCTION lista_opinii(id_samochod NUMBER) RETURN VARCHAR2
IS
    lista VARCHAR2(1000);
    BEGIN
        SELECT LISTAGG(o.komentarz, ', ') WITHIN GROUP (ORDER BY o.komentarz) INTO lista FROM opinie o, wypozyczenia w WHERE o.wypozyczenia_id_wypozyczenia = w.id_wypozyczenia AND w.samochody_id_samochod = id_samochod;
        RETURN lista;
    END;
/

SELECT lista_opinii(4) FROM dual;

DROP FUNCTION lista_opinii;


-- Funkcja obliczająca liczbę dni wypożyczenia samochodu o podanym id wypożyczenia.

CREATE OR REPLACE FUNCTION liczba_dni_wypozyczenia(id_wyp INTEGER) RETURN INTEGER
IS
    liczba_dni INTEGER;
    BEGIN
        SELECT (data_zwrotu - data_wypozyczenia) AS "liczba dni" INTO liczba_dni FROM wypozyczenia WHERE id_wypozyczenia = id_wyp;
        RETURN liczba_dni;
    END;
/

SELECT liczba_dni_wypozyczenia(4) FROM dual;

DROP FUNCTION liczba_dni_wypozyczenia;


-- Funkcja która zwraca cenę wypożyczenia samochodu o podanym id. Wykorzystuje funkcję liczba_dni_wypozyczenia.

CREATE OR REPLACE FUNCTION cena_wypozyczenia(id_wyp INTEGER) RETURN INTEGER
IS
    cena INTEGER;
    BEGIN
        SELECT (liczba_dni_wypozyczenia(id_wyp) * s.cena_za_dzien) AS "cena wypożyczenia" INTO cena FROM wypozyczenia w, samochody s WHERE w.samochody_id_samochod = s.id_samochod AND w.id_wypozyczenia = id_wyp;
        RETURN cena;
    END;
/

SELECT cena_wypozyczenia(5) FROM dual;

DROP FUNCTION cena_wypozyczenia;