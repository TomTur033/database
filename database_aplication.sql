-- Vytvorenie databázy (spúšťa sa mimo databázy, napr. z psql príkazovej konzoly)
CREATE DATABASE tvoja_databaza;

-- Po pripojení do databázy, vytvor tabuľky:

CREATE TABLE Typ_zakaznika (
    ID SERIAL PRIMARY KEY,
    typ VARCHAR(100) NOT NULL
);

CREATE TABLE Aplikacie (
    ID SERIAL PRIMARY KEY,
    nazov_aplikacie VARCHAR(255) NOT NULL
);

CREATE TABLE Verzia_aplikacie (
    ID SERIAL PRIMARY KEY,
    verzia_aplikacie VARCHAR(50) NOT NULL,
    aplikacia_ck INTEGER REFERENCES Aplikacie(ID)
);

CREATE TABLE Zakaznik (
    ID SERIAL PRIMARY KEY,
    nazov VARCHAR(255) NOT NULL,
    typ_zakaznika_ck INTEGER REFERENCES Typ_zakaznika(ID),
    datum_vytvorenia DATE,
    datum_uprava DATE,
    datum_deaktivacie DATE
);

CREATE TABLE Licencia (
    ID SERIAL PRIMARY KEY,
    zakaznik_ck INTEGER REFERENCES Zakaznik(ID),
    verzia_ck INTEGER REFERENCES Verzia_aplikacie(ID),
    licencia_kod VARCHAR(255),
    datum_zaciatku DATE,
    datum_koniec DATE,
    datum_deaktivacie DATE
);
