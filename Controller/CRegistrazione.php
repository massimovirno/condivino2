<?php
class CRegistrazione {
    private $_username=null;
    private $_password=null;
    private $_errore='';
    private $_autenticato=false;
    
    /**
     * controlla se l'utente è registrato e autenticato
     * @return boolean
     */
    public function getUtenteRegistrato() {
        $autenticato=false;
        $session=USingleton::getInstance('USession');
        $VRegistrazione= USingleton::getInstance('VRegistrazione');
        $task=$VRegistrazione->getTask();
        $controller=$VRegistrazione->getController();
        $this->_username=$VRegistrazione->getUsername();
        $this->_password=$VRegistrazione->getPassword();
        if ($session->leggi_valore('username')!=false) {
            $autenticato=true;
            //autenticato
        } elseif ($task=='autentica' && $controller='registrazione') {
            //controlla autenticazione
            $autenticato=$this->autentica($this->_username, $this->_password);
        }
        if ($task=='esci' && $controller='registrazione') {
            //logout
            $this->logout();
            $autenticato=false;
        }
        $VRegistrazione->impostaErrore($this->_errore);
        $this->_errore='';
        return $autenticato;
    }


     /**
     * Controlla se una coppia username e password corrispondono ad un utente regirtrato ed in tal caso impostano le variabili di sessione relative all'autenticazione
     *
     * @param string $username
     * @param string $password
     * @return boolean
     */
    public function autentica($username, $password) {
        $FUtente=new FUtente();
        $utente=$FUtente->load($username);
        if ($utente!=false) {
            if ($utente->getAccountAttivo()) {
                //account attivo
                if ($username==$utente->username && $password==$utente->password) {
                    $session=USingleton::getInstance('USession');
                    $session->imposta_valore('username',$username);
                    $session->imposta_valore('nome_cognome',$utente->nome.' '.$utente->cognome);
                    $session->imposta_valore('amministratore',false);
                    $FUtente=new FUtente();
                    $amministratore=$FUtente->isAmministratore($username);
                    if($amministratore)
                        $session->imposta_valore('amministratore',true);
                    $this->_autenticato=true;
                    return true;
                } else {
                    $this->_errore='Username o password errati';
                    //username password errati
                }
            } else {
                $this->_errore='L\'account non &egrave; attivo';
                //account non attivo
            }
        } else {
            $this->_errore='L\'account non esiste';
            //account non esiste
        }
        return false;
    }
    
     /**
     * Funzione che effettua la validazione lato server dei dati inseriti
     * @param array
     * @return boolean
     */
     public function validaDati($dati) {
         $username=$dati['username'];
         $password=$dati['password'];
         $password_1=$dati['password_1'];
         $nome=$dati['nome'];
         $cognome=$dati['cognome'];
         $sesso=$dati['sesso'];
         $data_nascita=$dati['data_nascita'];
         $citta_nascita=$dati['citta_nascita'];
         $citta_residenza=$dati['citta_residenza'];
         $email=$dati['email'];
         $num_telefono=$dati['num_telefono'];
         $cod_fiscale=$dati['cod_fiscale'];
         list($anno,$mese,$giorno) = explode("/", $data_nascita);
         $FUtente=new FUtente();
         if($FUtente->verificaUsername($username)) // Se l'username è gia presente
            return false;
         elseif($password!=$password_1)
            return false;
         elseif(!preg_match("/^([a-zA-Z ]+)$/i", $nome))
            return false;
         elseif(!preg_match("/^[A-Z '-]{2,30}$/i", $cognome))
            return false;
         elseif(!preg_match("/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/", $email)) 
            return false;
         elseif($FUtente->verificaEmail($email))
            return false;
         elseif($FUtente->verificaCodFiscale($cod_fiscale))
            return false; 
         elseif(!preg_match("/^(?=.*\d).{4,12}$/i" , $password))
            return false;
         elseif(!checkdate($mese,$giorno,$anno))
            return false;
         else
            return true;
     }

