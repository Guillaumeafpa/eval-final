
<?php
function calculator($a, $b)
{
    $addition = $a + $b;
    $calcul = $a." + ".$b." = ";
    echo $calcul.$addition;

    echo "<br>";

    $soustraction = $a - $b;
    $calcul = $a." - ".$b." = ";
    echo $calcul.$soustraction;

    echo "<br>";

    $multiplication = $a * $b;
    $calcul = $a." x ".$b." = ";
    echo $calcul.$multiplication;

    echo "<br>";
    
    $division = $a / $b;
    $calcul = $a." / ".$b." = ";
    echo $calcul.$division;
}

calculator(15, 26);
?>