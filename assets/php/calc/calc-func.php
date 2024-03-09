<?php

use PhpOffice\PhpSpreadsheet\Calculation\Logical\Boolean;

function interval_nbr(int $nbrVars)
{
    $temp = 2.5 * ($nbrVars ** 0.25);
    return ceil($temp);
}



function get_N_min_max($Values)
{
    $min = $Values[0]['value'];
    $max = 0;
    foreach ($Values as $value) {
        if ($value['value'] > $max) {
            $max = $value['value'];
        }
        if ($value['value'] < $min) {
            $min = $value['value'];
        }
    }

    return array(sizeof($Values), $max, $min);
}

function step($Values)
{
    $sizeMaxMin = get_N_min_max($Values);
    $intervalNbr = interval_nbr($sizeMaxMin[0]);
    return ($sizeMaxMin[1] - $sizeMaxMin[2]) / $intervalNbr;
}

function mean($Values)
{
    $sum = 0;

    for ($i = 0; $i < sizeof($Values); $i++) {
        $sum += $Values[$i]['value'];
    }

    return (($sum / sizeof($Values)));
}

function st_dev($Values)
{
    $mean = mean($Values);
    $sqrSum = 0;

    for ($i = 0; $i < sizeof($Values); $i++) {
        $sqrSum += (abs($Values[$i]['value'] - $mean)) ** 2;
    }

    return (($sqrSum / (sizeof($Values) - 1)) ** 0.5);
}


function check_normality($conn, string $process, string $date)
{
    $sql = "SHOW TABLES LIKE '" .  $process . "_capability_" . $date . "-%'";
    $res = $conn->query($sql);
    $processNormalityHistory = mysqli_fetch_all($res);

    foreach ($processNormalityHistory as $processNormality) {
        $verifyPurpose = "SELECT value FROM `" . $processNormality[0] . "` WHERE id = 'purpose'";
        $res = $conn->query($verifyPurpose);
        if (mysqli_fetch_row($res)[0] == 'normality') {
            $verifyNormality = "SELECT value FROM `" . $processNormality[0] . "` WHERE id = 'normality'";
            $result = $conn->query($verifyNormality);
            $khi = mysqli_fetch_row($result);
            if (sizeof($khi) > 0){
                if ($khi[0]){
                    return 'true';
                } else {
                    return 'false';
                }
            } else {
                return '';
            }
        }
    }
}
