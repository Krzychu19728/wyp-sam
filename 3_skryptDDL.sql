-- Krzysztof Kołacki 19728 semsetr V
-- Przedmiot: Zaawasnowane Systemy Baz Danych
-- Temat: Wypożyczalnia samochodów


CREATE TABLE adresy (
    id_adres       INTEGER NOT NULL,
    ulica          VARCHAR2(100) NOT NULL,
    numer_domu     VARCHAR2(20) NOT NULL,
    kod_pocztowy   VARCHAR2(20) NOT NULL,
    miasto         VARCHAR2(100),
    kraj           VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE adresy IS
    'adresy';

ALTER TABLE adresy ADD CONSTRAINT adresy_pk PRIMARY KEY ( id_adres );

CREATE TABLE akcesoria (
    id      INTEGER NOT NULL,
    nazwa   VARCHAR2(250),
    koszt   NUMBER
);

COMMENT ON TABLE akcesoria IS
    'akcesoria';

ALTER TABLE akcesoria ADD CONSTRAINT akcesoria_pk PRIMARY KEY ( id );

CREATE TABLE akcesoria_samochodow (
    id                      INTEGER NOT NULL,
    samochody_id_samochod   INTEGER NOT NULL,
    akcesoria_id            INTEGER NOT NULL
);

COMMENT ON TABLE akcesoria_samochodow IS
    'akcesoria_samochodow';

ALTER TABLE akcesoria_samochodow ADD CONSTRAINT table_21_pk PRIMARY KEY ( id );

CREATE TABLE kary (
    id      INTEGER NOT NULL,
    opis    VARCHAR2(250),
    koszt   NUMBER
);

COMMENT ON TABLE kary IS
    'kary';

ALTER TABLE kary ADD CONSTRAINT kary_pk PRIMARY KEY ( id );

CREATE TABLE kary_wypozyczenia (
    id                             INTEGER NOT NULL,
    kary_id                        INTEGER NOT NULL,
    wypozyczenia_id_wypozyczenia   INTEGER NOT NULL
);

COMMENT ON TABLE kary_wypozyczenia IS
    'kary_wyp';

ALTER TABLE kary_wypozyczenia ADD CONSTRAINT kary_wypozyczenia_pk PRIMARY KEY ( id );

CREATE TABLE klienci (
    id_klienta        INTEGER NOT NULL,
    imie              VARCHAR2(50) NOT NULL,
    nazwisko          VARCHAR2(100) NOT NULL,
    data_urodzenia    DATE,
    numer_telefonu    VARCHAR2(30) NOT NULL,
    numer_dowodu      VARCHAR2(30) NOT NULL,
    adresy_id_adres   INTEGER NOT NULL
);

COMMENT ON TABLE klienci IS
    'klienci';

ALTER TABLE klienci ADD CONSTRAINT klienci_pk PRIMARY KEY ( id_klienta );

CREATE TABLE opinie (
    id                             INTEGER NOT NULL,
    data                           DATE,
    ocena                          INTEGER,
    komentarz                      VARCHAR2(255),
    klienci_id_klienta             INTEGER NOT NULL,
    wypozyczenia_id_wypozyczenia   INTEGER NOT NULL
);

COMMENT ON TABLE opinie IS
    'opinie';

ALTER TABLE opinie ADD CONSTRAINT opinie_pk PRIMARY KEY ( id );

CREATE TABLE pracownicy (
    id_pracownika     INTEGER NOT NULL,
    imie              VARCHAR2(100) NOT NULL,
    nazwisko          VARCHAR2(100) NOT NULL,
    data_ur           DATE,
    numer_telefonu    VARCHAR2(30) NOT NULL,
    stanowisko        VARCHAR2(100) NOT NULL,
    adresy_id_adres   INTEGER NOT NULL
);

COMMENT ON TABLE pracownicy IS
    'pracownicy';

ALTER TABLE pracownicy ADD CONSTRAINT pracownicy_pk PRIMARY KEY ( id_pracownika );

CREATE TABLE promocje (
    id                 INTEGER NOT NULL,
    nazwa              VARCHAR2(250),
    opis               VARCHAR2(255),
    data_rozpoczecia   DATE,
    data_zakonczenia   DATE
);

COMMENT ON TABLE promocje IS
    'promocje';

ALTER TABLE promocje ADD CONSTRAINT promocje_pk PRIMARY KEY ( id );

CREATE TABLE przeglady (
    id      INTEGER NOT NULL,
    data    DATE,
    koszt   NUMBER,
    nazwa   VARCHAR2(100),
    opis    VARCHAR2(250)
);

COMMENT ON TABLE przeglady IS
    'przeglady';

ALTER TABLE przeglady ADD CONSTRAINT przeglądy_pk PRIMARY KEY ( id );

CREATE TABLE przypomnienia (
    id                             INTEGER NOT NULL,
    data                           DATE,
    wiadomosc                      VARCHAR2(250),
    wypozyczenia_id_wypozyczenia   INTEGER NOT NULL
);

COMMENT ON TABLE przypomnienia IS
    'przypomnienia';

ALTER TABLE przypomnienia ADD CONSTRAINT przypomnienia_pk PRIMARY KEY ( id );

CREATE TABLE raporty (
    id                             INTEGER NOT NULL,
    data                           DATE,
    typ                            VARCHAR2(100),
    opis                           VARCHAR2(255),
    wypozyczenia_id_wypozyczenia   INTEGER NOT NULL
);

COMMENT ON TABLE raporty IS
    'raporty';

ALTER TABLE raporty ADD CONSTRAINT raporty_pk PRIMARY KEY ( id );

CREATE TABLE reklamacje (
    id                             INTEGER NOT NULL,
    data                           DATE,
    opis                           VARCHAR2(255),
    status                         VARCHAR2(255),
    klienci_id_klienta             INTEGER NOT NULL,
    wypozyczenia_id_wypozyczenia   INTEGER NOT NULL
);

COMMENT ON TABLE reklamacje IS
    'reklamacje';

ALTER TABLE reklamacje ADD CONSTRAINT reklamacje_pk PRIMARY KEY ( id );

CREATE TABLE rezerwacje (
    id                   INTEGER NOT NULL,
    data_rezerwacji      DATE NOT NULL,
    koszt                NUMBER,
    klienci_id_klienta   INTEGER NOT NULL
);

COMMENT ON TABLE rezerwacje IS
    'rezerwacje';

ALTER TABLE rezerwacje ADD CONSTRAINT rezerwacje_pk PRIMARY KEY ( id );

CREATE TABLE samochody (
    id_samochod           INTEGER NOT NULL,
    marka                 VARCHAR2(100) NOT NULL,
    model                 VARCHAR2(100) NOT NULL,
    rok_produkcji         DATE,
    przebieg              INTEGER,
    numer_rejestracyjny   VARCHAR2(30) NOT NULL,
    ubezpieczenia_id      INTEGER NOT NULL,
    przeglady_id          INTEGER NOT NULL,
    promocje_id           INTEGER NOT NULL,
    cena_za_dzien         INTEGER NOT NULL
);

COMMENT ON TABLE samochody IS
    'samochody';

ALTER TABLE samochody ADD CONSTRAINT samochody_pk PRIMARY KEY ( id_samochod );

CREATE TABLE ubezpieczenia (
    id              INTEGER NOT NULL,
    data_waznosci   DATE,
    koszt           NUMBER,
    nazwa           VARCHAR2(255),
    opis            VARCHAR2(250)
);

COMMENT ON TABLE ubezpieczenia IS
    'ubezpieczenie';

ALTER TABLE ubezpieczenia ADD CONSTRAINT ubezpieczenia_pk PRIMARY KEY ( id );

CREATE TABLE usterki (
    id                             INTEGER NOT NULL,
    opis                           VARCHAR2(255),
    status                         VARCHAR2(100),
    wypozyczenia_id_wypozyczenia   INTEGER NOT NULL
);

COMMENT ON TABLE usterki IS
    'usterki';

ALTER TABLE usterki ADD CONSTRAINT usterki_pk PRIMARY KEY ( id );

CREATE TABLE wypozyczenia (
    id_wypozyczenia            INTEGER NOT NULL,
    data_wypozyczenia          DATE NOT NULL,
    data_zwrotu                DATE,
    klienci_id_klienta         INTEGER NOT NULL,
    opis                       VARCHAR2(250),
    samochody_id_samochod      INTEGER NOT NULL,
    pracownicy_id_pracownika   INTEGER NOT NULL
);

COMMENT ON TABLE wypozyczenia IS
    'wypozyczenia';

ALTER TABLE wypozyczenia ADD CONSTRAINT wypożyczenia_pk PRIMARY KEY ( id_wypozyczenia );

CREATE TABLE zarezerwowane_samochody (
    id                      INTEGER NOT NULL,
    samochody_id_samochod   INTEGER NOT NULL,
    rezerwacje_id           INTEGER NOT NULL
);

COMMENT ON TABLE zarezerwowane_samochody IS
    'zar_sam';

ALTER TABLE zarezerwowane_samochody ADD CONSTRAINT zarezerwowane_samochody_pk PRIMARY KEY ( id );

CREATE TABLE zasady (
    id      INTEGER NOT NULL,
    nazwa   VARCHAR2(200),
    opis    VARCHAR2(255)
);

COMMENT ON TABLE zasady IS
    'zasady';

ALTER TABLE zasady ADD CONSTRAINT zasady_pk PRIMARY KEY ( id );

CREATE TABLE zasady_wypozyczen (
    id                             INTEGER NOT NULL,
    zasady_id                      INTEGER NOT NULL,
    wypozyczenia_id_wypozyczenia   INTEGER NOT NULL
);

COMMENT ON TABLE zasady_wypozyczen IS
    'zasady_wypozyczen';

ALTER TABLE zasady_wypozyczen ADD CONSTRAINT zasady_wypozyczen_pk PRIMARY KEY ( id );

ALTER TABLE akcesoria_samochodow
    ADD CONSTRAINT akce_sam_akces_fk FOREIGN KEY ( akcesoria_id )
        REFERENCES akcesoria ( id );

ALTER TABLE akcesoria_samochodow
    ADD CONSTRAINT akcesoria_samoc_sam_fk FOREIGN KEY ( samochody_id_samochod )
        REFERENCES samochody ( id_samochod );

ALTER TABLE kary_wypozyczenia
    ADD CONSTRAINT kary_wypozyczenia_kary_fk FOREIGN KEY ( kary_id )
        REFERENCES kary ( id );

ALTER TABLE kary_wypozyczenia
    ADD CONSTRAINT kary_wypozyczenia_wyp_fk FOREIGN KEY ( wypozyczenia_id_wypozyczenia )
        REFERENCES wypozyczenia ( id_wypozyczenia );

ALTER TABLE klienci
    ADD CONSTRAINT klienci_adresy_fk FOREIGN KEY ( adresy_id_adres )
        REFERENCES adresy ( id_adres );

ALTER TABLE opinie
    ADD CONSTRAINT opinie_klienci_fk FOREIGN KEY ( klienci_id_klienta )
        REFERENCES klienci ( id_klienta );

ALTER TABLE opinie
    ADD CONSTRAINT opinie_wypożyczenia_fk FOREIGN KEY ( wypozyczenia_id_wypozyczenia )
        REFERENCES wypozyczenia ( id_wypozyczenia );

ALTER TABLE pracownicy
    ADD CONSTRAINT pracownicy_adresy_fk FOREIGN KEY ( adresy_id_adres )
        REFERENCES adresy ( id_adres );

ALTER TABLE przypomnienia
    ADD CONSTRAINT przypomnienia_wypożyczenia_fk FOREIGN KEY ( wypozyczenia_id_wypozyczenia )
        REFERENCES wypozyczenia ( id_wypozyczenia );

ALTER TABLE raporty
    ADD CONSTRAINT raporty_wypożyczenia_fk FOREIGN KEY ( wypozyczenia_id_wypozyczenia )
        REFERENCES wypozyczenia ( id_wypozyczenia );

ALTER TABLE reklamacje
    ADD CONSTRAINT reklamacje_klienci_fk FOREIGN KEY ( klienci_id_klienta )
        REFERENCES klienci ( id_klienta );

ALTER TABLE reklamacje
    ADD CONSTRAINT reklamacje_wypożyczenia_fk FOREIGN KEY ( wypozyczenia_id_wypozyczenia )
        REFERENCES wypozyczenia ( id_wypozyczenia );

ALTER TABLE rezerwacje
    ADD CONSTRAINT rezerwacje_klienci_fk FOREIGN KEY ( klienci_id_klienta )
        REFERENCES klienci ( id_klienta );

ALTER TABLE samochody
    ADD CONSTRAINT samochody_promocje_fk FOREIGN KEY ( promocje_id )
        REFERENCES promocje ( id );

ALTER TABLE samochody
    ADD CONSTRAINT samochody_przeglądy_fk FOREIGN KEY ( przeglady_id )
        REFERENCES przeglady ( id );

ALTER TABLE samochody
    ADD CONSTRAINT samochody_ubezpieczenia_fk FOREIGN KEY ( ubezpieczenia_id )
        REFERENCES ubezpieczenia ( id );

ALTER TABLE usterki
    ADD CONSTRAINT usterki_wypożyczenia_fk FOREIGN KEY ( wypozyczenia_id_wypozyczenia )
        REFERENCES wypozyczenia ( id_wypozyczenia );

ALTER TABLE wypozyczenia
    ADD CONSTRAINT wypożyczenia_klienci_fk FOREIGN KEY ( klienci_id_klienta )
        REFERENCES klienci ( id_klienta );

ALTER TABLE wypozyczenia
    ADD CONSTRAINT wypozyczenia_pracownicy_fk FOREIGN KEY ( pracownicy_id_pracownika )
        REFERENCES pracownicy ( id_pracownika );

ALTER TABLE wypozyczenia
    ADD CONSTRAINT wypozyczenia_samochody_fk FOREIGN KEY ( samochody_id_samochod )
        REFERENCES samochody ( id_samochod );

ALTER TABLE zarezerwowane_samochody
    ADD CONSTRAINT zarez_sam_rezerwacje_fk FOREIGN KEY ( rezerwacje_id )
        REFERENCES rezerwacje ( id );

ALTER TABLE zarezerwowane_samochody
    ADD CONSTRAINT zarezerwo_samoc_sam_fk FOREIGN KEY ( samochody_id_samochod )
        REFERENCES samochody ( id_samochod );

ALTER TABLE zasady_wypozyczen
    ADD CONSTRAINT zasady_wypozyczen_wyp_fk FOREIGN KEY ( wypozyczenia_id_wypozyczenia )
        REFERENCES wypozyczenia ( id_wypozyczenia );

ALTER TABLE zasady_wypozyczen
    ADD CONSTRAINT zasady_wypozyczen_zasady_fk FOREIGN KEY ( zasady_id )
        REFERENCES zasady ( id );

CREATE SEQUENCE akcesoria_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER akcesoria_id_trg BEFORE
    INSERT ON akcesoria
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := akcesoria_id_seq.nextval;
END;
/

CREATE SEQUENCE akcesoria_samochodow_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER akcesoria_samochodow_id_trg BEFORE
    INSERT ON akcesoria_samochodow
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := akcesoria_samochodow_id_seq.nextval;
END;
/

CREATE SEQUENCE kary_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER kary_id_trg BEFORE
    INSERT ON kary
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := kary_id_seq.nextval;
END;
/

CREATE SEQUENCE kary_wypozyczenia_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER kary_wypozyczenia_id_trg BEFORE
    INSERT ON kary_wypozyczenia
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := kary_wypozyczenia_id_seq.nextval;
END;
/

CREATE SEQUENCE opinie_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER opinie_id_trg BEFORE
    INSERT ON opinie
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := opinie_id_seq.nextval;
END;
/

CREATE SEQUENCE pracownicy_id_pracownika_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pracownicy_id_pracownika_trg BEFORE
    INSERT ON pracownicy
    FOR EACH ROW
    WHEN ( new.id_pracownika IS NULL )
BEGIN
    :new.id_pracownika := pracownicy_id_pracownika_seq.nextval;
END;
/

CREATE SEQUENCE promocje_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER promocje_id_trg BEFORE
    INSERT ON promocje
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := promocje_id_seq.nextval;
END;
/

CREATE SEQUENCE przeglady_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER przeglady_id_trg BEFORE
    INSERT ON przeglady
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := przeglady_id_seq.nextval;
END;
/

CREATE SEQUENCE przypomnienia_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER przypomnienia_id_trg BEFORE
    INSERT ON przypomnienia
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := przypomnienia_id_seq.nextval;
END;
/

CREATE SEQUENCE raporty_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER raporty_id_trg BEFORE
    INSERT ON raporty
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := raporty_id_seq.nextval;
END;
/

CREATE SEQUENCE reklamacje_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER reklamacje_id_trg BEFORE
    INSERT ON reklamacje
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := reklamacje_id_seq.nextval;
END;
/

CREATE SEQUENCE rezerwacje_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER rezerwacje_id_trg BEFORE
    INSERT ON rezerwacje
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := rezerwacje_id_seq.nextval;
END;
/

CREATE SEQUENCE samochody_id_samochod_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER samochody_id_samochod_trg BEFORE
    INSERT ON samochody
    FOR EACH ROW
    WHEN ( new.id_samochod IS NULL )
BEGIN
    :new.id_samochod := samochody_id_samochod_seq.nextval;
END;
/

CREATE SEQUENCE ubezpieczenia_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ubezpieczenia_id_trg BEFORE
    INSERT ON ubezpieczenia
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := ubezpieczenia_id_seq.nextval;
END;
/

CREATE SEQUENCE usterki_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER usterki_id_trg BEFORE
    INSERT ON usterki
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := usterki_id_seq.nextval;
END;
/

CREATE SEQUENCE wypozyczenia_id_wypozyczenia START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER wypozyczenia_id_wypozyczenia BEFORE
    INSERT ON wypozyczenia
    FOR EACH ROW
    WHEN ( new.id_wypozyczenia IS NULL )
BEGIN
    :new.id_wypozyczenia := wypozyczenia_id_wypozyczenia.nextval;
END;
/

CREATE SEQUENCE zarezerwowane_samochody_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER zarezerwowane_samochody_id_trg BEFORE
    INSERT ON zarezerwowane_samochody
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := zarezerwowane_samochody_id_seq.nextval;
END;
/

CREATE SEQUENCE zasady_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER zasady_id_trg BEFORE
    INSERT ON zasady
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := zasady_id_seq.nextval;
END;
/

CREATE SEQUENCE zasady_wypozyczen_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER zasady_wypozyczen_id_trg BEFORE
    INSERT ON zasady_wypozyczen
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := zasady_wypozyczen_id_seq.nextval;
END;
/