    /**
     * Crea un utente sul database controllando che non esista già
     * @return mixed
     */
    public function creaUtente() {
        $view=USingleton::getInstance('VRegistrazione');
        $dati_registrazione=$view->getDatiRegistrazione();
        $utente=new EUtente();
        $FUtente=new FUtente();
        $validazione=$this->validaDati($dati_registrazione);
        if($validazione) {
            unset($dati_registrazione['password_1']);
            $keys=array_keys($dati_registrazione);
            $i=0;
            foreach ($dati_registrazione as $dato) {
                $utente->$keys[$i]=$dato;
                $i++;
            }
            $utente->setAccountAttivo();
            $FUtente->store($utente);
            $view->setLayout('conferma_registrazione');
            return $view->processaTemplate();
        }
        else {
            $view->setLayout('problemi');
            $result=$view->processaTemplate();
            $view->setLayout('modulo');
            $result.=$view->processaTemplate();
            return $result;
        }
    }
            
     
    
    /**
     * Funzione che mostra il modulo di registrazione
     *
     * @return string
     */
    public function moduloRegistrazione() {
        $VRegistrazione=USingleton::getInstance('VRegistrazione');
        $VRegistrazione->setLayout('modulo');
        return $VRegistrazione->processaTemplate();
    }
    
    /**
    * Funzione che effettua il logout
    * @return mixed
    */
    public function logout() {
        $session=USingleton::getInstance('USession');
        $session->cancella_valore('username');
        $session->cancella_valore('nome_cognome');
        $session->cancella_valore('amministratore');
        return $this->ultimiEventi(); 
    }
        
    public function errore_aggiornamento(){
        $view=USingleton::getInstance('VRegistrazione');
        $view->setControllerTaskDefault();
        $view->setLayout('errore_aggiornamento');
        return $view->processaTemplateParziale();
    }
    
    /**
    * Funzione che mostra gli ultimi eventi inseriti caricando l'intera pagina
    * @return mixed
    */
    public function ultimiEventi(){
        $view=USingleton::getInstance('VRicerca');
        $FEvento=new FEvento();
        $eventi=$FEvento->ultimiEventi();
        $view->mostraListaUltimiEventi($eventi);
        return $view->processaTemplate();
    }
    
    /**
    * Funzione che mostra gli ultimi eventi inseriti mediante una chiamata ajax
    * @return mixed
    */
    public function ultimiEventiParziale(){
        $view=USingleton::getInstance('VRicerca');
        $FEvento=new FEvento();
        $eventi=$FEvento->ultimiEventi();
        $view->mostraListaUltimiEventi($eventi);
        return $view->processaTemplateParziale();
    }
    
    /**
    * Funzione che mostra il profilo dell'utente tramite account->profilo
    * @return mixed 
    */
    public function visualizzaProfilo() {
        $session = USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        if ($username!=false) {
            $view=Usingleton::getInstance('VRegistrazione');
            $view->setLayout('visualizza_profilo');
            $FUtente=new FUtente();
            $utente=$FUtente->load($username);
            $view->impostaDati('immagine_profilo',$utente->immagine_profilo);
            $view->impostaDati('username',$utente->username);
            $view->impostaDati('nome',$utente->nome);
            $view->impostaDati('cognome',$utente->cognome);
            $view->impostaDati('data_nascita',$utente->data_nascita);
            $view->impostaDati('citta_residenza',$utente->citta_residenza);
            $view->impostaDati('citta_nascita',$utente->citta_nascita);
            $view->impostaDati('email',$utente->email);
            $view->impostaDati('num_telefono',$utente->num_telefono);
            $dati_oste= $FUtente->getMediaOste($username);
            $dati_partecipante= $FUtente->getMediaPartecipante($username);
	    $num_voti_partecipante= $FUtente->getNumVotiPartecipante($username);
	    $view->impostaDati('num_voti_pass', $num_voti_partecipante);
            $view->impostaDati('media_feedback_oste',ceil($dati_oste[0]));
            $view->impostaDati('num_eventi_oste',$dati_oste[1]);
            $view->impostaDati('media_feedback_partecipante',ceil($dati_partecipante));
	    $commenti_oste=$FUtente->getArrayFeedbackOste($username);
            $commenti_partecipante=$FUtente->getArrayFeedbackPartecipante($username);
	    $view->impostaDati('array_commenti_partecipante',$commenti_partecipante);
	    $view->impostaDati('array_commenti_oste',$commenti_oste);
            return $view->processaTemplateParziale();
        }
        else $this->errore_aggiornamento();
    }
    
