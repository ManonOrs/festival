<?php
//$lesGroupes = $pdo->obtenirReqIdNomGroupesAHeberger();
//include 'vues/EnvoiMail/v_obtenirGroupes.php';

//1ere étape (donc pas d'action choisie) : affichage du tableau des attribution
//en lecture seule
$action = filter_input (INPUT_GET, 'action', FILTER_SANITIZE_STRING);
if (empty($action)) {
    $action = 'initial';
}

//Aiguillage selon l'etape
switch ($action){
    case 'initial':
        $lesGroupes = $pdo->obtenirReqIdNomGroupesAHeberger();
        $leGroupeSelectionne = filter_input(INPUT_POST,'groupe', FILTER_SANITIZE_STRING);
        include 'vues/EnvoiMail/v_obtenirGroupes.php';
        break;
    case 'verifMail':
        $lesGroupes = $pdo->obtenirReqIdNomGroupesAHeberger();
        $leGroupeSelectionne = filter_input(INPUT_POST,'groupe', FILTER_SANITIZE_STRING);
        include 'vues/EnvoiMail/v_obtenirGroupes.php';
        $nomGroupe = $pdo->obtenirNomGroupe($leGroupeSelectionne);
        $mailGroupe = $pdo->obtenirMailGroupe($leGroupeSelectionne);
        include 'vue/EnvoiMail/v_ObtenirMail.php';
    case 'envoiMail':
    $from = "stMalo@gmail.com";
    $to = $mailGroupe;
    $subject = "Demande de logement Festival de Saint-Malo";
    $message = '
<p>Mairie de</p>
<p>Saint-Malo, le <?php echo date("d/m/Y");?></p>
<img src"http://image.noelshack.com/fichiers/2020/27/1/1593426602-logo-saintmalo.jpg">
<p>Direction du Développement Culturel </br>
Maison Des Associations </br>
tél : 02.99.40.42 50 </br>
fax : 02.99.56.39.45</p>
<p><?php echo $IdentiteResponsable;?> </br>
<php echo $nomGroupe ;?> </br>
<php echo $AdressePostal;?> </br>
"S/C de Madame Giraud-Petit,
Directrice du Développement Culturel"
</p>

<p>Objet : hébergement des groupes participant au festival Folklores du Monde.</p>
<p>Nos Réf. :JC/RR</p>

<p><?php echo $IdentiteResponsable;?>,</p>

<p>Dans le cadre du festival Folklores du Monde votre demande de logement a été accepté. </p>
<p>Votre etablissement est</p>


<p>Le Responsable
de la Maison des Associations,</p>
<img src"http://image.noelshack.com/fichiers/2020/27/1/1593426602-signature-523237-640.jpg">';
    $headers = "From:" . $from;
    mail($to,$subject,$message, $headers);
 
    echo "L'email a été envoyé.";
}