<?php
class FEvento    extends FDatabase{
    public function __construct() {
        $this->_table='evento';
        $this->_key='num_evento';
        $this->_auto_increment=true;
        $this->_return_class='EEvento';
        USingleton::getInstance('FDatabase');
    }
    
    /**
     * Metodo per ottenere il numero dell'ultimo evento
     * @return array 
     */
    public function getUltimoNumEvento(){
        $query="SELECT `num_evento` FROM `evento` WHERE `num_evento`=(SELECT max(`num_evento`) FROM `evento`) ORDER BY `num_evento`";
        $this->query($query);
        $array=$this->getResultAssoc();
        return $array[0]['num_evento'];
    }
    
    /**
     * Metodo per effettuare la ricerca di un evento
     * @param string $$nome_evento
     * @param string $vino_evento
     * @param date $data_evento
     * @return array 
     */
    public function cercaEvento($nome_evento,$vino_evento,$data_evento){
		$nome_evento1=mysql_real_escape_string($nome_evento);
		$vino_evento1=mysql_real_escape_string($vino_evento);
        
        $query="SELECT * FROM `evento` WHERE";
        if ($nome_evento OR $data_evento)
            {
            if ($nome_evento)
            $query.=" `nome_evento`='$nome_evento1'";
            if ($data_evento) {
                if ($nome_evento)
                    $query.=" AND";
            $query.=" `data_evento`>CURRENT_DATE()"; // Per estrarre solo eventi con data successiva ad oggi
            }     
        }
        // MAX
        /*
        $query="SELECT * FROM `evento` WHERE";
        if ($nome_evento)
            $query.=" `nome_evento`='$nome_evento1'";
        if ($vino_evento) {
            if ($nome_evento)
                $query.=" AND";
            $query.=" `vino_evento`='$vino_evento1'";
        }
        if ($data_evento) {
            if ($nome_evento OR $vino_evento)
                $query.=" AND";
            $query.=" `nome_evento`='$nome_evento'";
        }
        $query.=" AND `data_evento`>CURRENT_DATE()"; // Per estrarre solo eventi con data successiva ad oggi
        // MAX
        // print($query);
         */
        
        $this->query($query);
        $array=$this->getResultAssoc();
        return $array;
    }
    
    /**
     * Metodo per ottenere la lista degli ultimi eventi a partire dalla data corrente
     * @return array 
     */
    public function ultimiEventi(){
        $query="SELECT `num_evento`,`nome_evento`,`data_evento`,`vino_evento`,`costo`,`posti_disponibili` FROM `evento` WHERE `data_evento`>=CURRENT_DATE() ORDER BY `num_evento` DESC";
        $this->query($query);
        $array=$this->getResultAssoc();
        return $array;
    }
    
    /**
     * Metodo per ottenere la lista dei eventi organizzati dall'utente come oste
     * @param string $username
     * @return array 
     */
    public function EventiPersonali($username){
        $query="SELECT * FROM evento, oste WHERE username_oste = '$username' AND evento.num_evento = oste.num_evento";
        $this->query($query);
        $array_eventi=$this->getResultAssoc();
        return $array_eventi;
    }
    
    /**
     * Metodo per ottenere la lista dei eventi a cui l'utente ha partecipato come partecipante
     * @param string $username
     * @return array 
     */
    public function EventiPartecipante($username){
        $query="SELECT * FROM evento, partecipante WHERE username_partecipante = '$username' AND evento.num_evento = partecipante.num_evento";
        $this->query($query);
        $array_partecipante=$this->getResultAssoc();
        return $array_partecipante;
    }
    
    /**
     * Metodo per eliminare un evento
     * @param int $num_evento
     */
    public function eliminaEvento($num_evento){
        $query= "DELETE FROM `evento` WHERE `num_evento`='$num_evento'";
        return $this->query($query);
    }
    
    
    //AMMINISTRATORE
    
    /**
     * Metodo per ottenere la lista dei eventi
     * @param string $ordinamento
     * @return array 
     */
    public function getEventi($ordinamento){
        $query="SELECT * FROM `evento` ORDER BY `$ordinamento` ASC";
        $this->query($query);
        $eventi=$this->getResultAssoc();
        return $eventi;
    }
    
    /**
     * Metodo per effettuare la ricerca di un evento
     * @param string $nome_evento
     * @param string $vino_evento
     * @param date $data_evento
     * @return array 
     */
    public function ricercaEventi($nome_evento, $vino_evento, $data_evento){
	$nome_evento1=mysql_real_escape_string($nome_evento);
	$vino_evento1=mysql_real_escape_string($vino_evento);

    $query="SELECT * FROM `evento` WHERE";
    if ($nome_evento OR $data_evento)
    {
        if ($nome_evento)
            $query.=" `nome_evento`='$nome_evento1'";
        if ($data_evento) {
            if ($nome_evento)
                $query.=" AND";
            $query.=" `data_evento`='$data_evento'";
        }
    }
    $this->query($query);
    $eventi=$this->getResultAssoc();
    return $eventi;
}
}

?>
