<?php
/**
 * @access public
 * @package Controller
 */
class CRicerca {

/**
 * Mostra gli ultimi eventi inseriti 
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
 * Inserisce il evento nel database prelevando dati da form 
 */
    public function inserisciEvento() {
        $session=USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        if ($username!=false) {
            $view=Usingleton::getInstance('VRicerca');
            //$FVino= new FVino();
            //$nome_vino=$view->getNomeVino();
            //$posti= $FVino->getPostiVino($nome_vino_presa);
            $EEvento=new EEvento();
            $EEvento->nome_evento=$view->getNomeEvento();
            $EEvento->data_evento=$view->getDataEvento();
            $EEvento->vino_evento=$view->getVinoEvento();
            $EEvento->costo=$view->getCosto();
            $EEvento->posti_disponibili=$view->getPostiDisponibili();
            $EEvento->note=$view->getNote();
            $EEvento->immagine_evento=$view->getImmagineEvento();
            
            $FEvento=new FEvento();
            $FEvento->store($EEvento);
            $num_evento=$FEvento->getUltimoNumEvento();
            $EOste=new EOste();
            $EOste->username_oste=$username;
            $EOste->num_evento=$num_evento;
            $FOste=new FOste();
            $FOste->store($EOste);
            $this->riepilogoEvento($num_evento);
        }
        else $this->errore_aggiornamento();
    }
    
/**
 * Aggiunge un vino inserito dall'utente ai suoi vino
 * @return mixed
 */
    public function aggiungiVino(){
            $session=USingleton::getInstance('USession');
            $username=$session->leggi_valore('username');
            if ($username!=false) {
                $view=USingleton::getInstance('VRicerca');
                $EVino=new EVino();

                $EVino->nome_vino=$view->getNomeVino();
                $EVino->produttore=$view->getProduttore();
                $EVino->denominazione=$view->getDenominazione();
                $EVino->vitigno=$view->getVitigno();
                $EVino->anno=$view->getAnno();
                $EVino->descrizione=$view->getDescrizione();
                $EVino->immagine_vino=$view->getImmagineVino(); // MAX modificare per mostrare etichetta

                $FVino=new FVino();
                $FVino->store($EVino);
                if($_REQUEST['da']=='inserisci'){
                    $FVino=new FVino();
                    $vini=$FVino->getVini($username);
                    $view->impostaDati('vini',$vini);
                    $view->setLayout('menu_vino');
                    $view->processaTemplateParziale();             
                }else{
                    $CRegistrazione=USingleton::getInstance('CRegistrazione');
                    $CRegistrazione->gestisciProfilo();
                }
            }
            else $this->errore_aggiornamento();
    }
    
/**
 * Mostra form di inserimento vino 
 * @return mixed
 */
    public function inserimentoVino(){
            $session=USingleton::getInstance('USession');
            $username=$session->leggi_valore('username');
            if ($username!=false) {
                $view=USingleton::getInstance('VRicerca');
                $view->setLayout('vino');
                $da=$view->getDa();
                $view->impostaDati('da',$da);
                $view->impostaDati('nome_evento',$view->getNomeEvento());
                $view->impostaDati('vino_evento',$view->getVinoEvento());
                $view->impostaDati('data_evento',$view->getDataEvento());
                $view->processaTemplateParziale();
            }
            else $this->errore_aggiornamento();
    }

/**
 * Mostra i dati di uno specifico evento
 * @param $num_evento int
 * @return mixed
 */
    public function riepilogoEvento($num_evento){
            $FEvento=new FEvento();
            $evento=$FEvento->load($num_evento);
            $view=USingleton::getInstance('VRicerca');
            $view->impostaDati('num_evento',$evento->num_evento);
            $view->impostaDati('nome_evento',$evento->nome_evento);
            $view->impostaDati('data_evento',$evento->data_evento);
            $view->impostaDati('vino_evento',$evento->vino_evento);
            $view->impostaDati('costo',$evento->costo);
            $view->impostaDati('posti_disponibili',$evento->posti_disponibili);
            $view->impostaDati('note',$evento->note);
            $view->impostaDati('immagine_evento',$evento->immagine_evento);
            $data_attuale=date('Y-m-d');
            $passato=false;
            if(strtotime($data_attuale)>strtotime($evento->data_evento))
                $passato=true;
            $view->impostaDati('passato',$passato);
            
            
            // MAX
            //print "Vino Evento=\n";
            //print('$vino_evento');
            // $vino=$FVino->load($evento->$vino_evento); 
            
            
            $FVino= new FVino();
            $array= $FVino->getVino($evento->vino_evento);
            $vino= $FVino->load($array[0]['nome_vino']);
            $view->impostaDati('nome_vino',$vino->nome_vino);
            $view->impostaDati('produttore',$vino->produttore);
            $view->impostaDati('denominazione',$vino->denominazione);
            $view->impostaDati('vitigno',$vino->vitigno);
            $view->impostaDati('anno',$vino->anno);
            $view->impostaDati('descrizione',$vino->descrizione);
            $view->impostaDati('immagine_vino',$vino->immagine_vino);
            $FOste= new FOste();
            $username_oste= $FOste->getOste($num_evento);
            $view->impostaDati('username_oste',$username_oste['username_oste']);
            $loggato=false;
            $session=USingleton::getInstance('USession');
            $username=$session->leggi_valore('username');
            $amministratore=$session->leggi_valore('amministratore');
            if ($username!="") {$loggato=true;}
            $view->impostaDati('loggato',$loggato);
            $view->impostaDati('username_partecipante',$username);
            $FPartecipante= new FPartecipante();
            $isPartecipante= $FPartecipante->verificaPartecipante($num_evento,$username);
            $view->impostaDati('isPartecipante',$isPartecipante);
            $array_partecipanti= $FPartecipante->loadPartecipanti($num_evento);
            $view->impostaDati('array_partecipanti',$array_partecipanti);
            $votato= $FPartecipante->eventoVotato($num_evento,$username);
            $view->impostaDati('votato',$votato);
            $isOste= $FOste->verificaOste($num_evento,$username);
            $view->impostaDati('isOste',$isOste);
            $view->impostaDati('isAmministratore',$amministratore);
            if ($isOste || $isPartecipante)
            $view->impostaDati('partecipa',true);
            $view->impostaDati('indietro',$view->getRicerca());
            $view->setLayout('riepilogo');
            return $view->processaTemplateParziale();
     }
     
/**
 * Registra un utente come partecipante al evento
 * @param $num_evento int
 * @return mixed
 */
     public function partecipaEvento($num_evento){
            $session=USingleton::getInstance('USession');
            $username=$session->leggi_valore('username');
            if ($username!=false) {
                $FPartecipante= new FPartecipante();
                $partecipante_presente= $FPartecipante->verificaPartecipante($num_evento,$username);
                $FOste= new FOste();
                $oste_presente= $FOste->verificaOste($num_evento,$username);
                if(!$partecipante_presente && !$oste_presente ){
                    $EPartecipante=new EPartecipante();
                    $EPartecipante->username_partecipante=$username;
                    $EPartecipante->num_evento=$num_evento;
                    $FPartecipante= new FPartecipante();
                    $FPartecipante->store($EPartecipante);
                    $FEvento=new FEvento();
                    $evento=$FEvento->load($num_evento);
                    $posti=$evento->posti_disponibili;
                    $posti--;
                    $evento->posti_disponibili=$posti;
                    $FEvento->update($evento);
                    $this->riepilogoEvento($num_evento);
                }
                else{
                    $view=USingleton::getInstance('VRicerca');
                    $view->setLayout('riepilogo');
                    return $view->processaTemplateParziale();
                }
            }
            else $this->errore_aggiornamento();
     }
     
/**
 * Cancella uno specifico partecipante da un evento
 * @param $num_evento int
 * @param $username string 
 * @return mixed
 */
     public function cancellaPartecipante($num_evento, $username){
            $session=USingleton::getInstance('USession');
            $username=$session->leggi_valore('username');
            if ($username!=false) {
                $FPartecipante= new FPartecipante();
                $partecipante_presente= $FPartecipante->verificaPartecipante($num_evento,$username);
                if($partecipante_presente){
                    $FPartecipante->cancellaPartecipante($num_evento, $username);
                    $FEvento=new FEvento();
                    $evento=$FEvento->load($num_evento);
                    $posti=$evento->posti_disponibili;
                    $posti++;
                    $evento->posti_disponibili=$posti;
                    $FEvento->update($evento);
                    $this->riepilogoEvento($num_evento); 
                }
            }
            else $this->errore_aggiornamento();
     }
    
/**
 * Aggiorna la lista dei vini disponibili per l'utente in inserimento evento 
 * @return mixed
 */
    public function ricarica_vino() {
        $session=USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        if ($username!=false) {
            $view=USingleton::getInstance('VRicerca');
            $view->setLayout('menu_vino');
            $FVino=new FVino();
            $vini=$FVino->getVini($username);
            $view->impostaDati('vini',$vini);
            return $view->processaTemplateParziale();
        }
        else $this->errore_aggiornamento();
    }
     
/**
 * Mostra template di inserimento evento 
 * @return mixed
 */
     public function inserimentoEvento(){
        $session=USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        if ($username!=false) {
            $view=USingleton::getInstance('VRicerca');
            $view->setLayout('inserisci');
            $FVino=new FVino();
            $vini=$FVino->getVini($username);
            $view->impostaDati('vini',$vini);
        }
        else {
            $view=USingleton::getInstance('VRicerca');
            $view->setLayout('errore');
        }
        return $view->processaTemplateParziale();
     }
    
/**
 * Mostra template di ricerca evento 
 * @return mixed
 */
    public function ricercaEvento() {
            $view=USingleton::getInstance('VRicerca');
            $view->setLayout('avanzata');
            $view->processaTemplateParziale();   
    }
    
/**
 * Ricerca dei eventi relativi ai campi riempiti
 */
    public function invioRicerca() {
            $view=USingleton::getInstance('VRicerca');
            $view->setLayout('elenco');
            $nome_evento=$view->getNomeEvento();
            $vino_evento=$view->getVinoEvento();
            $data_partenza=$view->getDataEvento();
            $eventi=NULL;
            if ($nome_evento OR $vino_evento OR $data_partenza) {
                $FEvento=new FEvento();
                $eventi=$FEvento->cercaEvento($citta_partenza,$citta_arrivo,$data_partenza);
            }
            $view->mostraListaEventi($eventi);
    }
    
/**
 * Mostra il template per rilasciare un feedback da oste a partecipante o da partecipante a oste per uno specifico evento
 * @param $num_evento int 
 * @return mixed
 */
     public function inserisciFeedback($num_evento){
            $session=USingleton::getInstance('USession');
            $username=$session->leggi_valore('username');
            if ($username!=false) {
                $FPartecipante= new FPartecipante();
                $array= $FPartecipante->loadPartecipante($num_evento, $username);
                //$array_partecipanti= $FPartecipante->loadPartecipanti($num_evento);
                $FOste= new FOste();
                $EOste= $FOste->getOste($num_evento);
                $FEvento= new FEvento();
                $EEvento= $FEvento->load($num_evento);
                if($username==$array['username_partecipante']){
                    $view=USingleton::getInstance('VRicerca');
                    $view->impostaDati('num_evento',$num_evento);
                    $view->impostaDati('username_oste',$EOste['username_oste']);
                    $view->impostaDati('citta_partenza',$EEvento->citta_partenza);
                    $view->impostaDati('citta_arrivo',$EEvento->citta_arrivo);
                    $view->impostaDati('data_partenza',$EEvento->data_partenza);
                    $view->setLayout('feedback_partecipante');
                    $view->processaTemplateParziale();
                }
                elseif($username==$EOste['username_oste']){
                    $view=USingleton::getInstance('VRicerca');
                    $view->impostaDati('username_partecipante',$view->getUsernamePartecipante());
                    $view->impostaDati('num_evento',$num_evento);
                    $view->impostaDati('citta_partenza',$EEvento->citta_partenza);
                    $view->impostaDati('citta_arrivo',$EEvento->citta_arrivo);
                    $view->impostaDati('data_partenza',$EEvento->data_partenza);
                    $view->setLayout('feedback_oste');
                    $view->processaTemplateParziale();
                }
            }
            else $this->errore_aggiornamento();
    }
    
/**
 * Rilascia un feedback per uno specifico evento da partecipante a oste
 * @param $num_evento int
 * @return mixed
 */
    public function verificaValutazione($num_evento){
            $session=USingleton::getInstance('USession');
            $username=$session->leggi_valore('username');
            $view=USingleton::getInstance('VRicerca');
            $voto=$view->getValutazione();
            $commento=$view->getCommento();
            $FOste= new FOste();
            $EOste= $FOste->load($num_evento);
            $num_voti= $EOste->num_voti;
            $voto_totale= $EOste->voto_totale;
            $commenti_presenti=$EOste->commento;
            $EOste->commento=$commenti_presenti."<b>".$username."</b>: ".$commento."<br>";
            $num_voti++;
            $voto_totale= $voto_totale+ $voto;
            $EOste->num_voti= $num_voti;
            $EOste->voto_totale= $voto_totale;
            $FOste->update($EOste);
            $FPartecipante= new FPartecipante();
            $array= $FPartecipante->oggettoPartecipante($num_evento, $username);
            $EPartecipante= new EPartecipante();
            $EPartecipante->commento_oste= $array[0]['commento_oste'];
            $EPartecipante->feedback_oste= $array[0]['feedback_oste'];
            $EPartecipante->num_evento= $array[0]['num_evento'];
            $EPartecipante->username_partecipante= $array[0]['username_partecipante'];
            $EPartecipante->votato= 1;
            $votato= $EPartecipante->votato;
            $FPartecipante->confermaVotazionePartecipante($num_evento, $username);
            $view->impostaDati('votato',$votato);
            $view->setLayout('conferma_valutazione');
            $view->processaTemplateParziale();
    }

/**
 * Rilascia un feedback per uno specifico evento da oste a partecipante
 * @param $num_evento int
 * @param $username_partecipante string
 * @return mixed
 */
    public function verificaValutazioneOste($num_evento,$username_partecipante){
            $session=USingleton::getInstance('USession');
            $username_oste=$session->leggi_valore('username');
            $view=USingleton::getInstance('VRicerca');
            $FPartecipante= new FPartecipante();
            //$array= $FPartecipante->oggettoPartecipante($num_evento, $username_partecipante);
            $feedback= $view->getValutazione();
            $commento= "<b>".$username_oste."</b>: ".$view->getCommento();
            $FPartecipante->votaPartecipante($num_evento,$username_partecipante,$feedback,$commento);
            $view->setLayout('conferma_valutazione');
            $view->processaTemplateParziale();        
    }
    
/**
 * Riepilogo dei dati relativi ad uno specifico vino
 * @param $nome_vino string
 * @return mixed
 */
    public function riepilogoVino($nome_vino){
            $session=USingleton::getInstance('USession');
            $username=$session->leggi_valore('username');
            if ($username!=false) {
                $FVino=new FVino();
                $EVino=$FVino->load($nome_vino);
                $view=Usingleton::getInstance('VRicerca');
                $view->impostaDati('nome_vino',$nome_vino);
                $view->impostaDati('tipo',$EVino->tipo);
                $view->impostaDati('num_posti',$EVino->num_posti);
                $view->impostaDati('carburante',$EVino->carburante);
                $view->impostaDati('consumo_medio',$EVino->consumo_medio);
                $view->setLayout('riepilogo_vino');
                $view->processaTemplateParziale();
            }
            else $this->errore_aggiornamento();
    }
    
/**
 * Elimina un evento
 * @param $num_evento int
 * @return mixed
 */
    public function eliminaEvento($num_evento){
            $session=USingleton::getInstance('USession');
            $username=$session->leggi_valore('username');
            if ($username!=false) {
                $FEvento=new FEvento();
                $FEvento->eliminaEvento($num_evento);
                $view=Usingleton::getInstance('VRicerca');
                $view->setLayout('evento_eliminato');
                $view->processaTemplateParziale();
            }
            else $this->errore_aggiornamento();
    }
    
/**
 * Elimina un vino
 * @param $nome_vino string
 * @return mixed
 */
    public function eliminaVino($nome_vino){
            $session=USingleton::getInstance('USession');
            $username=$session->leggi_valore('username');
            if ($username!=false) {
                $FVino=new FVino();
                $FVino->eliminaVino($nome_vino);
                $view=Usingleton::getInstance('VRicerca');
                $view->setLayout('vino_eliminato');
                $view->processaTemplateParziale();
            }
            else $this->errore_aggiornamento();
    }
    
