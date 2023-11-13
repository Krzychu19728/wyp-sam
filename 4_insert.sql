-- Krzysztof Kołacki 19728 semsetr V
-- Przedmiot: Zaawasnowane Systemy Baz Danych
-- Temat: Wypożyczalnia samochodów



-- tabela adresy
--DROP TABLE IF EXISTS adresy;

INSERT INTO adresy (id_adres, ulica, numer_domu, kod_pocztowy, miasto, kraj) VALUES (1, 'Kościuszki', '4', '00-001', 'Warszawa', 'Polska');
INSERT INTO adresy (id_adres, ulica, numer_domu, kod_pocztowy, miasto, kraj) VALUES (2, 'Nowogrodzka', '6', '80-001', 'Gdańsk', 'Polska');
INSERT INTO adresy (id_adres, ulica, numer_domu, kod_pocztowy, miasto, kraj) VALUES (3, 'Kopernika', '1', '00-002', 'Warszawa', 'Polska');
INSERT INTO adresy (id_adres, ulica, numer_domu, kod_pocztowy, miasto, kraj) VALUES (4, 'Kwiatowa', '2', '50-003', 'Wrocław', 'Polska');
INSERT INTO adresy (id_adres, ulica, numer_domu, kod_pocztowy, miasto, kraj) VALUES (5, 'Kwiatowa', '3', '00-003', 'Warszawa', 'Polska');
INSERT INTO adresy (id_adres, ulica, numer_domu, kod_pocztowy, miasto, kraj) VALUES (6, 'Dworcowa', '4', '70-002', 'Szczecin', 'Polska');

-- tabela akcesoria
--DROP TABLE IF EXISTS akcesoria;

INSERT INTO akcesoria (id, nazwa, koszt) VALUES (1, 'Koło zapasowe', 100);
INSERT INTO akcesoria (id, nazwa, koszt) VALUES (2, 'Łopatki', 45);
INSERT INTO akcesoria (id, nazwa, koszt) VALUES (3, 'Śpiwór', 50);
INSERT INTO akcesoria (id, nazwa, koszt) VALUES (4, 'GPS', 60);
INSERT INTO akcesoria (id, nazwa, koszt) VALUES (5, 'Uchwyt na rowery', 80);
INSERT INTO akcesoria (id, nazwa, koszt) VALUES (6, 'Bagażnik', 100);

-- tabela zasady
--DROP TABLE IF EXISTS zasady;

INSERT INTO zasady (id, nazwa, opis) VALUES (1, 'Zasada nr1', 'Przestrzegamy zasad ruchu drogowego i staramy się jeździć ostrożnie');
INSERT INTO zasady (id, nazwa, opis) VALUES (2, 'Zasada nr2', 'Traktujemy wypożyczone auto tak jakby to byłoby nasze własne');
INSERT INTO zasady (id, nazwa, opis) VALUES (3, 'Zasada nr3', 'Jesteśmy zobowiązani do przestrzegania warunków umowy dla przykłady oddajemy samochód na czas');

-- tabela kary
--DROP TABLE IF EXISTS kary;

INSERT INTO kary (id, opis, koszt) VALUES (1,'Za popisowe palenie gumy', 450);
INSERT INTO kary (id, opis, koszt) VALUES (2,'Za nieprzepisową jazdę', 500);
INSERT INTO kary (id, opis, koszt) VALUES (3, 'Udział w wyścigach', 650);

-- tabela klienci 
--DROP TABLE IF EXISTS klienci;

