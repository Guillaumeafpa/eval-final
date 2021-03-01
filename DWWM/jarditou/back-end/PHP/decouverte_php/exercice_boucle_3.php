<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>exercice 3</title>
</head>
<body>
    <!-- faire deux boucle 'for' ligne et colonne en html (tr et td) -->
    <style>
    .table, tr, td
    { 
    	border: 1px solid;
    }
    </style>

    <table class="table">
    <tbody>
    <?php
    $a = $b = 0;
    $c;
    for ($ligne = 0; $ligne < 14; $ligne++)
    {
        echo"<tr>"; //j'ouvre mes balise tr (ligne)
        for ( $colone= 0; $colone < 14; $colone++) //dans chaque ligne je créer 14 colonnes
        {
            $c = $a * $b; //je fait les multiplictions
            if ($ligne == 0) //ce if correspond a la premiére ligne du tableau 
            {
                if ( $colone != 0)
                {
                    echo "<td><strong>$b</strong></td>"; //j'affiche tout la premiére ligne en gras et j'incrémente b
                    $b++;
                }
                else
                {
                    echo "<td></td>"; //je créer un case vide dans la premiére ligne
                }
            }
            else 
            {
                if ( $colone == 0)
                {
                    echo"<td><strong>$a</strong></td>";//le if permet d'afficher le "a" en gras (dans la premiére colonne de toutes les lignes) 
                }
                else //le else affiche tout les résultats des multiplications
                {
                    echo"<td>$c</td>";
                    $b++; //puis j'incrémente b a la fin de la boucle 
                }
            }
        }
        echo "</tr>";//je ferme mes balises tr (ligne) a chaque fin de boucle
        $b = 0; //je réinitiale b a chaque ligne
        if ($ligne != 0)
        {
            $a++;// je réinitialise "a" a chaque ligne 
        }
    }
    
    ?>
    </tbody>
    </table>
</body>
</html>