    /**
    * Funzione che mostra il profilo dell'utente 
    * @return mixed 
    */
    public function visualizzaUtente($username){
        $session=USingleton::getInstance('USession');
        $loggato_amministratore=$session->leggi_valore('amministratore');
        $view=Usingleton::getInstance('VRegistrazione');
        $view->setLayout('visualizza_profilo_utente');
        $FUtente=new FUtente();
        $utente=$FUtente->load($username);
	$view->impostaDati('immagine_profilo',$utente->immagine_profilo);
        $view->impostaDati('username',$utente->username);
        $view->impostaDati('nome',$utente->nome);
        $view->impostaDati('cognome',$utente->cognome);
        $view->impostaDati('data_nascita',$utente->data_nascita);
        $view->impostaDati('citta_residenza',$utente->citta_residenza);
	$view->impostaDati('citta_nascita',$utente->citta_nascita);
        $view->impostaDati('email',$utente->email);
        $view->impostaDati('num_telefono',$utente->num_telefono);
        $view->impostaDati('amministratore',$utente->amministratore);
        $dati_oste= $FUtente->getMediaOste($username);
        $dati_partecipante= $FUtente->getMediaPartecipante($username);
        $view->impostaDati('media_feedback_oste',ceil($dati_oste[0]));
        $view->impostaDati('num_eventi_oste',$dati_oste[1]);
	$num_voti_partecipante= $FUtente->getNumVotiPartecipante($username);
	$view->impostaDati('num_voti_pass', $num_voti_partecipante);
        $view->impostaDati('media_feedback_partecipante',ceil($dati_partecipante));
        $view->impostaDati('loggato_amministratore',$loggato_amministratore);
        $view->impostaDati('partecipa',$view->isPartecipante());
	$commenti_oste=$FUtente->getArrayFeedbackOste($username);
        $commenti_partecipante=$FUtente->getArrayFeedbackPartecipante($username);
	$view->impostaDati('array_commenti_partecipante',$commenti_partecipante);
	$view->impostaDati('array_commenti_oste',$commenti_oste);
        $view->processaTemplateParziale();
    }
    
    /**
    * Funzione che gestisce il profilo dell'utente
    * @return mixed 
    */
    public function gestisciProfilo(){
        $session = USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        if ($username!=false) {
            $view=Usingleton::getInstance('VRegistrazione');
            $view->setLayout('gestisci_profilo');
            $FUtente=new FUtente();
            $utente=$FUtente->load($username);
            $view->impostaDati('username', $utente->username);
            $view->impostaDati('nome', $utente->nome);
            $view->impostaDati('cognome', $utente->cognome);
            $view->impostaDati('immagine_profilo',$utente->immagine_profilo);
            $FVino = new FVino();
            $array= $FVino->getVini($username);
            $view->impostaDati('array',$array);
            return $view->processaTemplateParziale();
        }
        else $this->errore_aggiornamento();
    }
    
    /**
    * Funzione che gestisce le azioni successive al login
    * @return mixed 
    */
    public function confermaLogin() {
        if ($this->_autenticato) { 
            $controller=USingleton::getInstance('CRicerca');
            return $controller->ultimiEventi(); }
        else {
            $view=USingleton::getInstance('VRegistrazione');
            $view->setLayout('problemi');
            return $view->processaTemplate();
        }
    }
    
    /**
    * Funzione che gestisce i eventi offerti dall'utente e i eventi a cui ha partecipato
    * @return mixed 
    */
    public function gestisciEventi(){
        $session = USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        if ($username!=false) {
            $view=Usingleton::getInstance('VRegistrazione');
            $FEvento= new FEvento();
            $array_eventi= $FEvento->EventiPersonali($username);
            $array_partecipante= $FEvento->EventiPartecipante($username);
            $view->impostaDati('username', $username);
            $view->impostaDati('array_partecipante', $array_partecipante);
            $view->impostaDati('array_eventi',$array_eventi);
            $view->setLayout('gestisci_eventi');
            return $view->processaTemplateParziale();
        }
        else $this->errore_aggiornamento();
    }
    
    /**
    * Funzione che permette di rendere amministratore un utente
    * @param string
    * @return mixed 
    */
    public function rendi_amministratore($username){
        $session=USingleton::getInstance('USession');
        $username_loggato=$session->leggi_valore('username');
        $amministratore=$session->leggi_valore('amministratore');
        if ($username_loggato!=false && $amministratore) {
            $FUtente=new FUtente();
            $FUtente->rendi_amministratore($username);
            $this->verifica_tipo_utente($username);
        }
        else $this->errore_aggiornamento();
    }
    
