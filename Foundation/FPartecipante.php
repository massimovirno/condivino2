<?php
class FPartecipante extends FDatabase{
    public $_double_key=array();
    
    public function __construct() {
        $this->_table='partecipante';
        $this->_double_key[]=array('key1'=>'username', 'key2'=>'num_evento');
        $this->_return_class='EPartecipante';
        USingleton::getInstance('FDatabase');
    }
    
    /**
      * Metodo che verifica se un utente è il partecipante in un determinato evento
      * @param int $num_evento 
      * @param string $username
      * @return mixed
      */
    public function verificaPartecipante($num_evento, $username){
        $query="SELECT `username_partecipante` FROM `partecipante` WHERE `num_evento`='$num_evento' AND `username_partecipante`='$username'";
        $this->query($query);
        $array=$this->getResult();
        if(isset($array['username_partecipante'])){
            $partecipante_presente= true;}
        else{
            $partecipante_presente= false;}
        return $partecipante_presente;
    }
    
    /**
      * Metodo che carica un'istanza del partecipante che partecipa a un determinato evento
      * @param int $num_evento 
      * @param string $username
      * @return array 
      */
    public function oggettoPartecipante($num_evento,$username){
        $query="SELECT * FROM `partecipante` WHERE `num_evento`='$num_evento' AND `username_partecipante`='$username'";
        $this->query($query);
        $array_partecipanti=$this->getResultAssoc();
        return $array_partecipanti;
    }
    
    /**
      * Metodo che carica l'username del partecipante che partecipa a un determinato evento
      * @param int $num_evento 
      * @param string $username
      * @return array 
      */
    public function loadPartecipante($num_evento,$username){
        $query="SELECT `username_partecipante` FROM `partecipante` WHERE `num_evento`='$num_evento' AND `username_partecipante`='$username'";
        $this->query($query);
        $array=$this->getResult();
        return $array;
    }
    
    
    public function votoPartecipante($num_evento,$username){
        $query="SELECT `feedback_oste` FROM `partecipante` WHERE `num_evento`='$num_evento' AND `username_partecipante`='$username'";
        $this->query($query);
        $array=$this->getResult();
        return $array;
    }
    
    /**
      * Metodo che carica i partecipanti che partecipano a un determinato evento
      * @param int $num_evento 
      * @return array 
      */
    public function loadPartecipante($num_evento){
        $query="SELECT * FROM `partecipante` WHERE `num_evento`='$num_evento'";
        $this->query($query);
        $array_partecipanti=$this->getResultAssoc();
        return $array_partecipanti;
    }
    
    /**
      * Metodo che conferma la votazione effettuata da un partecipante nei confronti di un guidatore per un determinato evento
      * @param int $num_evento 
      * @param string $username
      */
    public function confermaVotazionePartecipante($num_evento, $username){
        $query="UPDATE `partecipante` SET `votato` = 1 WHERE `num_evento`='$num_evento' AND `username_partecipante`='$username'";
        return $this->query($query);
    }
    
    /**
      * Metodo che aggiorna il feedback e i commenti rilasciati dal guidatore al partecipante
      * @param int $num_evento 
      * @param string $username
      * @param string $feedback
      * @param string $commento
      */
    public function votaPartecipante($num_evento, $username, $feedback, $commento){
		$commento1=mysql_real_escape_string($commento);
        $query="UPDATE `partecipante` SET `feedback_oste`='$feedback', `commento_oste`='$commento1' WHERE `num_evento`='$num_evento' AND `username_partecipante`='$username'";
        return $this->query($query);
    }
    
    /**
      * Metodo che verifica se un partecipante ha gia votato il guidatore di un determinato evento
      * @param int $num_evento 
      * @param string $username
      * @return boolean
      */
    public function eventoVotato($num_evento,$username){
        $query="SELECT * FROM `partecipante` WHERE `num_evento`='$num_evento' AND `username_partecipante`='$username'";
        $this->query($query);
        $array=$this->getResult();
        $votato= $array['votato'];
        if(!isset($votato)){
            $votato=0;
        }
        return $votato;
    }
    
    /**
      * Metodo per eliminare un partecipante di un evento
      * @param int $num_evento 
      * @param string $username
      */
    public function cancellaPartecipante($num_evento, $username){
        $query= "DELETE FROM `partecipante` WHERE `num_evento`='$num_evento' AND `username_partecipante`='$username'";
        return $this->query($query);
    }
    
    /**
      * Metodo per eliminare tutti i partecipanti di un evento
      * @param int $num_evento 
      * @param array $array_partecipanti
      */
    public function eliminaTuttiPartecipanti($num_evento,$array_partecipanti){
        for( $i=0; $i<count($array_partecipanti); $i++){
            $query= "DELETE FROM `partecipante` WHERE `num_evento`='$num_evento' AND `username_partecipante`='$array_partecipanti[$i]['username']'";
        }
        return $this->query($query);
    }    
}
?>
