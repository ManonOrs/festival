<?php
//$lesGroupes = $pdo->obtenirReqIdNomGroupesAHeberger();
//include 'vues/EnvoiMail/v_obtenirGroupes.php';

//1ere étape (donc pas d'action choisie) : affichage du tableau des attribution
//en lecture seule
$action = fichier_input (INPUT_GET, 'action', FILTER_SANITIZE_STRING);
if (empty($action)) {
    $action = 'initial';
}

//Aiguillage selon l'etape
switch ($action){
    case 'initial':
        $lesGroupes = $pdo->obtenirReqIdNomGroupesAHeberger();
        $lesGroupeSelectionne = filter_input(INPUT_POST,'groupe', FILTER_SANITIZE_STRING);
        include 'vues/EnvoiMail/v_obtenirGroupes.php';
        break;
    case 'verifMail':
        $lesGroupes = $pdo->obtenirReqIdNomGroupesAHeberger();
        $lesGroupeSelectionne = filter_input(INPUT_POST,'groupe', FILTER_SANITIZE_STRING);
        include 'vues/EnvoiMail/v_obtenirGroupes.php';
        $nomGroupe = $pdo->obtenirNomGroupe($leGroupeSelectionne);
        $mailGroupe = $pdo->obtenirMailGroupe($leGroupeSelectionne);
        include 'vue/EnvoiMail/v_ObtenirMail.php';
}