    /**
    * Funzione che rende un amministratore un semplice utente
    * @param string
    * @return mixed 
    */
    public function rendi_utente($username){
        $session=USingleton::getInstance('USession');
        $username_loggato=$session->leggi_valore('username');
        $amministratore=$session->leggi_valore('amministratore');
        if ($username_loggato!=false && $amministratore) {
            $FUtente=new FUtente();
            $FUtente->rendi_utente($username);
            $this->verifica_tipo_utente($username);
        }
        else $this->errore_aggiornamento();
    }
    
    /**
    * Funzione che permette di attivare l'account di un utente
    * @param string
    * @return mixed 
    */
    public function attiva_account($username){
        $session=USingleton::getInstance('USession');
        $username_loggato=$session->leggi_valore('username');
        $amministratore=$session->leggi_valore('amministratore');
        if ($username_loggato!=false && $amministratore) {
            $FUtente=new FUtente();
            $FUtente->attiva_account($username);
            $this->verifica_tipo_utente($username);
        }
        else $this->errore_aggiornamento();
    }
    
    /**
    * Funzione che permette di disattivare l'account di un utente
    * @param string
    * @return mixed 
    */
    public function disattiva_account($username){
        $session=USingleton::getInstance('USession');
        $username_loggato=$session->leggi_valore('username');
        $amministratore=$session->leggi_valore('amministratore');
        if ($username_loggato!=false && $amministratore) {
            $FUtente=new FUtente();
            $FUtente->disattiva_account($username);
            $this->verifica_tipo_utente($username);
        }
        else $this->errore_aggiornamento();
    }
    
    /**
    * Funzione che permette di verificare lo stato di un utente
    * @param string
    * @return mixed 
    */
    public function verifica_tipo_utente($username){
        $session=USingleton::getInstance('USession');
        $username_loggato=$session->leggi_valore('username');
        $amministratore=$session->leggi_valore('amministratore');
        if ($username_loggato!=false && $amministratore) {
            $view=Usingleton::getInstance('VRegistrazione');
            $FUtente=new FUtente();
            $utente=$FUtente->verifica_tipo_utente($username);
            $view->impostaDati('amministratore',$utente['amministratore']);
            $view->impostaDati('attivo',$utente['stato_attivazione']);
            $view->impostaDati('username',$username);
            $view->setLayout('amministrazione_div');
            return $view->processaTemplateParziale();
        }
        else $this->errore_aggiornamento();
    }
    
    /**
    * Funzione che permette di caricare un'immagine del profilo
    * @return mixed 
    */
    public function caricaImmagine(){
        $session = USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        if ($username!=false) {
            $upload_percorso = 'img/'; 
            $file_tmp = $_FILES['img']['tmp_name'];
            $file_nome = $_FILES['img']['name']; 
            move_uploaded_file($file_tmp, $upload_percorso.$file_nome);
            $FUtente=new FUtente();
            $FUtente->aggiornaImmagine($username, $file_nome);
            $view=Usingleton::getInstance('VRegistrazione');
            $view->setLayout('conferma_immagine');
            return $view->processaTemplate();
        }
        else $this->errore_aggiornamento();
    }
    
    /**
    * Funzione che verifica lato client se un'email è gia utilizzata o meno
    * @param string
    */
    public function verificaEmail($email) {
        $FUtente=new FUtente();
        $verifica=$FUtente->verificaEmail($email);
        $esistente=true;
        if(isset($verifica['email'])){
            $esistente=false;
        }
        $mail=array(
            'unique'=>$esistente
        );
        echo json_encode($mail);
    }
    
    /**
    * Funzione che verifica lato client se un'username è gia utilizzato o meno
    * @param string
    */
    public function verificaUsername($username) {
        $FUtente=new FUtente();
        $verifica=$FUtente->verificaUsername($username);
        $esistente=true;
        if(isset($verifica['username'])){
            $esistente=false;
        }
        $user=array(
            'unique'=>$esistente
        );
        echo json_encode($user);
    }
    
    /**
    * Funzione che carica il template per il recupero della password
    */
    public function recuperoPassword() {
        $view=Usingleton::getInstance('VRegistrazione');
        $view->setLayout('recupero');
        return $view->processaTemplateParziale();
    }
    
    /**
    * Funzione che permette il recupero della password
    * @param string
    * @return mixed
    */
    public function invioRecupero($email) {
        $FUtente=new FUtente();
        $esiste=$FUtente->verificaEmail($email);
        if ($esiste) {
            $username=$esiste['username'];
            $password=$this->genera_codice();
            $FUtente->impostaPassword($username, $password);
            $this->inviaMailPassword($email, $username, $password);
        }
        return $this->ultimiEventiParziale();
    }