 /**
 * Richiama template di errore in caso di problemi di logout e aggiornamento
 * @return mixed
 */
    public function errore_aggiornamento(){
        $view=USingleton::getInstance('VRegistrazione');
        $view->setControllerTaskDefault();
        $view->setLayout('errore_aggiornamento');
        return $view->processaTemplateParziale();
    }

/**
 * Mostra template di amministrazione degli utenti secondo uno specifico ordinamento
 * @param $ordinamento string
 * @return mixed
 */
    public function amministraUtenti($ordinamento){
        $session=USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        $amministratore=$session->leggi_valore('amministratore');
        if ($username!=false && $amministratore) {
            $FUtente=new FUtente();
            $utenti=$FUtente->getUtenti($ordinamento);
            $view=USingleton::getInstance('VRicerca');
            $view->mostraListaUtenti($utenti);
            $view->impostaDati('avanzata',false);
            $view->setLayout('amministra_utenti');
            return $view->processaTemplateParziale();
        }
        else $this->errore_aggiornamento();
    }
    
/**
 * Ricerca utenti secondo vari criteri
 * @param $username_ricerca string
 * @param $cognome string
 * @param $citta_residenza string
 * @return mixed
 */
    public function ricercaUtenti($username_ricerca,$cognome,$citta_residenza){
        $session=USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        $amministratore=$session->leggi_valore('amministratore');
        if ($username!=false && $amministratore) {
            $view=USingleton::getInstance('VRicerca');
            $FUtente=new FUtente();
            $utenti=$FUtente->ricercaUtenti($username_ricerca,$cognome,$citta_residenza);
            $view->mostraListaUtenti($utenti);
            $view->setLayout('amministra_utenti_lista');
            return $view->processaTemplateParziale();
        }
        else $this->errore_aggiornamento();
    }
    
/**
 * Mostra template di amministrazione dei eventi secondo uno specifico ordinamento
 * @param $ordinamento string
 * @return mixed
 */
    public function amministraEventi($ordinamento){
        $session=USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        $amministratore=$session->leggi_valore('amministratore');
            if ($username!=false && $amministratore) {
                $view=USingleton::getInstance('VRicerca');
                $FEvento=new FEvento();
                $eventi=$FEvento->getEventi($ordinamento);
                $view->mostraListaCompletaEventi($eventi);
                $view->setLayout('amministra_eventi');
                return $view->processaTemplateParziale();
        }
        else $this->errore_aggiornamento();
    }

/**
 * Ricerca eventi da amministrazione secondo vari criteri
 * @param $citta_partenza_ricerca string
 * @param $citta_arrivo_ricerca string
 * @param $data_partenza_ricerca string
 * @return mixed
 */
    public function ricercaEventi($citta_partenza_ricerca,$citta_arrivo_ricerca,$data_partenza_ricerca){
        $session=USingleton::getInstance('USession');
        $username=$session->leggi_valore('username');
        $amministratore=$session->leggi_valore('amministratore');
        if ($username!=false && $amministratore) {
            $view=USingleton::getInstance('VRicerca');
            $FEvento=new FEvento();
            $eventi=$FEvento->ricercaEventi($citta_partenza_ricerca, $citta_arrivo_ricerca, $data_partenza_ricerca);
            $view->mostraListaCompletaEventi($eventi);
            $view->setLayout('amministra_eventi_lista');
            return $view->processaTemplateParziale();
        }
        else $this->errore_aggiornamento();
    }
    
