<?php
class FUtente extends FDatabase{
    public function __construct() {
        $this->_table='utente';
        $this->_key='username';
        $this->_return_class='EUtente';
        USingleton::getInstance('FDatabase');
    }

/**
 * Metodo per verificare se un utente è amministratore
 * @param string $username
 * @return array
 */
public function isAmministratore($username){
    $query="SELECT `amministratore` FROM `utente` WHERE `username`='$username'";
    $this->query($query);
    $admin=$this->getResult();
    return $admin['amministratore'];
}

/**
 * Metodo per la ricerca degli utenti
 * @param string $username
 * @param string $cognome
 * @param string $citta_residenza
 * @return array $utenti
 */
public function ricercaUtenti($username,$cognome,$citta_residenza){
	$cognome1=mysql_real_escape_string($cognome);
	$citta_residenza1=mysql_real_escape_string($citta_residenza);
    $query="SELECT * FROM `utente` WHERE";
    if ($username OR $cognome OR $citta_residenza)
    {
        if ($username)
            $query.=" `username`='$username'";
        if ($cognome) {
            if ($username)
                $query.=" AND";
            $query.=" `cognome`='$cognome1'";
        }
        if ($citta_residenza) {
            if ($username OR $cognome)
                $query.=" AND";
            $query.=" `citta_residenza`='$citta_residenza1'";
        }
    }
    $this->query($query);
    $utenti=$this->getResultAssoc();
    return $utenti;
}

/**
 * Metodo per ottenere una lista degli utenti dato un ordinamento
 * @param string $ordinamento
 */
public function getUtenti($ordinamento){
    $query="SELECT * FROM `utente` ORDER BY `$ordinamento` ASC";
    $this->query($query);
    $utenti=$this->getResultAssoc();
    return $utenti;
}

/**
 * Metodo per rendere amministratore un utente
 * @param string $username
 */
public function rendi_amministratore($username){
    $query="UPDATE `utente` SET `amministratore`=1 WHERE `username`='$username'";
    return $this->query($query);
}

/**
 * Metodo per rendere l'amministratore un semplice utente
 * @param string $username
 */
public function rendi_utente($username){
    $query="UPDATE `utente` SET `amministratore`=0 WHERE `username`='$username'";
    return $this->query($query);
}

/**
 * Metodo per attivare l'account di un utente
 * @param string $username
 */
public function attiva_account($username){
    $query="UPDATE `utente` SET `stato_attivazione`=1 WHERE `username`='$username'";
    return $this->query($query);
}

/**
 * Metodo per disattivare l'account di un utente
 * @param string $username
 */
public function disattiva_account($username){
    $query="UPDATE `utente` SET `stato_attivazione`=0 , `amministratore`=0 WHERE `username`='$username'";
    return $this->query($query);
}

/**
 * Metodo per verificare lo stato di un utente
 * @param string $username
 * @return array $utente
 */
public function verifica_tipo_utente($username){
    $query="SELECT `amministratore`,`stato_attivazione` FROM `utente` WHERE `username`='$username'";
    $this->query($query);
    $utente=$this->getResult();
    return $utente;
}

/**
 * Metodo per aggiornare l'immagine del profilo di un utente
 * @param string $username
 * @param string $file_nome
 */
public function aggiornaImmagine($username,$file_nome){
    $query="UPDATE `utente` SET `immagine_profilo`='img/$file_nome' WHERE `username`='$username'";
    return $this->query($query);
}

/**
 * Metodo per verificare se un username è già utilizzato o meno
 * @param string $username
 * @return array $trovato
 */
public function verificaUsername($username){
    $query="SELECT `username` FROM `utente` WHERE `username`='$username'";
    $this->query($query);
    $trovato=$this->getResult();
    return $trovato;
}

/**
 * Metodo per verificare se un'email è già utilizzata o meno
 * @param string $email
 * @return array $trovato
 */
public function verificaEmail($email){
    $query="SELECT `username`,`email` FROM `utente` WHERE `email`='$email'";
    $this->query($query);
    $trovato=$this->getResult();
    return $trovato;
}

/**
 * Metodo per verificare se un codice fiscale è già presente
 * @param string $cod_fiscale
 * @return array $trovato
 */
public function verificaCodFiscale($cod_fiscale){
    $query="SELECT `cod_fiscale` FROM `utente` WHERE `cod_fiscale`='$cod_fiscale'";
    $this->query($query);
    $trovato=$this->getResult();
    return $trovato;
}
/**
 * Metodo per settare la password
 * @param string $username
 * @param string $password
 */
public function impostaPassword($username,$password){
    $query="UPDATE `utente` SET `password`='$password' WHERE `username`='$username'";
    return $this->query($query);
}

}
?>

