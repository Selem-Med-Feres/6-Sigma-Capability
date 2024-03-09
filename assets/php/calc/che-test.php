<?php
include('./calc-tables.php');
include('../db/db.php');
include('./calc-func.php');
include('../query/query.php');
include('../db/retrieve-values.php');
include('../parameter/parameter.php');

require_once('../../../vendor/autoload.php');

date_default_timezone_set("Africa/Tunis");
$thisInstant = date("d/m/Y-H:i:s");

use MathPHP\Probability\Distribution\Continuous;
use PhpOffice\PhpSpreadsheet\Calculation\Statistical\Distributions;

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>6σ - Capabilité Processus</title>

    <link rel="stylesheet" href="../../../css/che-test.css">
    <link rel="shortcut icon" href="../../../img/favicon.png" type="image/x-icon">
</head>

<body>
    <div class="container">
        <div class="lds-ring">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
        <div class="lds-txt">
            <h3>Une minute, je suis nul en maths...</h3>
        </div>
    </div>

    <div class="copyright">
        <div class="photo">
            <img src="../../../img/author.png">
            <img src="../../../img/author2.png">
        </div>
        <div id="signature" class="text">
            <p>Made with ❤️ by : </p>
            <ul>
                <li><a href="https://www.facebook.com/Feres.Ben.Selem1/" target="blanck"> Selem Med Feres</a></li>
                <li><a href="https://www.facebook.com/jihen.marai" target="blanck"> Marai Jihen</a></li>
            </ul>
            <p>3<sup>ème </sup> année en Génie Industriel</p>
        </div>
    </div>

    <?php
    $nameVars = isset($_GET['calculate']) ? $_GET['calculate'] : "";
    $khiTest = str_replace('_values', '_khitest', $nameVars);
    $Capability = str_replace('_values', '_capability', $nameVars);
    $nrmlRisk = isset($_GET['nrml-risk']) ? floatval($_GET['nrml-risk']) : "";

    $X = new Distributions\ChiSquared;
    $standardNormal = new Continuous\StandardNormal();

    $Values = get_measurements($conn, $nameVars);
    $N_max_min = get_N_min_max($Values);
    $step = step($Values);
    $nbrIntervals = interval_nbr($N_max_min[0]);

    $khi = $X->inverseLeftTail((1 - ($nrmlRisk / 100)), ($nbrIntervals - 3));

    $mean = mean($Values);
    $stDev = st_dev($Values) != 0 ? st_dev($Values) : 1;

    $processDetails = get_process_details($conn, define_parameter_table(), $nameVars, 27);
    $capabilityValues = get_solution($conn, $Capability);
    $TS = $processDetails[0]['TS'];
    $TI = $processDetails[0]['TI'];
    $cible = $processDetails[0]['Cible'];
    $samplesForCp = $processDetails[0]['samplesForCp'];
    $sampleNbr = 1;

    $result = [];

    foreach ($capabilityValues as $capabilityValue) {
        if ($capabilityValue['id'] == 'purpose') {
            $purpose = $capabilityValue['value'];
        }
    }

    if ($purpose == 'normality') {
        $NpiLastSum = 0;
        $tempMin = $N_max_min[2];
        $tempMax = $N_max_min[2] + $step;
        $tempP = 0;

        for ($i = 0; $i < $nbrIntervals; $i++) {
            $Xi = ($tempMax + $tempMin) / 2;
            $Ni = 0;

            for ($j = 0; $j < sizeof($Values); $j++) {
                if (($Values[$j]['value'] < (($i < ($nbrIntervals - 1)) ? $tempMax : ($tempMax + 1))) && ($Values[$j]['value'] >= $tempMin)) {
                    $Ni += 1;
                }
            }

            $Zmax = (($tempMax - $mean) / $stDev);
            $P = ($standardNormal->cdf($Zmax));
            $Npi = ($N_max_min[0] * ($P - $tempP));
            $NpiLast = $Npi != 0 ? (((abs($Ni - $Npi)) ** 2) / $Npi) : (((abs($Ni - $Npi)) ** 2));

            $sql = "INSERT INTO `" . $khiTest . "` (Intervalle, Min, Max, Centre, Ni, NiXi, NiXi_XSQR, Zmax, P, Npi, Ni_Npi, Ni_NpiSQR, Ni_NpiSQRNpi)
        VALUES ('[ " . round($tempMin, 5, PHP_ROUND_HALF_UP) . " , " . round($tempMax, 5, PHP_ROUND_HALF_UP) . (($i < ($nbrIntervals - 1)) ? " ["  : " ]") . "',
        '" . round($tempMin, 5, PHP_ROUND_HALF_UP) . "', 
        '" . round($tempMax, 5, PHP_ROUND_HALF_UP) . "', 
        '" . round($Xi, 5, PHP_ROUND_HALF_UP) . "', 
        '" . $Ni . "', 
        '" . round($Ni * $Xi, 5, PHP_ROUND_HALF_UP) . "', 
        '" . round($Ni * (($Xi - $mean)) ** 2, 5, PHP_ROUND_HALF_UP) . "', 
        '" . round($Zmax, 5, PHP_ROUND_HALF_UP) . "',
        '" . round($P, 5, PHP_ROUND_HALF_UP) . "',
        '" . round($Npi, 5, PHP_ROUND_HALF_UP) . "',
        '" . round(abs($Ni - $Npi), 5, PHP_ROUND_HALF_UP) . "',
        '" . round((abs($Ni - $Npi)) ** 2, 5, PHP_ROUND_HALF_UP) . "',
        '" . round($NpiLast, 5, PHP_ROUND_HALF_UP) . "')";

            $conn->query($sql);

            $NpiLastSum += $NpiLast;
            $tempMax += $step;
            $tempMin += $step;
            $tempP = $P;
        }

        $khiMeasured = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Khi2-measured', '" . $NpiLastSum . "')";
        $khiTheoretical = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Khi2-theoretical', '" . $khi . "')";
        $khiProbability = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('khi-probability', '" . $nrmlRisk . "')";
        $khiResult = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('normality', '" . ($NpiLastSum < $khi ? '1' : '0') . "')";

        array_push(
            $result,
            $khiMeasured,
            $khiTheoretical,
            $khiProbability,
            $khiResult,
        );
    }

    $sql = 'SHOW TABLES LIKE "' . substr($nameVars, 0, -8) .  '%"';
    $res = $conn->query($sql);
    $processValeus = mysqli_fetch_all($res);

    $sampleSize = (sizeof($processValeus) == 0) ? $processDetails[0]['normalitySample'] : $processDetails[0]['sampleSize'];

    $tolerence = $TS - $TI;
    $sampleX = []; //moyenne de chaque echant
    $sampleE = [];  //etendu de chaque echant
    $sampleStDev = [];  //ecart-type de chaque echant

    for ($i = 0; $i < $sampleNbr; $i++) {
        $temp = []; //tableau temporaire pour calculer les écarts-type
        $sample = [];
        for ($j = 0; $j < $sampleSize; $j++) {
            foreach ($Values  as $value) {
                if ($value['id'] == ($i + 1) . ':' . ($j + 1)) {
                    array_push($sample, $value['value']);
                    array_push($temp, array('value' => $value['value']));
                }
            }
        }

        array_push($sampleStDev, st_dev($temp));
        array_push($sampleX, (array_sum($sample) / sizeof($sample)));
        array_push($sampleE, round(max($sample) - min($sample), strlen(max($sample)) > strlen(min($sample)) ? strlen(max($sample)) : strlen(min($sample)), PHP_ROUND_HALF_UP));
    }

    $X = array_sum($sampleX) / sizeof($sampleX); //moyenne des moyennes
    $E = array_sum($sampleE) / sizeof($sampleE); //moyenne des etendus 
    $stDevS = array_sum($sampleStDev) / sizeof($sampleStDev); //moyenne des ecart types

    $meanStandardDeviation = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('S', '" . $stDevS . "')";
    $standardDeviation = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('stDev', '" . implode(" - ", $sampleStDev) . "')";
    $means = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Means', '" . implode(" - ", $sampleX) . "')";
    $ranges = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Ranges', '" . implode(" - ", $sampleE) . "')";
    $meanMeans = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Mean of means', '" . $X . "')";
    $meanRanges = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Mean of ranges', '" . $E . "')";

    $coefTable = COEFTABLE;

    $LSCx = $cible + ($coefTable[$sampleSize]['A2'] * $E);
    $LICx = $cible - ($coefTable[$sampleSize]['A2'] * $E);
    $LSCe = ($coefTable[$sampleSize]['D4'] * $E);
    $LICe = ($coefTable[$sampleSize]['D3'] * $E);

    $controlMapMaxX = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('LSCx', '" . $LSCx . "');";
    $controlMapMinX = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('LICx', '" . $LICx . "')";
    $controlMapMaxE = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('LSCe', '" . $LSCe . "')";
    $controlMapMinE = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('LICe', '" . $LICe . "')";

    if (($purpose != "normality") && ($purpose != "check")) {

        if (($purpose == 'CalcPp') || ($purpose == 'CalcCp,CalcPp')) {

            $sql = 'SHOW TABLES LIKE "' .  substr($Capability, 0, -8) . '%"';
            $res = $conn->query($sql);
            $processPurposeHistory = mysqli_fetch_all($res);

            $allDayValues = [];

            foreach ($processPurposeHistory as $processPurpose) {
                $verifyPurpose = "SELECT value FROM `" . $processPurpose[0] . "` WHERE id = 'purpose'";
                $res = $conn->query($verifyPurpose);
                if (mysqli_fetch_row($res)[0] != 'normality') {
                    $getValues = "SELECT value FROM `" . str_replace('capability', 'values', $processPurpose[0]) . "`";
                    $res = $conn->query($getValues);
                    foreach (mysqli_fetch_all($res, MYSQLI_ASSOC) as $Value) {
                        array_push($allDayValues, $Value);
                    }
                }
            }

            $stDevPp = st_dev($allDayValues);
            $meanPp = mean($allDayValues);

            $Pp = $tolerence / (6 * $stDevPp);
            $Ppk = min((($TS - $meanPp) / (3 * $stDevPp)), (($meanPp - $TI) / (3 * $stDevPp)));
            $Ppm = $tolerence / (6 * ((($stDevPp ** 2) + (($meanPp - $cible) ** 2)) ** 0.5));
            $Rr = ($Ppk / $Pp) * 100;

            $PpIndicator = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Pp', '" . $Pp . "')";
            $PpkIndicator = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Ppk', '" . $Ppk . "')";
            $PpmIndicator = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Ppm', '" . $Ppm . "')";
            $RrIndicator = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Rr', '" . $Rr . "')";

            array_push(
                $result,
                $PpIndicator,
                $PpkIndicator,
                $PpmIndicator,
                $RrIndicator,
            );
        }

        if (($purpose == 'CalcCp') || ($purpose == 'CalcCp,CalcPp')) {

            $sql = 'SHOW TABLES LIKE "' .  substr($Capability, 0, -8) . '%"';
            $res = $conn->query($sql);
            $processPurposeHistory = mysqli_fetch_all($res);

            $allCTValues = [];

            for ($i = 0; $i < $processDetails[0]['samplesForCp']; $i++) {
                $verifyPurpose = "SELECT value FROM `" . $processPurposeHistory[(sizeof($processPurposeHistory) - $i - 1)][0] . "` WHERE id = 'purpose'";
                $res = $conn->query($verifyPurpose);
                if (mysqli_fetch_row($res)[0] != 'normality') {
                    $getValues = "SELECT value FROM `" . str_replace('capability', 'values', $processPurposeHistory[(sizeof($processPurposeHistory) - $i - 1)][0]) . "`";
                    $res = $conn->query($getValues);
                    foreach (mysqli_fetch_all($res, MYSQLI_ASSOC) as $Value) {
                        array_push($allCTValues, $Value);
                    }
                }
            }

            $stDevSCp = st_dev($allCTValues);
            $meanCp = mean($allCTValues);

            $Cp = $tolerence / (6 * $stDevSCp);
            $Cpk = min((($TS - $meanCp) / (3 * $stDevSCp)), (($meanCp - $TI) / (3 * $stDevSCp)));
            $Cpm = $tolerence / (6 * ((($stDevSCp ** 2) + (($meanCp - $cible) ** 2)) ** 0.5));

            $z = min((($TS - $X) / $stDevSCp), (($X - $TI) / $stDevSCp));

            $zEquivIndicator = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Zéquivalent', '" . $z . "')";
            $zProcessIndicator = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Zprocessus', '" . ($z + 1.5) . "')";

            $CpIndicator = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Cp', '" . $Cp . "')";
            $CpkIndicator = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Cpk', '" . $Cpk . "')";
            $CpmIndicator = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Cpm', '" . $Cpm . "')";

            array_push(
                $result,
                $CpIndicator,
                $CpkIndicator,
                $CpmIndicator,
                $zEquivIndicator,
                $zProcessIndicator
            );
        }

        if ($purpose == 'CalcCp,CalcPp') {
            $Rs = ($Pp / $Cp) * 100;
            $RsIndicator = "INSERT INTO `" . $Capability . "` (id, value) VALUES ('Rs', '" . $Rs . "')";

            array_push(
                $result,
                $RsIndicator
            );
        }
    }

    array_push(
        $result,
        $controlMapMaxX,
        $controlMapMinX,
        $controlMapMaxE,
        $controlMapMinE,
        $meanStandardDeviation,
        $means,
        $ranges,
        $standardDeviation,
        $meanMeans,
        $meanRanges
    );

    foreach ($result as $sql) {
        $conn->query($sql);
    }

    $string = '<script type="text/javascript">';
    $string .= 'window.location = "../../../../?output-read=' . lcfirst(str_replace('_values', '_date', $nameVars)) . '"';
    $string .= '</script>';

    echo $string;

    ?>
</body>

</html>