    /**
     * Invia la mail con la nuova password dell'utente.
     * 
     * @param string $mail mail dell'utente.
     * @param string $username username dell'utente.
     * @param string $password password dell'utente
     */
    public function inviaMailPassword($email, $username, $password) {
       $to=$email;      
       $subject="Nuova Password!";
       $message="Il tuo username è: " . $username . "La tua nuova password è: " . $password;
       $headers='From: shareyourcar@altervista.org' . "\r\n" .
                   'Reply-To: shareyourcar@altervista.org' . "\r\n" .
                   'X-Mailer: PHP/' . phpversion();
                   'MIME-Version: 1.0\n' .
                   'Content-Type: text/html; charset=\"iso-8859-1\"\n' .
                   'Content-Transfer-Encoding: 7bit\n\n';
       mail($to, $subject, $message, $headers); 
    }
    
    /**
     * Fornisce un id univoco utilizzando l' orario. Prende i secondi
     * e i microsecondi e li usa come chiave per generare un numero random
     * di cui viene fatto l'md5
     *
     * @return string codice generato.
     */
    public function genera_codice() {
        list($usec, $sec) = explode(' ', microtime());
        mt_srand((float) $sec + ((float) $usec * 100000));
        return md5(uniqid(mt_rand(), true));
    }
    
    /**
    * Funzione che permette di modificare la password di un utente
    * @return mixed
    */
    public function modificaPassword() {
        $session = USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        if ($username!=false) {
            $view=Usingleton::getInstance('VRegistrazione');
            $view->setLayout('modifica_pwd');
            return $view->processaTemplateParziale();
        }
        else $this->errore_aggiornamento();
    }
    
    /**
    * Funzione che conferma la modifica della password di un utente
    * @return mixed
    */
    public function confermaModificaPwd() {
        $session=USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        if ($username!=false) {
            $view=Usingleton::getInstance('VRegistrazione');
            $pwdattuale=$view->getPwdAttuale();
            $pwd=$view->getPwd();
            $pwd1=$view->getPwd1();
            $FUtente=new FUtente();
            $utente=$FUtente->load($username);
            if ($utente->password==$pwdattuale)
                if ($pwd==$pwd1) {
                    $FUtente->impostaPassword($username,$pwd);
                    return $this->gestisciProfilo();
                }
            $errore=true;
            $view->impostaDati('errore',$errore);
            return $this->modificaPassword();
        }
        else $this->errore_aggiornamento();    
    }
    
     /**
     * Smista le richieste ai relativi metodi della classe
     * 
     * @return mixed
     */
    public function smista() {
        $view=USingleton::getInstance('VRegistrazione');
        switch ($view->getTask()) {
            case 'registra':
                return $this->moduloRegistrazione();
            case 'salva':
                return $this->creaUtente();
            case 'attivazione':
                return $this->attivazione();
            case 'visualizza_profilo':
                return $this->visualizzaProfilo();
            case 'gestisci_profilo':
                return $this->gestisciProfilo();
            case 'gestisci_eventi':
                return $this->gestisciEventi();
            case 'autentica':
                return $this->confermaLogin();
            case 'esci':
                return $this->logout();
            case 'visualizza_utente':
                return $this->visualizzaUtente($view->getUsername());
            case 'rendi_amministratore':
                return $this->rendi_amministratore($view->getUsername());
            case 'rendi_utente':
                return $this->rendi_utente($view->getUsername());
            case 'verifica_tipo_utente':
                return $this->verifica_tipo_utente($view->getUsername());
            case 'attiva_account':
                return $this->attiva_account($view->getUsername());
            case 'disattiva_account':
                return $this->disattiva_account($view->getUsername());
            case 'carica_immagine':
                return $this->caricaImmagine();
            case 'verifica_email':
                return $this->verificaEmail($view->getEmail());
            case 'verifica_username':
                return $this->verificaUsername($view->getUsername());
            case 'recupero_password':
                return $this->recuperoPassword();
            case 'invio_recupero':
                return $this->invioRecupero($view->getEmail());
            case 'modifica_password':
                return $this->modificaPassword();
            case 'conferma_password':
                return $this->confermaModificaPwd();
            case 'comuni':
                return $this->comuni();
        }
    }
}
?>
