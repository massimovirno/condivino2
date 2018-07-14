<?php
/**
 * File VHome.php contenente la classe VHome
 *
 * @package view
 */
/**
 * Classe VHome, estende la classe view del package System e gestisce la visualizzazione e formattazione del sito, inoltre imposta i principali contenuti della pagina, suddivisi in contenuti principali (main_content) e contenuti della barra laterale (side_content)
 *
 * @package View
 */
class VRicerca extends View {
    /**
     * @var string _layout
     */
    private $_layout='default';
    /**
     * restituisce la citta di partenza passata per GET o POST
     * @return mixed
     */
    public function getNomeEvento() {
        if (isset($_REQUEST['nome_evento'])) {
            return $_REQUEST['nome_evento'];
        } else
            return 0;
    }
    /**
     * restituisce la variabile da
     * @return mixed
     */
    public function getDa() {
        if (isset($_REQUEST['da']))
            return $_REQUEST['da'];
        else
            return false;
    }
    /**
     * restituisce l'username del partecipante
     * @return mixed
     */
    public function getUsernamePartecipante() {
        if (isset($_REQUEST['username_partecipante']))
            return $_REQUEST['username_partecipante'];
        else
            return false;
    }
    /**
     * restituisce la citta di arrivo
     * @return mixed
     */
    public function getVinoEvento() {
        if (isset($_REQUEST['vino_evento'])) {
            return $_REQUEST['vino_evento'];
        } else
            return 0;
    }
    /**
     * restituisce la data di partenza
     * @return mixed
     */
    public function getDataEvento() {
        if (isset($_REQUEST['data_evento'])) {
            return $_REQUEST['data_evento'];
        } else
            return 0;
    }
    /**
     * restituisce la variabile ricerca
     * @return mixed
     */
    public function getRicerca() {
        if (isset($_REQUEST['ricerca'])) {
            return $_REQUEST['ricerca'];
        } else
            return 0;
    }
    /**
     * restituisce il costo
     * @return mixed
     */
    public function getCosto() {
        if (isset($_REQUEST['costo'])) {
            return $_REQUEST['costo'];
        } else
            return 0;
    }
    /**
     * restituisce le note
     * @return mixed
     */
    public function getNote() {
        if (isset($_REQUEST['note'])) {
            return $_REQUEST['note'];
        } else
            return 0;
    }
    /**
     * restituisce la targa
     * @return mixed
     */
    public function getTarga() {
        if (isset($_REQUEST['targa'])) {
            return $_REQUEST['targa'];
        } else
            return 0;
    }
   /**
     * restituisce il tipo di vino
     * @return mixed
     */
    public function getTipo() {
        if (isset($_REQUEST['tipo'])) {
            return $_REQUEST['tipo'];
        } else
            return 0;
    }
    /**
     * restituisce il numero dei posti disponibili per un vino
     * @return mixed
     */
    public function getNumPosti() {
        if (isset($_REQUEST['num_posti'])) {
            return $_REQUEST['num_posti'];
        } else
            return 0;
    }
    /**
     * restituisce il tipo di carburante del vino
     * @return mixed
     */
    public function getCarburante() {
        if (isset($_REQUEST['carburante'])) {
            return $_REQUEST['carburante'];
        } else
            return 0;
    }
    /**
     * restituisce il consumo medio del vino
     * @return mixed
     */
    public function getConsumoMedio() {
        if (isset($_REQUEST['consumo_medio'])) {
            return $_REQUEST['consumo_medio'];
        } else
            return 0;
    }
    /**
     * restituisce la valutazione
     * @return mixed
     */
    public function getValutazione() {
        if (isset($_REQUEST['valutazione'])) {
            return $_REQUEST['valutazione'];
        } else
            return 0;
    }
    /**
     * restituisce il commento
     * @return mixed
     */
     public function getCommento() {
        if (isset($_REQUEST['commento'])) {
            return $_REQUEST['commento'];
        } else
            return 0;
    }
    /**
     * Processa il layout scelto nella variabile _layout
     *
     * @return string
     */
    public function processaTemplate() {
        return $this->fetch('ricerca_'.$this->_layout.'.tpl');
    }
    /**
     * visualizza il template parziale
     */
    public function processaTemplateParziale() {
        $this->display('ricerca_'.$this->_layout.'.tpl');
    }
     /**
     * Imposta i dati nel template identificati da una chiave ed il relativo valore
     *
     * @param string $key
     * @param mixed $valore
     */
    public function impostaDati($key,$valore) {
        $this->assign($key,$valore);
    }
    /**
     * Imposta il layout per richiamare il template
     * @param string $layout
     */
    public function setLayout($layout) {
        $this->_layout=$layout;
    }
    /**
     * Assegna una lista di eventi al template ricerca_elenco e lo mostra
     * @param $eventi array
     */
    public function mostraListaEventi($eventi){
        $this->assign('eventi', $eventi);
        $this->display('ricerca_elenco.tpl');
    }
    /**
     * Assegna una lista di ultimi eventi inseriti e al template e lo imposta come layout
     */
    public function mostraListaUltimiEventi($eventi){
        $this->assign('eventi', $eventi);
        $this->setLayout('ultimi');
    }
    /**
     * Assegna una lista di utenti ad un eventuale template
     */
    public function mostraListaUtenti($utenti){
        $this->assign('utenti', $utenti);
    }
    /**
     * Assegna una lista di eventi ad un eventuale template
     * @return mixed
     */
    public function mostraListaCompletaEventi($eventi){
        $this->assign('eventi', $eventi);
    }
}
?>