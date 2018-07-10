<?php

include_once 'Foundation/FDatabase.php';
include_once 'Utility/USingleton.php';
require_once 'includes/config.inc.php';

class FOste extends FDatabase{
    public function __construct() {
        $this->_table='oste';
        $this->_key='num_evento';
        $this->_return_class='EOste';
        USingleton::getInstance('FDatabase');
    }
    
 /**
   * Metodo che che restituisce l'username dell'oste che partecipa ad un evento   
   * @param int $num_evento 
   * @return array 
   */   
 public function getOste($num_evento){
     $query="SELECT `username_oste` FROM `oste` WHERE `num_evento`='$num_evento'";
     $this->query($query);
	 $username_oste=$this->getResult();
     return $username_oste;
 }
 
 /**
   * Metodo che che verifica se un utente è l'oste di un determinato evento  
   * @param int $num_evento
   * @param string $username 
   * @return array 
   */
 public function verificaOste($num_evento,$username){
     $query="SELECT `username_oste` FROM `oste` WHERE `num_evento`='$num_evento' AND `username_oste`='$username'";
     $this->query($query);
     $array=$this->getResult();
     if(isset($array['username_oste'])){
        $oste_presente=true;}
     else{
        $oste_presente=false;}
     return $oste_presente;
 }
 
 /**
   * Metodo che elimina il oste di un determinato evento 
   * @param int $num_evento
   */
 public function eliminaOste($num_evento){
    $query= "DELETE FROM `oste` WHERE `num_evento`='$num_evento'";
    return $this->query($query);
 }
}

?>
