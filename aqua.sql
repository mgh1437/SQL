-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 30 Mar 2023, 20:01
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `aqua`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `ID` int(11) NOT NULL,
  `IMIE` varchar(255) NOT NULL,
  `NAZWISKO` varchar(255) DEFAULT NULL,
  `WIEK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `strefa`
--

CREATE TABLE `strefa` (
  `ID` int(11) NOT NULL,
  `Magazyn` int(11) NOT NULL,
  `Strefa` varchar(24) DEFAULT NULL,
  `rodzaj_Pracowników` varchar(255) DEFAULT NULL,
  `pracownicy_a` int(11) NOT NULL,
  `pracownicy_b` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyplata`
--

CREATE TABLE `wyplata` (
  `ID` int(11) NOT NULL,
  `Suma_Netto` int(20) DEFAULT NULL,
  `Suma_Brutto` int(20) DEFAULT NULL,
  `Procent_podatku` int(20) NOT NULL,
  `Oszczedności` int(30) NOT NULL,
  `Wydatki` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `strefa`
--
ALTER TABLE `strefa`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `pracownicy_a` (`pracownicy_a`),
  ADD KEY `pracownicy_b` (`pracownicy_b`);

--
-- Indeksy dla tabeli `wyplata`
--
ALTER TABLE `wyplata`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `strefa`
--
ALTER TABLE `strefa`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wyplata`
--
ALTER TABLE `wyplata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `strefa`
--
ALTER TABLE `strefa`
  ADD CONSTRAINT `strefa_ibfk_1` FOREIGN KEY (`pracownicy_a`) REFERENCES `pracownik` (`ID`),
  ADD CONSTRAINT `strefa_ibfk_2` FOREIGN KEY (`pracownicy_b`) REFERENCES `pracownik` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
