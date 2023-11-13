-- Krzysztof Kołacki 19728 semsetr V
-- Przedmiot: Zaawasnowane Systemy Baz Danych
-- Temat: Wypożyczalnia samochodów

SET SERVEROUTPUT ON 
/


-- Wyzwalacz który wyświetla komunikat gdy zmieniamy cenę samochodu na niższą niż 100 zł.

CREATE OR REPLACE TRIGGER zmien_cene_samochodu
BEFORE UPDATE OF cena_za_dzien ON samochody
FOR EACH ROW
DECLARE
    cena samochody.cena_za_dzien%TYPE;
BEGIN
    SELECT samochody.cena_za_dzien INTO cena FROM samochody WHERE samochody.id_samochod = :OLD.id_samochod;
    IF :NEW.cena_za_dzien < 100 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Nie można zmienić ceny samochodu na niższą niż 100 zł!');
    END IF;
END;
/

select * from samochody


UPDATE samochody SET cena_za_dzien = 50 WHERE id_samochod = 1;

select * from samochody

DROP TRIGGER zmien_cene_samochodu;


-- Wyzwalacz który wyświetla komunikat gdy zmieniamy ocenę w tabeli opinie.

CREATE OR REPLACE TRIGGER zmien_ocene
BEFORE UPDATE OF ocena ON opinie
FOR EACH ROW
DECLARE
    ocena opinie.ocena%TYPE;
BEGIN
    SELECT opinie.ocena INTO ocena FROM opinie WHERE opinie.id = :OLD.id;
    IF :NEW.ocena < 1 OR :NEW.ocena > 5 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Ocena musi być z przedziału 1-5!');
    END IF;
END;
/

select * from opinie


UPDATE opinie SET ocena = 6 WHERE id = 1;

select * from opinie

DROP TRIGGER zmien_ocene;



-- Wyzwalacz który wyświetla komunikat gdy jest dodawany nowy klient który ma mniej niż 18 lat.

CREATE OR REPLACE TRIGGER dodaj_klienta 
BEFORE INSERT ON klienci 
FOR EACH ROW
DECLARE
    wiek INTEGER;
BEGIN
    SELECT EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM :NEW.data_urodzenia) INTO wiek FROM DUAL;
    IF wiek < 18 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Nie można dodać klienta który ma mniej niż 18 lat!');
    END IF;
END;
/

select * from klienci

INSERT INTO klienci (id_klienta, imie, nazwisko, data_urodzenia, numer_telefonu, numer_dowodu, adresy_id_adres) VALUES (8, 'Jola', 'Gacko', TO_DATE('2010-03-11', 'YYYY-MM-DD'), '284019281', '3819403811', 2);

select * from klienci

DROP TRIGGER dodaj_klienta;


-- Wyzwalacz który wyświetla komunikat gdy jest dodawany nowy samochód który ma mniej niż 25 lat i jest marki Audi.

CREATE OR REPLACE TRIGGER dodaj_samochod
BEFORE INSERT ON samochody
FOR EACH ROW
DECLARE
    wiek INTEGER;
BEGIN
    SELECT EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM :NEW.rok_produkcji) INTO wiek FROM DUAL;
    IF wiek < 25 AND :NEW.marka = 'Audi' THEN
        RAISE_APPLICATION_ERROR(-20000, 'Nie można dodać samochodu który ma mniej niż 25 lat i jest marki Audi! Jest za stary!');
    END IF;
END;

select * from samochody


INSERT INTO samochody (id_samochod, marka, model, rok_produkcji, przebieg, numer_rejestracyjny, ubezpieczenia_id, przeglady_id, promocje_id, cena_za_dzien) VALUES (8, 'Audi', 'A4', TO_DATE('1980-03-11', 'YYYY-MM-DD'), 100000, 'AB12345', 1, 5, 2, 110);

select * from samochody

DROP TRIGGER dodaj_samochod;



-- Wyzwalacz który wyświetla komunikat gdy usuwamy klienta który mieszka w Warszawie.

CREATE OR REPLACE TRIGGER usun_klienta
BEFORE DELETE ON klienci
FOR EACH ROW
DECLARE
    adresy_id_adres klienci.adresy_id_adres%TYPE;
BEGIN
    SELECT klienci.adresy_id_adres INTO adresy_id_adres FROM klienci WHERE klienci.id_klienta = :OLD.id_klienta;
    IF adresy_id_adres = 1 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Nie można usunąć klienta który mieszka w Warszawie!');
    END IF;
END;
/

select * from klienci

DELETE FROM klienci WHERE id_klienta = 1;

select * from klienci

DROP TRIGGER usun_klienta;