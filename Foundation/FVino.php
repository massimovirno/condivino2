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
/**
   * Metodo che restituisce la nome_vino e il tipo di un vino appartenente a un determinato utente
   * @param string $username
   * @return array 
   */ 
 public function getVini($username){
     $query="SELECT `nome_vino`,`denominazione` FROM `vino` WHERE `attuale`=1";
     $this->query($query);
     $array=$this->getResultAssoc();
     return $array;
 }
 
 /**
   * Metodo che restituisce il numero di posti di un determinato vino
   * @param string $nome_vino_presa
   * @return array 
   */ 
 public function getPostiVino($nome_vino_presa){
     $query="SELECT `num_posti` FROM `vino` WHERE `nome_vino` = '$nome_vino_presa'";
     $this->query($query);
     $posti=$this->getResult();
     return $posti;
 }
 
 /**
   * Metodo per eliminare un vino
   * @param string $nome_vino
   */
 public function eliminaVino($nome_vino){
     $query="UPDATE `vino` SET `attuale`=0 WHERE `nome_vino`='$nome_vino'";
     return $this->query($query);
 }
 
 /**
 * Metodo per verificare se una nome_vino è già utilizzata o meno
 * @param string $email
 * @return array $trovato
 */
public function verificaTarga($nome_vino){
    $query="SELECT `nome_vino` FROM `vino` WHERE `nome_vino`='$nome_vino'";
    $this->query($query);
    $trovato=$this->getResult();
    return $trovato;
}
}

?>
