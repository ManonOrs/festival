<?php
?>

<form action="?uc=envoiMail&action=verifMail" method="POST">
<select name="groupe">
    <?php
    foreach ($lesGroupes as $unGroupe) {
        $idGroupe = $unGroupe['id'];
        $nomGroupe = $unGroupe['nom'];
        
        if ($idGroupe === $leGroupeSelectionne) {
            ?>
            <option value="<?= $idGroupe?>" selected><?= $nomGroupe?></option>
            <?php
        } else{
            ?>
            <option value="<?= $idGroupe?>"><?= $nomGroupe?></option>
            <?php
        }
    }
    ?>
</select>
<input type="submit" value="Choisir ce groupe">
</form>