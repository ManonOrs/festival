<?php
?>

<h1>Vous avez selectionneé le groupe : <?= $nomGroupe ?></h1>
<h2> Mail qui va etre utilisé:
    <?php
    if (empty($mailGroupe)){
        echo 'aucun mail defini !';
    } else  {
        echo $mailGroupe;
    }
    
    ?>
</h2>
