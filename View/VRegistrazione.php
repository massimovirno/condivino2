<?php
class VRegistrazione extends View {
    /**
     * @var string $_layout
     */
    private $_layout='default';
    
    /**
     * restituisce la password passata tramite GET o POST
     *
     * @return mixed
     */
    public function getPassword() {
        if (isset($_REQUEST['password']))
            return $_REQUEST['password'];
        else
            return false;
    }
    
    /**
     * restituisce la username passata tramite GET o POST
     *
     * @return mixed
     */
    public function getUsername() {
        if (isset($_REQUEST['username']))
            return $_REQUEST['username'];
        else
            return false;
    }
    
    /**
     * restituisce il task
     *
     * @return mixed
     */
    public function getTask() {
        if (isset($_REQUEST['task']))
            return $_REQUEST['task'];
        else
            return false;
    }
    
    /**
     * restituisce il controller
     *
     * @return mixed
     */
    public function getController() {
        if (isset($_REQUEST['controller']))
            return $_REQUEST['controller'];
        else
            return false;
    }
    
    /**
     * restituisce il numero del evento passato tramite GET o POST
     *
     * @return mixed
     */
    public function getNumEvento() {
        if (isset($_REQUEST['num_evento']))
            return $_REQUEST['num_evento'];
        else
            return false;
    }

    /*
    * restituisce l'username del partecipante
    *
    * @return mixed
    */
    public function getUsernamePartecipante() {
        if (isset($_REQUEST['username_partecipante']))
            return $_REQUEST['username_partecipante'];
        else
            return false;
    }
    
    /*
    * restituisce la vino
    *
    * @return mixed
    */
    public function getVino() {
        if (isset($_REQUEST['vino']))
            return $_REQUEST['vino'];
        else
            return false;
    }
    
    /*
    * restituisce l'ordinamento selezionato
    *
    * @return mixed
    */
    public function getOrdinamento() {
        if (isset($_REQUEST['ordinamento']))
            return $_REQUEST['ordinamento'];
        else
            return false;
    }
    
    /**
     * Ricarica il template completo
     * 
     * @return string
     */
    public function processaTemplate() {
        $contenuto=$this->fetch('registrazione_'.$this->_layout.'.tpl');
        return $contenuto;
    }
    
    /*
    * Mostra il template parziale
    */
    public function processaTemplateParziale() {
        $this->display('registrazione_'.$this->_layout.'.tpl');
    }
    
    /**
     * Restituisce l'array contenente i dati di registrazione
     *
     * @return array();
     */
    public function getDatiRegistrazione() {
        $dati_richiesti=array('username','password','password_1','nome','cognome','sesso','data_nascita','citta_nascita','citta_residenza','email','num_telefono','cod_fiscale');
        $dati=array();
        foreach ($dati_richiesti as $dato) {
            if (isset($_REQUEST[$dato]))
                $dati[$dato]=$_REQUEST[$dato];
        }
	$dati["immagine_profilo"]="img/".$dati['sesso']."_imgprofilo.jpg";   
        return $dati;
    }
    /**
     * Imposta l'eventuale errore nel template
     *
     * @param $errore string
     */
    public function impostaErrore($errore){
        $this->assign('errore',$errore);
    }
     /**
     * Imposta il layout per richiamare il template
     *
     * @param string $layout
     */
    public function setLayout($layout){
        $this->_layout=$layout;
    }
    /**
     * Imposta i dati nel template identificati da una chiave ed il relativo valore
     *
     * @param $key string
     * @param $valore mixed
     */
    public function impostaDati($key,$valore){
        $this->assign($key,$valore);
    }
    /*
    * Restituisce l'username ricercato
    *
    * @return mixed
    */
    public function getUsernameRicerca() {
        if (isset($_REQUEST['username_ricerca'])) {
            return $_REQUEST['username_ricerca'];
        } else
            return 0;
    }
    /*
    * Restituisce il cognome ricercato
    *
    * @return mixed
    */
    public function getCognomeRicerca() {
        if (isset($_REQUEST['cognome_ricerca'])) {
            return $_REQUEST['cognome_ricerca'];
        } else
            return 0;
    }
    /*
    * Restituisce la citta ricercata
    *
    * @return mixed
    */
    public function getCittaRicerca() {
        if (isset($_REQUEST['citta_residenza_ricerca'])) {
            return $_REQUEST['citta_residenza_ricerca'];
        } else
            return 0;
    } 
    /*
    * Restituisce il nome evnto di ricerca
    *
    * @return mixed
    */
    public function getNomeEventoRicerca() {
        if (isset($_REQUEST['nome_evento_ricerca'])) {
            return $_REQUEST['nome_evento_ricerca'];
        } else
            return 0;
    }
    /*
    * Restituisce il vino di ricerca
    *
    * @return mixed
    */
    public function getVinoEventoRicerca() {
        if (isset($_REQUEST['vino_evento_ricerca'])) {
            return $_REQUEST['vino_evento_ricerca'];
        } else
            return 0;
    }
    /*
    * Restituisce la data dell'evento di ricerca
    *
    * @return mixed
    */
    public function getDataEventoRicerca() {
        if (isset($_REQUEST['data_evento_ricerca'])) {
            return $_REQUEST['data_evento_ricerca'];
        } else
            return 0;
    }
    /*
    * Restituisce l'email
    *
    * @return mixed
    */
    public function getEmail() {
        if (isset($_REQUEST['email'])) {
            return $_REQUEST['email'];
        } else
            return 0;
    }
    /*
    * Restituisce la vecchia password
    *
    * @return mixed
    */
    public function getPwdAttuale() {
        if (isset($_REQUEST['pwdattuale']))
            return $_REQUEST['pwdattuale'];
        else
            return false;
    }
    /*
    * Restituisce la nuova password
    *
    * @return mixed
    */
    public function getPwd() {
        if (isset($_REQUEST['pwd']))
            return $_REQUEST['pwd'];
        else
            return false;
    }
    /*
    * Restituisce la conferma della nuova password
    *
    * @return mixed
    */
    public function getPwd1() {
        if (isset($_REQUEST['pwd1']))
            return $_REQUEST['pwd1'];
        else
            return false;
    }
    /*
    * Restituisce se l'utente e' partecipante al evento
    *
    * @return bool
    */
    public function isPartecipante() {
        if (isset($_REQUEST['partecipa']))
            return $_REQUEST['partecipa'];
        else
            return false;
    }
}
?>