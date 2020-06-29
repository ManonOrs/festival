<?php
$action = filter_input (INPUT_GET, 'action', FILTER_SANITIZE_STRING);
if (empty($action)) {
    $action = 'initial';
}

//Aiguillage selon l'etape
switch ($action){
    case 'initial':
}
include 'vues/GestionGroupe/v_GestionGroupeForm';