    /**
    * Funzione che verifica lato client se una nome_vino esiste gia o meno
    * @param string
    */
    public function verificaNomeVino($nome_vino) {
        $FVino=new FVino();
        $verifica=$FVino->verificaNomeVino($nome_vino);
        $esistente=true;
        if(isset($verifica['nome_vino'])){
            $esistente=false;
        }
        $controllo=array(
            'unique'=>$esistente
        );
        echo json_encode($controllo);
    }
    /**
     * Smista le richieste ai vari metodi
     *
     * @return mixed
     */
    public function smista() {
        $view=USingleton::getInstance('VRegistrazione');
        switch ($view->getTask()) {
            case 'inserimento':
                return $this->inserimentoEvento();
            case 'inserisci':
                return $this->inserisciEvento();
            case 'cerca':
                return $this->ricercaEvento();
            case 'invio_ricerca':
                return $this->invioRicerca();
            case 'riepilogo_evento':
                return $this->riepilogoEvento($view->getNumEvento());
            case 'aggiungi_vino':
                return $this->aggiungiVino();
            case 'inserimento_vino':
                return $this->inserimentoVino();
            case 'partecipa_evento':
                return $this->partecipaEvento($view->getNumEvento());
            case 'cancella_partecipante':
                return $this->cancellaPartecipante($view->getNumEvento(),$view->getUsernamePartecipante());
            case 'inserisci_feedback':
                return $this->inserisciFeedback($view->getNumEvento());
            case 'conferma_valutazione':
                return $this->verificaValutazione($view->getNumEvento());
            case 'verifica_valutazione_oste':
                return $this->verificaValutazioneOste($view->getNumEvento(), $view->getUsernamePartecipante());
            case 'elimina_evento':
                return $this->eliminaEvento($view->getNumevento());
            case 'riepilogo_vino':
                return $this->riepilogoVino($view->getNomeVino());
            case 'elimina_vino':
                return $this->eliminaVino($view->getNomeVino());
            case 'amministra_utenti':
                return $this->amministraUtenti($view->getOrdinamento());
            case 'amministra_eventi':
                return $this->amministraEventi($view->getOrdinamento());
            case 'ricerca_utenti':
                return $this->ricercaUtenti($view->getUsernameRicerca(),$view->getCognomeRicerca(),$view->getCittaRicerca());
            case 'ricerca_eventi':
                return $this->ricercaEventi($view->getDataEventoRicerca(),$view->getVinoEventoRicerca(),$view->getDataEventoRicerca());
            case 'verifica_nome_vino':
                return $this->verificaNomeVino($view->getNomeVino());
        }
    }
}
?>