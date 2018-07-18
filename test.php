<?php
/*
 * Effettuo il redirect a main/index.php
 */
// require_once 'includes/autoload.inc.php';

if (file_exists("installer.class.php"))
    header("location: installer.class.php");

// Se non � presente l'installer instanziamo un oggetto della classe CHome
// $CHome=USingleton::getInstance('CHome');
// $CHome->impostaPagina();
include_once 'includes/config.inc.php';
include_once 'Utility/USingleton.php';

include_once 'Foundation/FDatabase.php';
include_once 'Foundation/FUtente.php';
include_once 'Foundation/FOste.php';
include_once 'Foundation/FPartecipante.php';
include_once 'Foundation/FEvento.php';
include_once 'Foundation/FVino.php';

/*
$oste = new FOste;
$username_oste=$oste->getOste(1);
var_dump($username_oste);

$username_oste=$oste->verificaOste(4,'massimovirno');
var_dump($username_oste);

$username_oste=$oste->eliminaOste(4,'massimovirno');
var_dump($username_oste);

$evento = new FEvento;
$test=$evento->getEventi('nome_evento');
var_dump($test);

*/

$vino = new FVino();
$test=$vino->getVino('');
var_dump($test);

?>