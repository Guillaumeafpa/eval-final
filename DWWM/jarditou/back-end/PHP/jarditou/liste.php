<?php
    require "connexion_bdd.php"; // Inclusion de notre bibliothèque de fonctions
    $db = connexionBase(); // Appel de la fonction de connexion
    $requete = "SELECT pro_id, pro_ref, pro_libelle FROM produits WHERE ISNULL(pro_bloque) ORDER BY pro_d_ajout DESC";

    $result = $db->query($requete);

    if (!$result) 
    {
        $tableauErreurs = $db->errorInfo();
        echo $tableauErreur[2]; 
        die("Erreur dans la requête");
    }

    if ($result->rowCount() == 0) 
    {
       // Pas d'enregistrement
       die("La table est vide");
    }

    echo "<table>";
    echo '<table class="table table-bordered">';
    echo '<tbody>';
    echo '<thead class="thead-light">';
    echo '<tr class="table-active">';
    echo '<th><strong>Photo</strong></th>';
    echo '<th><strong>ID</strong></th>';
    echo '<th><strong>Catégorie</strong></th>';
    echo '<th><strong>Libellé</strong></th>';
    echo '<th><strong>Prix</strong></th>';
    echo '<th><strong>Couleur</strong></th>';
    echo '</tr>';
    echo '</thead>';

    while ($row = $result->fetch(PDO::FETCH_OBJ))
    {
        echo"<tr>";
        echo"<td>".$row->pro_id."</td>";
        echo"<td>".$row->pro_ref."</td>";
        echo'<td><a href="detail.php?id='.$row->pro_id.'" title='.$row->pro_libelle.'>'.$row->pro_libelle.'</a></td>';
        echo"</tr>";
    }

    echo "</table>"; 
?>