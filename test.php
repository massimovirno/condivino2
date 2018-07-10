<?php
/*
 * Effettuo il redirect a main/index.php
 */
// require_once 'includes/autoload.inc.php';

if (file_exists("installer.class.php"))
    header("location: installer.class.php");

// Se non è presente l'installer instanziamo un oggetto della classe CHome
// $CHome=USingleton::getInstance('CHome');
// $CHome->impostaPagina();

include_once 'Foundation/FOste.php';

$oste = new FOste;
$username_oste=$oste->getOste(1);
var_dump($username_oste);

$username_oste=$oste->verificaOste(4,'massimovirno');
var_dump($username_oste);

$username_oste=$oste->eliminaOste(4,'massimovirno');
var_dump($username_oste);
?>