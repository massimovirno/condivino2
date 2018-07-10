<?php
class FVino extends FDatabase{
    public function __construct() {
        $this->_table='vino';
        $this->_key='nome_vino';
        $this->_return_class='EVino';
        USingleton::getInstance('FDatabase');
    }
 
 /**
   * Metodo che restituisce le caratteristiche di un Vino associato a un determinato evento
   * @param int $num_evento
   * @return array 
   */
 public function getVino($num_evento){
     $query="SELECT * FROM `vino` WHERE `num_evento`='$num_evento'";
     $this->query($query);
     $array=$this->getResultAssoc();
     return $array;
 }

}

?>
