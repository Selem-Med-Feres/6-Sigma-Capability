<?php
include(__DIR__ . '/calc-tables.php');

/**
 * 
 * Interprétation des indicteurs de capabilité
 *
 * @param array $capabilityArray tableau contenant les noms des indicateurs de capabilités (Cp, Cpk, Cpm, Pp, Ppk et Ppm) comme clés 
 * (id) et les valeurs (value) (Exp : $capabilityArray['id'] => value).
 *
 * @return string Les interprétations des indicateurs de capabilité. 
 */

function conclude_indicators(array $capabilityArray)
{
    $conclusion = '';
    $CT = false;
    $LT = false;

    foreach ($capabilityArray as $indicator) {
        if ($indicator['id'] == 'Cp') {
            $Cp = $indicator['value'];
            $CT = true;
        }
        if ($indicator['id'] == 'Cpk') {
            $Cpk = $indicator['value'];
        }
        if ($indicator['id'] == 'Cpm') {
            $Cpm = $indicator['value'];
        }

        if ($indicator['id'] == 'Pp') {
            $Pp = $indicator['value'];
            $LT = true;
        }
        if ($indicator['id'] == 'Ppk') {
            $Ppk = $indicator['value'];
        }
        if ($indicator['id'] == 'Ppm') {
            $Ppm = $indicator['value'];
        }
        if ($indicator['id'] == 'Rs') {
            $Rs = $indicator['value'];
        }
        if ($indicator['id'] == 'Rr') {
            $Rr = $indicator['value'];
        }
        if ($indicator['id'] == 'Z') {
            $Z = $indicator['value'];
        }
    }


    if ($CT) {
        $CapabiliteReelleCT = true;
        $CentrageCT = true;

        $conclusion .= '<span style="text-decoration: underline;">• Capabilité du procédé (CT) :</span><br>';

        //capabilité intrinsèque 
        if ($Cp >= 1.67) {
            $conclusion .= '&emsp; &#8594; La capabilité intrinsèque du processus est très satisfaisante. <br>';
        }
        if (($Cp >= 1.33) && ($Cp < 1.67)) {
            $conclusion .= '&emsp; &#8594; La capabilité intrinsèque du processus est satisfaisante. <br>';
        }
        if (($Cp >= 1.0) && ($Cp < 1.33)) {
            $conclusion .= '&emsp; &#8594; La capabilité intrinsèque du processus est trop juste. <br>';
        }
        if (($Cp >= 0.67) && ($Cp < 1.0)) {
            $conclusion .= '&emsp; &#8594; La capabilité intrinsèque du processus n\'est pas satisfaisante. <br>';
        }
        if (($Cp < 0.67)) {
            $conclusion .= '&emsp; &#8594; La capabilité intrinsèque du processus n\'est pas du tout satisfaisante. <br>';
        }

        // capabilité réeele 
        if ((($Cpk >= 1.67) || ($Cpm >= 1.67)) && $CapabiliteReelleCT) {
            $conclusion .= '&emsp; &#8594; La capabilité réelle du processus est très satisfaisante. <br>';
            $CapabiliteReelleCT = false;
        }
        if (((($Cpk >= 1.33) && ($Cpk < 1.67)) || (($Cpm >= 1.33) && ($Cpm < 1.67))) && $CapabiliteReelleCT) {
            $conclusion .= '&emsp; &#8594; La capabilité réellé du processus est satisfaisante. <br>';
            $CapabiliteReelleCT = false;
        }
        if (((($Cpk >= 1.0) && ($Cpk < 1.33)) || (($Cpm >= 1.0) && ($Cpm < 1.33))) && $CapabiliteReelleCT) {
            $conclusion .= '&emsp; &#8594; La capabilité réellé du processus est trop juste. <br>';
            $CapabiliteReelleCT = false;
        }
        if (((($Cpk >= 0.67) && ($Cpk < 1.0)) || (($Cpm >= 0.67) && ($Cpm < 1.0))) && $CapabiliteReelleCT) {
            $conclusion .= '&emsp; &#8594; La capabilité réellé du processus n\'est pas satisfaisante. <br>';
            $CapabiliteReelleCT = false;
        }
        if ((($Cpk < 0.67) || ($Cpm < 0.67)) && $CapabiliteReelleCT) {
            $conclusion .= '&emsp; &#8594; La capabilité réellé du processus n\'est pas du tout satisfaisante. <br>';
            $CapabiliteReelleCT = false;
        }
    }


    if ($LT) {
        $HS = OUT_OF_RANGE;
        $PpHS = ((round($Pp, 2, PHP_ROUND_HALF_UP) == 1.33) || (round($Pp, 2, PHP_ROUND_HALF_UP) == 1.67)) ? (round($Pp, 2, PHP_ROUND_HALF_UP)) : (round($Pp, 1, PHP_ROUND_HALF_UP));
        $PpkHS = ((round($Ppk, 2, PHP_ROUND_HALF_UP) == 1.33) || (round($Ppk, 2, PHP_ROUND_HALF_UP) == 1.67)) ? (round($Ppk, 2, PHP_ROUND_HALF_UP)) : (round($Ppk, 1, PHP_ROUND_HALF_UP));

        $CapabiliteReelleLT = true;
        $CentrageLT = true;

        $conclusion .= '<span style="text-decoration: underline;">• Performance du procédé (LT) :</span><br>';

        //performance intrinsèque 
        if ($Pp >= 1.67) {
            $conclusion .= '&emsp; &#8594; La performance intrinsèque du processus est très satisfaisante. <br>';
        }
        if (($Pp >= 1.33) && ($Pp < 1.67)) {
            $conclusion .= '&emsp; &#8594; La performance intrinsèque du processus est satisfaisante. <br>';
        }
        if (($Pp >= 1.0) && ($Pp < 1.33)) {
            $conclusion .= '&emsp; &#8594; La performance intrinsèque du processus est trop juste. <br>';
        }
        if (($Pp >= 0.67) && ($Pp < 1.0)) {
            $conclusion .= '&emsp; &#8594; La performance intrinsèque du processus n\'est pas satisfaisante. <br>';
        }
        if (($Pp < 0.67)) {
            $conclusion .= '&emsp; &#8594; La performance intrinsèque du processus n\'est pas du tout satisfaisante. <br>';
        }

        // performance réeele 
        if ((($Ppk >= 1.67) || ($Ppm >= 1.67)) && $CapabiliteReelleLT) {
            $conclusion .= '&emsp; &#8594; La performance réelle du processus est très satisfaisante. <br>';
            $CapabiliteReelleLT = false;
        }
        if (((($Ppk >= 1.33) && ($Ppk < 1.67)) || (($Ppm >= 1.33) && ($Ppm < 1.67))) && $CapabiliteReelleLT) {
            $conclusion .= '&emsp; &#8594; La performance réellé du processus est satisfaisante. <br>';
            $CapabiliteReelleLT = false;
        }
        if (((($Ppk >= 1.0) && ($Ppk < 1.33)) || (($Ppm >= 1.0) && ($Ppm < 1.33))) && $CapabiliteReelleLT) {
            $conclusion .= '&emsp; &#8594; La performance réellé du processus est trop juste. <br>';
            $CapabiliteReelleLT = false;
        }
        if (((($Ppk >= 0.67) && ($Ppk < 1.0)) || (($Ppm >= 0.67) && ($Ppm < 1.0))) && $CapabiliteReelleLT) {
            $conclusion .= '&emsp; &#8594; La performance réellé du processus n\'est pas satisfaisante. <br>';
            $CapabiliteReelleLT = false;
        }
        if ((($Ppk < 0.67) || ($Ppm < 0.67)) && $CapabiliteReelleLT) {
            $conclusion .= '&emsp; &#8594; La performance réellé du processus n\'est pas du tout satisfaisante. <br>';
            $CapabiliteReelleLT = false;
        }

        // centrage 
        if ($Rr <= 40) {
            $conclusion .= '<br><i class="fa-solid fa-triangle-exclamation"></i> Procédé largement décentré.<br>';
        } elseif ($Rr == 100) {
            $conclusion .= '<br><i class="fa-solid fa-square-check"></i> Procédé parfaitement centré.<br>';
        } else {
            $conclusion .= '<br><i class="fa-solid fa-square-check"></i> Procédé centré.<br>';
        }
    }

    if ($CT && $LT) {
        if ($Rs < 70) {
            $conclusion .= '<i class="fa-solid fa-triangle-exclamation"></i> Procédé instable.<br>';
        } else {
            $conclusion .= '<i class="fa-solid fa-square-check"></i> Procédé sous contrôle.<br>';
        }
    }

    return $conclusion;
}