INSERT INTO klienci (id_klienta, imie, nazwisko, data_urodzenia, numer_telefonu, numer_dowodu, adresy_id_adres) VALUES (1, 'Jan', 'Kowalski', TO_DATE('1990-01-01', 'YYYY-MM-DD'), '123456789', '8493012491', 3);
INSERT INTO klienci (id_klienta, imie, nazwisko, data_urodzenia, numer_telefonu, numer_dowodu, adresy_id_adres) VALUES (2, 'Halina', 'Nowak', TO_DATE('1995-01-15', 'YYYY-MM-DD'), '849382950', '3948274930', 6);
INSERT INTO klienci (id_klienta, imie, nazwisko, data_urodzenia, numer_telefonu, numer_dowodu, adresy_id_adres) VALUES (3, 'Adam', 'Kowalski', TO_DATE('1998-12-13', 'YYYY-MM-DD'), '382495042', '3829470319', 5);
INSERT INTO klienci (id_klienta, imie, nazwisko, data_urodzenia, numer_telefonu, numer_dowodu, adresy_id_adres) VALUES (4, 'Paweł', 'Sepko', TO_DATE('1996-11-07', 'YYYY-MM-DD'), '948274204', '4839403822', 4);
INSERT INTO klienci (id_klienta, imie, nazwisko, data_urodzenia, numer_telefonu, numer_dowodu, adresy_id_adres) VALUES (5, 'Piotr', 'Jesko', TO_DATE('2000-08-05', 'YYYY-MM-DD'), '104937454', '4539720184', 1);
INSERT INTO klienci (id_klienta, imie, nazwisko, data_urodzenia, numer_telefonu, numer_dowodu, adresy_id_adres) VALUES (6, 'Anna', 'Olas', TO_DATE('1999-04-04', 'YYYY-MM-DD'), '384290321', '4830928124', 2);

-- tabela pracownicy
--DROP TABLE IF EXISTS pracownicy;

INSERT INTO pracownicy (id_pracownika, imie, nazwisko, data_ur, numer_telefonu, stanowisko, adresy_id_adres) VALUES (1, 'Jan', 'Nowak', TO_DATE('1992-07-03', 'YYYY-MM-DD'), '483019284', 'kierownik', 5);
INSERT INTO pracownicy (id_pracownika, imie, nazwisko, data_ur, numer_telefonu, stanowisko, adresy_id_adres) VALUES (2, 'Janina', 'Keska', TO_DATE('1985-04-18', 'YYYY-MM-DD'), '436019583', 'specjalista IT', 4);
INSERT INTO pracownicy (id_pracownika, imie, nazwisko, data_ur, numer_telefonu, stanowisko, adresy_id_adres) VALUES (3, 'Henryk', 'Kowalski', TO_DATE('1991-11-12', 'YYYY-MM-DD'), '391039482', 'dealer', 2);
INSERT INTO pracownicy (id_pracownika, imie, nazwisko, data_ur, numer_telefonu, stanowisko, adresy_id_adres) VALUES (4, 'Paweł', 'Mazurski', TO_DATE('1992-10-03', 'YYYY-MM-DD'), '492812943', 'dealer', 1);
INSERT INTO pracownicy (id_pracownika, imie, nazwisko, data_ur, numer_telefonu, stanowisko, adresy_id_adres) VALUES (5, 'Krzysztof', 'Gracko', TO_DATE('2001-03-03', 'YYYY-MM-DD'), '493812043', 'sprzedawca', 6);
INSERT INTO pracownicy (id_pracownika, imie, nazwisko, data_ur, numer_telefonu, stanowisko, adresy_id_adres) VALUES (6, 'Filip', 'Bejkas', TO_DATE('1997-08-05', 'YYYY-MM-DD'), '294031235', 'asystent', 3);

-- tabela promocje
--DROP TABLE IF EXISTS promocje;

