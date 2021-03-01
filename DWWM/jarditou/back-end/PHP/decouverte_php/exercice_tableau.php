<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        $a = array("19001" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "", "", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", "Validation"), 
        "19002" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", ""), 
        "19003" => array("", "", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "", "", "Validation") 
       );

       //
       //exercice 1
       //

        foreach($a["19002"] as $b => $c)
        {
            if ($c == "Validation")
            {
                echo "la validation du groupe '19002' a lieu en semaine : ". ($b + 1);
                echo "<br><hr>";
                break;
            }
        }

        //
        // exercice 2
        //
        
        $d = array_reverse($a ["19001"],true); //cette fonction inverse toutes les données d'un tableau tout en gardant les index d'origine
        // la fonction arsort peut également fonctionner por inverser l'ordre et rpréserver l'index
        foreach($d as $b => $c)
        {
        if ($c == "Stage")
            {
                echo "la dernière semaine de stage du groupe '19001' a lieu en semaine : ". ($b + 1);
                echo "<br><hr>";
                break;
            }
        }

        //
        // exercice 3
        //
      
        for ($f =0; $f < 3; $f++)
        {
            $firstKey = array_key_first($a);
            if ($f<1)
            {
                echo "les codes des groupes sont : ". $firstKey;
                echo "<br>";
            }
            else
            {
                echo "les codes des groupes sont : ". ($firstKey + $f);
                echo "<br>";
            }
        }
        
        //
        // exercice 4
        //
            echo "<hr>";
            $g = 0;
        foreach($a["19003"] as $b => $c)
        {
            if ($c == "Stage")
            {
              $g++; 
            }
        }    
        echo "le stage du groupe '19003' dure : ".$g ." semaines";
    ?>
</body>
</html>