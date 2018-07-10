-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generato il: Gen 10, 2014 alle 11:36
-- Versione del server: 5.5.27
-- Versione PHP: 5.4.7

--SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
--SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `carpooling`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `guidatore`
--

CREATE TABLE IF NOT EXISTS `guidatore` (
  `num_viaggio` int(11) NOT NULL,
  `username_guidatore` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `targa` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `voto_totale` int(11) NOT NULL DEFAULT '0',
  `num_voti` int(11) NOT NULL DEFAULT '0',
  `commento` varchar(300) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`num_viaggio`),
  KEY `username_guidatore` (`username_guidatore`),
  KEY `targa` (`targa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `guidatore`:
--   `username_guidatore`
--       `utente` -> `username`
--   `targa`
--       `veicolo` -> `targa`
--   `num_viaggio`
--       `viaggio` -> `num_viaggio`
--

--
-- Dump dei dati per la tabella `guidatore`
--

INSERT INTO `guidatore` (`num_viaggio`, `username_guidatore`, `targa`, `voto_totale`, `num_voti`, `commento`) VALUES
(1, 'vaan46', 'aw231gr', 0, 0, ''),
(2, 'ade91', 'sd456rt', 0, 0, ''),
(3, 'ade91', 'sd456rt', 5, 1, '<b>vaan46</b>: molto buono<br>');

-- --------------------------------------------------------

--
-- Struttura della tabella `passeggero`
--

CREATE TABLE IF NOT EXISTS `passeggero` (
  `username_passeggero` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `num_viaggio` int(11) NOT NULL,
  `feedback_guid` float DEFAULT '0',
  `commento_guid` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `votato` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username_passeggero`,`num_viaggio`),
  KEY `num_viaggio` (`num_viaggio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `passeggero`:
--   `username_passeggero`
--       `utente` -> `username`
--   `num_viaggio`
--       `viaggio` -> `num_viaggio`
--

--
-- Dump dei dati per la tabella `passeggero`
--

INSERT INTO `passeggero` (`username_passeggero`, `num_viaggio`, `feedback_guid`, `commento_guid`, `votato`) VALUES
('ade91', 1, 0, '', 0),
('vaan46', 3, 0, '', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE IF NOT EXISTS `utente` (
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cognome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `data_nascita` date NOT NULL,
  `citta_nascita` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `citta_residenza` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sesso` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `cod_fiscale` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `num_telefono` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stato_attivazione` tinyint(1) DEFAULT NULL,
  `codice_attivazione` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amministratore` tinyint(1) NOT NULL DEFAULT '0',
  `immagine_profilo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`username`, `password`, `nome`, `cognome`, `data_nascita`, `citta_nascita`, `citta_residenza`, `sesso`, `cod_fiscale`, `email`, `num_telefono`, `stato_attivazione`, `codice_attivazione`, `amministratore`, `immagine_profilo`) VALUES
('ade91', '0000', 'antonio', 'de fabritiis', '1991-03-14', 'penne', 'penne', 'm', 'fbrdfb91a14a456t', 'adefabritiis@hotmail.it', '3485212365', 1, '', 0, 'img/m_imgprofilo.jpg'),
('vaan46', '1234', 'daniele', 'ciambrone', '1991-08-17', 'laquila', 'laquila', 'm', 'cmbdnl91m17a345d', 'vaan46@hotmail.it', '3473135445', 1, '', 1, 'img/m_imgprofilo.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `veicolo`
--

CREATE TABLE IF NOT EXISTS `veicolo` (
  `targa` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `username_proprietario` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `num_posti` int(11) NOT NULL,
  `carburante` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `consumo_medio` float NOT NULL,
  `attuale` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`targa`),
  KEY `username_proprietario` (`username_proprietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `veicolo`:
--   `username_proprietario`
--       `utente` -> `username`
--

--
-- Dump dei dati per la tabella `veicolo`
--

INSERT INTO `veicolo` (`targa`, `username_proprietario`, `tipo`, `num_posti`, `carburante`, `consumo_medio`, `attuale`) VALUES
('aw231gr', 'vaan46', 'mazda', 5, 'Benzina', 12, 1),
('sd456rt', 'ade91', 'opel', 5, 'GPL', 20, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `viaggio`
--

CREATE TABLE IF NOT EXISTS `viaggio` (
  `num_viaggio` int(11) NOT NULL AUTO_INCREMENT,
  `citta_partenza` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_partenza` date DEFAULT NULL,
  `citta_arrivo` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `costo` int(11) NOT NULL,
  `posti_disponibili` int(11) NOT NULL,
  `note` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`num_viaggio`),
  UNIQUE KEY `num_viaggio` (`num_viaggio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `viaggio`
--

INSERT INTO `viaggio` (`num_viaggio`, `citta_partenza`, `data_partenza`, `citta_arrivo`, `costo`, `posti_disponibili`, `note`) VALUES
(1, 'LAquila', '2014-01-25', 'Roma', 8, 3, 'ok'),
(2, 'Pescara', '2014-01-31', 'Milano', 15, 4, 'conveniente'),
(3, 'Firenze', '2014-01-10', 'Napoli', 20, 3, 'buono');

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `guidatore`
--
ALTER TABLE `guidatore`
  ADD CONSTRAINT `guidatore_ibfk_1` FOREIGN KEY (`username_guidatore`) REFERENCES `utente` (`username`),
  ADD CONSTRAINT `guidatore_ibfk_2` FOREIGN KEY (`targa`) REFERENCES `veicolo` (`targa`),
  ADD CONSTRAINT `guidatore_ibfk_4` FOREIGN KEY (`num_viaggio`) REFERENCES `viaggio` (`num_viaggio`) ON DELETE CASCADE;

--
-- Limiti per la tabella `passeggero`
--
ALTER TABLE `passeggero`
  ADD CONSTRAINT `passeggero_ibfk_1` FOREIGN KEY (`username_passeggero`) REFERENCES `utente` (`username`),
  ADD CONSTRAINT `passeggero_ibfk_3` FOREIGN KEY (`num_viaggio`) REFERENCES `viaggio` (`num_viaggio`) ON DELETE CASCADE;

--
-- Limiti per la tabella `veicolo`
--
ALTER TABLE `veicolo`
  ADD CONSTRAINT `veicolo_ibfk_1` FOREIGN KEY (`username_proprietario`) REFERENCES `utente` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