INSERT INTO promocje (id, nazwa, opis, data_rozpoczecia, data_zakonczenia) VALUES (1, 'Promocja BWM', 'Promocja 30% na samochody BMW', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-02-01', 'YYYY-MM-DD'));
INSERT INTO promocje (id, nazwa, opis, data_rozpoczecia, data_zakonczenia) VALUES (2, 'Promocja Audi', 'Promocja 40% na samochody Audi', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD'));
INSERT INTO promocje (id, nazwa, opis, data_rozpoczecia, data_zakonczenia) VALUES (3, 'Wielka promocja!', 'Promocja 35% na wszystkie samochody', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2020-03-31', 'YYYY-MM-DD'));
INSERT INTO promocje (id, nazwa, opis, data_rozpoczecia, data_zakonczenia) VALUES (4, 'Brak promocji', 'Aktualnie brak promocji', null, null);

-- tabela przeglady
--DROP TABLE IF EXISTS przeglady;

INSERT INTO przeglady (id, data, koszt,nazwa, opis) VALUES (1, TO_DATE('2023-03-06', 'YYYY-MM-DD'), 140, 'Przegląd częściowy', 'Przegląd częściowy samochodu od strony silnika');
INSERT INTO przeglady (id, data, koszt,nazwa, opis)  VALUES (2, TO_DATE('2023-04-02', 'YYYY-MM-DD'), 210, 'Przegląd całościowy', 'Przegląd całościowy samochodu');
INSERT INTO przeglady (id, data, koszt,nazwa, opis)  VALUES (3, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 150, 'Przegląd częściowy', 'Przegląd częściowy samochodu od strony zawieszenia');
INSERT INTO przeglady (id, data, koszt,nazwa, opis) VALUES (4, TO_DATE('2023-06-14', 'YYYY-MM-DD'), 220, 'Przegląd całościowy', 'Przegląd całościowy samochodu');
INSERT INTO przeglady (id, data, koszt,nazwa, opis) VALUES (5, TO_DATE('2023-02-08', 'YYYY-MM-DD'), 350, 'Przegląd całościowy', 'Przegląd całościowy samochodu');

-- tabela rezerwacje
--DROP TABLE IF EXISTS rezerwacje;

INSERT INTO rezerwacje (id, data_rezerwacji, koszt, klienci_id_klienta) VALUES (1, TO_DATE('2023-01-12', 'YYYY-MM-DD'), 200, 1);
INSERT INTO rezerwacje (id, data_rezerwacji, koszt, klienci_id_klienta) VALUES (2, TO_DATE('2023-02-03', 'YYYY-MM-DD'), 250, 4);
INSERT INTO rezerwacje (id, data_rezerwacji, koszt, klienci_id_klienta) VALUES (3, TO_DATE('2023-01-02', 'YYYY-MM-DD'), 160, 3);
INSERT INTO rezerwacje (id, data_rezerwacji, koszt, klienci_id_klienta) VALUES (4, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 430, 2);
INSERT INTO rezerwacje (id, data_rezerwacji, koszt, klienci_id_klienta) VALUES (5, TO_DATE('2023-01-02', 'YYYY-MM-DD'), 300, 5);
INSERT INTO rezerwacje (id, data_rezerwacji, koszt, klienci_id_klienta) VALUES (6, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 330, 3);

-- tabela ubezpieczenia
--DROP TABLE IF EXISTS ubezpieczenia;

INSERT INTO ubezpieczenia (id, data_waznosci, koszt, nazwa, opis) VALUES (1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 600, 'ubezpieczanie całościowe', 'ubezpieczenie dotyczące całego samochodu');
INSERT INTO ubezpieczenia (id, data_waznosci, koszt, nazwa, opis) VALUES (2, TO_DATE('2024-12-01', 'YYYY-MM-DD'), 200, 'ubezpieczanie częściowe nr1', 'ubezpieczenie dotyczące części samochodu w tym silnika oraz skrzyni biegów');
INSERT INTO ubezpieczenia (id, data_waznosci, koszt, nazwa, opis) VALUES (3, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 330, 'ubezpieczanie częściowe nr2', 'ubezpieczenie dotyczące części samochodu w tym zawieszenia oraz szyb');







-- tabela samochody
--DROP TABLE IF EXISTS samochody;

INSERT INTO samochody (id_samochod, marka, model, rok_produkcji, przebieg, numer_rejestracyjny, ubezpieczenia_id, przeglady_id, promocje_id, cena_za_dzien) VALUES (1, 'BMW', 'X5', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 160000, 'WAW1234', 1, 1, 4, 200);
INSERT INTO samochody (id_samochod, marka, model, rok_produkcji, przebieg, numer_rejestracyjny, ubezpieczenia_id, przeglady_id, promocje_id, cena_za_dzien) VALUES (2, 'BMW', 'X6', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 120000, 'WAW1235', 2, 5, 1, 250);
INSERT INTO samochody (id_samochod, marka, model, rok_produkcji, przebieg, numer_rejestracyjny, ubezpieczenia_id, przeglady_id, promocje_id, cena_za_dzien) VALUES (3, 'Ford', 'Kuga', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 70000, 'WAW1236', 3, 3, 4, 160);
INSERT INTO samochody (id_samochod, marka, model, rok_produkcji, przebieg, numer_rejestracyjny, ubezpieczenia_id, przeglady_id, promocje_id, cena_za_dzien) VALUES (4, 'Ford', 'Raptor', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 40000, 'WAW1237', 2, 4, 3, 300);
INSERT INTO samochody (id_samochod, marka, model, rok_produkcji, przebieg, numer_rejestracyjny, ubezpieczenia_id, przeglady_id, promocje_id, cena_za_dzien) VALUES (5, 'Audi', 'A5', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 35000, 'WAW1238', 1, 5, 4, 330);
INSERT INTO samochody (id_samochod, marka, model, rok_produkcji, przebieg, numer_rejestracyjny, ubezpieczenia_id, przeglady_id, promocje_id, cena_za_dzien) VALUES (6, 'Audi', 'A6', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 63000, 'WAW1239', 3, 3, 2, 400);

-- tabela zarezerwowane_samochody
--DROP TABLE IF EXISTS zarezerwowane_samochody;

INSERT INTO zarezerwowane_samochody (id, samochody_id_samochod, rezerwacje_id) VALUES (1, 2, 2);
INSERT INTO zarezerwowane_samochody (id, samochody_id_samochod, rezerwacje_id) VALUES (2, 6, 4);
INSERT INTO zarezerwowane_samochody (id, samochody_id_samochod, rezerwacje_id) VALUES (3, 1, 3);
INSERT INTO zarezerwowane_samochody (id, samochody_id_samochod, rezerwacje_id) VALUES (4, 3, 5);
INSERT INTO zarezerwowane_samochody (id, samochody_id_samochod, rezerwacje_id) VALUES (5, 5, 1);
INSERT INTO zarezerwowane_samochody (id, samochody_id_samochod, rezerwacje_id) VALUES (6, 4, 6);

-- tabela akcesoria_samochodow 
--DROP TABLE IF EXISTS akcesoria_samochodow;

INSERT INTO akcesoria_samochodow (id, samochody_id_samochod, akcesoria_id) VALUES (1, 2, 1);
INSERT INTO akcesoria_samochodow (id, samochody_id_samochod, akcesoria_id) VALUES (2, 1, 2);
INSERT INTO akcesoria_samochodow (id, samochody_id_samochod, akcesoria_id) VALUES (3, 3, 6);
INSERT INTO akcesoria_samochodow (id, samochody_id_samochod, akcesoria_id) VALUES (4, 4, 2);
INSERT INTO akcesoria_samochodow (id, samochody_id_samochod, akcesoria_id) VALUES (5, 3, 5);
INSERT INTO akcesoria_samochodow (id, samochody_id_samochod, akcesoria_id) VALUES (6, 2, 1);
INSERT INTO akcesoria_samochodow (id, samochody_id_samochod, akcesoria_id) VALUES (7, 1, 6);
INSERT INTO akcesoria_samochodow (id, samochody_id_samochod, akcesoria_id) VALUES (8, 4, 5);
INSERT INTO akcesoria_samochodow (id, samochody_id_samochod, akcesoria_id) VALUES (9, 5, 4);







-- tabela wypozyczenia 
--DROP TABLE IF EXISTS wypozyczenia;

INSERT INTO wypozyczenia (id_wypozyczenia, data_wypozyczenia, data_zwrotu, klienci_id_klienta, samochody_id_samochod, opis, pracownicy_id_pracownika) VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-03-14', 'YYYY-MM-DD'), 4, 1, 'Wypożyczenie samochodu BMW na okres 3 miesięcy', 3);
INSERT INTO wypozyczenia (id_wypozyczenia, data_wypozyczenia, data_zwrotu, klienci_id_klienta, samochody_id_samochod, opis, pracownicy_id_pracownika) VALUES (2, TO_DATE('2023-01-14', 'YYYY-MM-DD'), TO_DATE('2023-02-17', 'YYYY-MM-DD'), 2, 2, 'Wypożyczenie samochodu BMW na okres 1 miesiąca', 5);
INSERT INTO wypozyczenia (id_wypozyczenia, data_wypozyczenia, data_zwrotu, klienci_id_klienta, samochody_id_samochod, opis, pracownicy_id_pracownika) VALUES (3, TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-08', 'YYYY-MM-DD'), 3, 3, 'Wypożyczenie samochodu Ford na okres 1 tygodnia', 4);
INSERT INTO wypozyczenia (id_wypozyczenia, data_wypozyczenia, data_zwrotu, klienci_id_klienta, samochody_id_samochod, opis, pracownicy_id_pracownika) VALUES (4, TO_DATE('2023-02-04', 'YYYY-MM-DD'), TO_DATE('2023-03-01', 'YYYY-MM-DD'), 1, 4, 'Wypożyczenie samochodu Ford na okres 1 miesiąca', 4);
INSERT INTO wypozyczenia (id_wypozyczenia, data_wypozyczenia, data_zwrotu, klienci_id_klienta, samochody_id_samochod, opis, pracownicy_id_pracownika) VALUES (5, TO_DATE('2023-02-07', 'YYYY-MM-DD'), TO_DATE('2023-03-06', 'YYYY-MM-DD'), 2, 5, 'Wypożyczenie samochodu Audi na okres 1 miesiąca', 5);
INSERT INTO wypozyczenia (id_wypozyczenia, data_wypozyczenia, data_zwrotu, klienci_id_klienta, samochody_id_samochod, opis, pracownicy_id_pracownika) VALUES (6, TO_DATE('2023-03-04', 'YYYY-MM-DD'), TO_DATE('2023-04-04', 'YYYY-MM-DD'), 6, 6, 'Wypożyczenie samochodu Audi na okres 1 miesiąca', 3);
INSERT INTO wypozyczenia (id_wypozyczenia, data_wypozyczenia, data_zwrotu, klienci_id_klienta, samochody_id_samochod, opis, pracownicy_id_pracownika) VALUES (7, TO_DATE('2023-03-11', 'YYYY-MM-DD'), TO_DATE('2023-03-30', 'YYYY-MM-DD'), 3, 4, 'Wypożyczenie samochodu Ford na okres 2 tygodnie', 1);
INSERT INTO wypozyczenia (id_wypozyczenia, data_wypozyczenia, data_zwrotu, klienci_id_klienta, samochody_id_samochod, opis, pracownicy_id_pracownika) VALUES (8, TO_DATE('2023-04-05', 'YYYY-MM-DD'), TO_DATE('2023-05-04', 'YYYY-MM-DD'), 6, 6, 'Wypożyczenie samochodu Audi na okres 1 miesiąca', 5);
INSERT INTO wypozyczenia (id_wypozyczenia, data_wypozyczenia, data_zwrotu, klienci_id_klienta, samochody_id_samochod, opis, pracownicy_id_pracownika) VALUES (9, TO_DATE('2023-05-06', 'YYYY-MM-DD'), TO_DATE('2023-06-03', 'YYYY-MM-DD'), 1, 3, 'Wypożyczenie samochodu Ford na okres 1 miesiąca', 3);

-- tabela reklamacje 
--DROP TABLE IF EXISTS reklamacje;

INSERT INTO reklamacje (id, data, opis, status, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (1, TO_DATE('2023-02-05', 'YYYY-MM-DD'), 'Reklamacja BMW', 'W trakcie', 2, 3);
INSERT INTO reklamacje (id, data, opis, status, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (2, TO_DATE('2023-03-02', 'YYYY-MM-DD'), 'Reklamacja Audi', 'Zakończona', 4, 5);
INSERT INTO reklamacje (id, data, opis, status, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (3, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'Reklamacja Ford', 'W trakcie', 6, 1);

-- tabela kary_wypozyczenia
--DROP TABLE IF EXISTS kary_wypozyczenia;

INSERT INTO kary_wypozyczenia (id, kary_id, wypozyczenia_id_wypozyczenia) VALUES (1, 2, 4);
INSERT INTO kary_wypozyczenia (id, kary_id, wypozyczenia_id_wypozyczenia) VALUES (2, 1, 2);
INSERT INTO kary_wypozyczenia (id, kary_id, wypozyczenia_id_wypozyczenia) VALUES (3, 3, 1);
INSERT INTO kary_wypozyczenia (id, kary_id, wypozyczenia_id_wypozyczenia) VALUES (4, 2, 3);
INSERT INTO kary_wypozyczenia (id, kary_id, wypozyczenia_id_wypozyczenia) VALUES (5, 1, 2);
INSERT INTO kary_wypozyczenia (id, kary_id, wypozyczenia_id_wypozyczenia) VALUES (6, 3, 6);

-- tabela usterki
--DROP TABLE IF EXISTS usterki;

INSERT INTO usterki (id, opis, status, wypozyczenia_id_wypozyczenia) VALUES (1, 'usterka silnika', 'w trakcie', 4);
INSERT INTO usterki (id, opis, status, wypozyczenia_id_wypozyczenia) VALUES (2, 'usterka szyb', 'zakończona', 2);
INSERT INTO usterki (id, opis, status, wypozyczenia_id_wypozyczenia) VALUES (3, 'usterka wszystkiego, samochód do kasacji', 'w trakcie', 2);

-- tabela zasady_wypozyczen
--DROP TABLE IF EXISTS zasady_wypozyczen;

INSERT INTO zasady_wypozyczen (id, zasady_id, wypozyczenia_id_wypozyczenia) VALUES (1, 1, 2);
INSERT INTO zasady_wypozyczen (id, zasady_id, wypozyczenia_id_wypozyczenia) VALUES (2, 2, 4);
INSERT INTO zasady_wypozyczen (id, zasady_id, wypozyczenia_id_wypozyczenia) VALUES (3, 3, 3);
INSERT INTO zasady_wypozyczen (id, zasady_id, wypozyczenia_id_wypozyczenia) VALUES (4, 1, 1);
INSERT INTO zasady_wypozyczen (id, zasady_id, wypozyczenia_id_wypozyczenia) VALUES (5, 3, 4);
INSERT INTO zasady_wypozyczen (id, zasady_id, wypozyczenia_id_wypozyczenia) VALUES (6, 2, 1);

-- tabela przypomnienia
--DROP TABLE IF EXISTS przypomnienia;

INSERT INTO przypomnienia (id, data, wiadomosc, wypozyczenia_id_wypozyczenia) VALUES (1, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'Halo halo! Przypomnienie o wypożyczeniu', 4);
INSERT INTO przypomnienia (id, data, wiadomosc, wypozyczenia_id_wypozyczenia) VALUES (2, TO_DATE('2023-01-13', 'YYYY-MM-DD'), 'Puk puk! Przypomnienie o wypożyczeniu', 2);
INSERT INTO przypomnienia (id, data, wiadomosc, wypozyczenia_id_wypozyczenia) VALUES (3, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Hejoo! Przypomnienie o wypożyczeniu', 1);
INSERT INTO przypomnienia (id, data, wiadomosc, wypozyczenia_id_wypozyczenia) VALUES (4, TO_DATE('2023-03-03', 'YYYY-MM-DD'), 'Halo halo! Przypomnienie o wypożyczeniu', 6);
INSERT INTO przypomnienia (id, data, wiadomosc, wypozyczenia_id_wypozyczenia) VALUES (5, TO_DATE('2023-02-06', 'YYYY-MM-DD'), 'Uwaga! Przypomnienie o wypożyczeniu', 5);
INSERT INTO przypomnienia (id, data, wiadomosc, wypozyczenia_id_wypozyczenia) VALUES (6, TO_DATE('2023-01-30', 'YYYY-MM-DD'), 'Aloha! Przypomnienie o wypożyczeniu', 3);

-- tabela raporty 
--DROP TABLE IF EXISTS raporty;

INSERT INTO raporty (id, data, typ, opis, wypozyczenia_id_wypozyczenia) VALUES (1, TO_DATE('2023-12-21', 'YYYY-MM-DD'), 'Raport ważny', 'Ważny raport wypożyczenia', 1);
INSERT INTO raporty (id, data, typ, opis, wypozyczenia_id_wypozyczenia) VALUES (2, TO_DATE('2023-12-22', 'YYYY-MM-DD'), 'Raport zwykły', 'Zwykły raport wypożyczenia', 2);
INSERT INTO raporty (id, data, typ, opis, wypozyczenia_id_wypozyczenia) VALUES (3, TO_DATE('2023-12-20', 'YYYY-MM-DD'), 'Raport ważny', 'Ważny raport wypożyczenia', 3);
INSERT INTO raporty (id, data, typ, opis, wypozyczenia_id_wypozyczenia) VALUES (4, TO_DATE('2023-12-22', 'YYYY-MM-DD'), 'Raport zwykły', 'Zwykły raport wypożyczenia', 4);
INSERT INTO raporty (id, data, typ, opis, wypozyczenia_id_wypozyczenia) VALUES (5, TO_DATE('2023-12-25', 'YYYY-MM-DD'), 'Raport zwykły', 'Zwykły raport wypożyczenia', 5);
INSERT INTO raporty (id, data, typ, opis, wypozyczenia_id_wypozyczenia) VALUES (6, TO_DATE('2023-12-21', 'YYYY-MM-DD'), 'Raport bardzo ważny', 'Bardzo ważny raport wypożyczenia', 6);


-- tabela opinie
--DROP TABLE IF EXISTS opinie;

INSERT INTO opinie (id, data, ocena, komentarz, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (1, TO_DATE('2023-02-17', 'YYYY-MM-DD'), 5, 'Wszystko super!', 4, 2);
INSERT INTO opinie (id, data, ocena, komentarz, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (2, TO_DATE('2023-03-14', 'YYYY-MM-DD'), 4, 'Dobry samochód i usługa', 2, 1);
INSERT INTO opinie (id, data, ocena, komentarz, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (3, TO_DATE('2023-03-06', 'YYYY-MM-DD'), 5, 'Już nie moge sie doczekac az wypozycze po raz kolejny', 1, 5);
INSERT INTO opinie (id, data, ocena, komentarz, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (4, TO_DATE('2023-03-01', 'YYYY-MM-DD'), 3, 'Spoko ale mogło być lepiej', 5, 4);
INSERT INTO opinie (id, data, ocena, komentarz, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (5, TO_DATE('2023-02-17', 'YYYY-MM-DD'), 4, 'Szybki samochód', 3, 2);
INSERT INTO opinie (id, data, ocena, komentarz, klienci_id_klienta, wypozyczenia_id_wypozyczenia) VALUES (6, TO_DATE('2023-04-04', 'YYYY-MM-DD'), 5, 'Wszystko super!', 6, 6);











