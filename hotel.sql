-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Gen 13, 2021 alle 15:40
-- Versione del server: 5.7.24
-- Versione PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `ospite`
--

CREATE TABLE `ospite` (
  `ospite_id` int(11) NOT NULL,
  `ospite_nome` varchar(50) NOT NULL,
  `ospite_cog` varchar(50) NOT NULL,
  `ospite_cf` varchar(30) NOT NULL,
  `ospite_data` date NOT NULL,
  `ospite_doctip` varchar(30) NOT NULL,
  `ospite_docnum` varchar(30) NOT NULL,
  `ospite_num` varchar(50) NOT NULL,
  `ospite_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `pren_id` int(11) NOT NULL,
  `pren_inizio` date NOT NULL,
  `pren_fine` date NOT NULL,
  `pren_prezzo` int(11) NOT NULL,
  `pren_tipopag` varchar(50) NOT NULL,
  `FK_ospite_id` int(11) NOT NULL,
  `FK_stanza_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `stanza`
--

CREATE TABLE `stanza` (
  `stanza_id` int(11) NOT NULL,
  `stanza_bagno` tinyint(4) NOT NULL,
  `stanza_mq` smallint(6) NOT NULL,
  `stanza_letti` tinyint(4) NOT NULL,
  `stanza_prezzo` mediumint(9) NOT NULL,
  `stanza_tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `ospite`
--
ALTER TABLE `ospite`
  ADD PRIMARY KEY (`ospite_id`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`pren_id`),
  ADD KEY `FK_stanza` (`FK_stanza_id`),
  ADD KEY `FK2` (`FK_ospite_id`);

--
-- Indici per le tabelle `stanza`
--
ALTER TABLE `stanza`
  ADD PRIMARY KEY (`stanza_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `ospite`
--
ALTER TABLE `ospite`
  MODIFY `ospite_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  MODIFY `pren_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `stanza`
--
ALTER TABLE `stanza`
  MODIFY `stanza_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`FK_stanza_id`) REFERENCES `stanza` (`stanza_id`),
  ADD CONSTRAINT `FK2` FOREIGN KEY (`FK_ospite_id`) REFERENCES `ospite` (`ospite_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
