-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Lug 10, 2018 alle 15:42
-- Versione del server: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `condivino2`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `num_evento` int(11) NOT NULL,
  `nome_evento` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `username_evento` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `data_evento` date DEFAULT NULL,
  `vino_evento` int(11) DEFAULT NULL,
  `costo` int(11) NOT NULL,
  `posti_disponibili` int(11) NOT NULL,
  `note` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `immagine_evento` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `evento`
--

INSERT INTO `evento` (`num_evento`, `nome_evento`, `username_evento`, `data_evento`, `vino_evento`, `costo`, `posti_disponibili`, `note`, `immagine_evento`) VALUES
(1, 'Cena a casa mia', 'massimovirno', '2018-07-10', 1, 50, 10, 'Il menu prevede un cous cous con melanzane e zucchine. Cortorno di peperoni', 'img/foto01.jpg'),
(2, 'BBQ in giardino', 'antoniomartone', '2018-07-11', 2, 50, 5, 'Brace nel giardino con carni e bruschette', 'img/foto02.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `oste`
--

CREATE TABLE IF NOT EXISTS `oste` (
  `num_evento` int(11) NOT NULL,
  `username_oste` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `voto_totale` int(11) NOT NULL DEFAULT '0',
  `num_voti` int(11) NOT NULL DEFAULT '0',
  `commento` varchar(300) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `oste`
--

INSERT INTO `oste` (`num_evento`, `username_oste`, `voto_totale`, `num_voti`, `commento`) VALUES
(1, 'vaan46', 0, 0, ''),
(2, 'ade91', 0, 0, ''),
(3, 'ade91', 5, 1, '<b>vaan46</b>: molto buono<br>');

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipante`
--

CREATE TABLE IF NOT EXISTS `partecipante` (
  `username_partecipante` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `num_evento` int(11) NOT NULL,
  `feedback_oste` float DEFAULT '0',
  `commento_oste` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `votato` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `partecipante`
--

INSERT INTO `partecipante` (`username_partecipante`, `num_evento`, `feedback_oste`, `commento_oste`, `votato`) VALUES
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
  `immagine_profilo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`username`, `password`, `nome`, `cognome`, `data_nascita`, `citta_nascita`, `citta_residenza`, `sesso`, `cod_fiscale`, `email`, `num_telefono`, `stato_attivazione`, `codice_attivazione`, `amministratore`, `immagine_profilo`) VALUES
('ade91', '0000', 'antonio', 'de fabritiis', '1991-03-14', 'penne', 'penne', 'm', 'fbrdfb91a14a456t', 'adefabritiis@hotmail.it', '3485212365', 1, '', 0, 'img/m_imgprofilo.jpg'),
('antoniomartone', '0000', 'antonio', 'martone', '1991-03-14', 'penne', 'penne', 'm', 'fbrdfb91a14a456t', 'adefabritiis@hotmail.it', '3434212365', 1, '', 0, 'img/m_imgprofilo.jpg'),
('isaacnewton', '0000', 'isaac', 'newton', '1991-03-14', 'penne', 'penne', 'm', 'fbrdfb91a14a456t', 'adefabritiis@hotmail.it', '3485212344', 1, '', 0, 'img/m_imgprofilo.jpg'),
('mariecurie', '0000', 'marie', 'curie', '1991-03-14', 'penne', 'penne', 'f', 'fbrdfb91a14a456t', 'adefabritiis@hotmail.it', '3485212355', 1, '', 0, 'img/m_imgprofilo.jpg'),
('massimovirno', '0000', 'massimo', 'virno', '1980-01-01', 'penne', 'penne', 'm', 'fbrdfb91a14a456t', 'io@massimovirno.it', '3485212365', 1, '', 0, 'img/m_imgprofilo.jpg'),
('nikolatesla', '0000', 'nikola', 'tesla', '1991-03-14', 'penne', 'penne', 'm', 'fbrdfb91a14a456t', 'adefabritiis@hotmail.it', '3485212365', 1, '', 0, 'img/m_imgprofilo.jpg'),
('vaan46', '1234', 'daniele', 'ciambrone', '1991-08-17', 'laquila', 'laquila', 'm', 'cmbdnl91m17a345d', 'vaan46@hotmail.it', '3473135445', 1, '', 1, 'img/m_imgprofilo.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `vino`
--

CREATE TABLE IF NOT EXISTS `vino` (
  `num_vino` int(11) NOT NULL,
  `nome_vino` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `produttore` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `denominazione` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `vitigno` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `anno` int(4) NOT NULL,
  `descrizione` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `immagine_vino` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `vino`
--

INSERT INTO `vino` (`num_vino`, `nome_vino`, `produttore`, `denominazione`, `vitigno`, `anno`, `descrizione`, `immagine_vino`) VALUES
(1, 'Sursur', 'Donnafugata', 'Sicilia doc', 'Grillo', 2016, 'Il nome sur sur significa grillo deriva dalla lingua araba classica un tempo parlata anche in Sicilia. Dalle uve dell''omonimo vitigno nasce questo vino che ha tutta la poesia del canto dei gril', 'img/sursur.jpg'),
(2, 'Monte Sant Urbano', 'Speri Fratelli', 'Amarone della Valpolicella DOC', 'corvina', 2012, 'Vino dai profumi ampissimi e dalla complessità indiscussa questo Amarone sfida il tempo prestandosi ad un invecchiamento anche lungo in bottiglia', 'img/amarone.jpg'),
(3, 'Tignanello', 'Antinori', 'Toscana IGT', 'sangiovese', 2014, 'Tignanello, in origine "Chianti Classico Riserva vigneto Tignanello" e dal 1971 Toscana IGT con il nome di Tignanello. Dal 1982 la composizione è rimasta la stessa di quella attuale. Tignanello viene prodotto soltanto nelle annate migliori. Il meglio dell''esperienza Antinori in un vino senza eguali ', 'img/tignanello.jpg'),
(4, 'Per è Palummo', 'Casa D''Ambra', 'Ischia Doc', 'perepalummo', 2017, 'Questo vino nasce da uve ai più sconosciute, tipiche della zona di Ischia e del Golfo di Napoli. Con i suoi profumi delicati e vinosi e a sua anima vivace e intrigante esprime tutto il calore e l''energia della terra dove nasce!', 'img/perepalummo.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`num_evento`), ADD UNIQUE KEY `num_evento` (`num_evento`), ADD KEY `vino_evento` (`vino_evento`);

--
-- Indexes for table `oste`
--
ALTER TABLE `oste`
  ADD PRIMARY KEY (`num_evento`), ADD KEY `username_oste` (`username_oste`);

--
-- Indexes for table `partecipante`
--
ALTER TABLE `partecipante`
  ADD PRIMARY KEY (`username_partecipante`,`num_evento`), ADD KEY `num_evento` (`num_evento`);

--
-- Indexes for table `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `vino`
--
ALTER TABLE `vino`
  ADD PRIMARY KEY (`num_vino`), ADD KEY `nome_vino` (`nome_vino`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `evento`
--
ALTER TABLE `evento`
  MODIFY `num_evento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vino`
--
ALTER TABLE `vino`
  MODIFY `num_vino` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `evento`
--
ALTER TABLE `evento`
ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`num_evento`) REFERENCES `oste` (`num_evento`) ON DELETE CASCADE,
ADD CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`vino_evento`) REFERENCES `vino` (`num_vino`);

--
-- Limiti per la tabella `oste`
--
ALTER TABLE `oste`
ADD CONSTRAINT `oste_ibfk_1` FOREIGN KEY (`username_oste`) REFERENCES `utente` (`username`);

--
-- Limiti per la tabella `partecipante`
--
ALTER TABLE `partecipante`
ADD CONSTRAINT `partecipante_ibfk_1` FOREIGN KEY (`username_partecipante`) REFERENCES `utente` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
