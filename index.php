<?php
include('./assets/php/db/db.php');
include('./assets/php/calc/control-map.php');
include('./assets/php/db/retrieve-values.php');
include('./assets/php/db/drop-solution.php');
include('./assets/php/calc/indicators.php');
include('./assets/php/parameter/parameter.php');
include('./assets/php/query/query.php');
include('./assets/php/calc/calc-func.php');
include('./assets/php/func/sort-date.php');

require_once('./vendor/autoload.php');

date_default_timezone_set("Africa/Tunis");
$thisInstant = date("d/m/Y-H:i:s");

use MathPHP\Probability\Distribution\Continuous;
use PhpOffice\PhpSpreadsheet\Calculation\Statistical\Distributions;

header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sat, 26 Jul 1997 05:00:00 GMT");
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>6σ - Capabilité Processus</title>

    <link rel="stylesheet" type="text/css" href="./assets/css/font-awsome-all.css">
    <link rel="stylesheet" href="./assets/css/index.css">

    <link rel="shortcut icon" href="./assets/img/favicon.png" type="image/x-icon">
</head>

<body>
    <div id="excel-overlay" class="confirmation-overlay"></div>
    <div class="excel-info" id="excel-info">
        <h1>Instructions pour le téléversement</h1>
        <ul class="instructions">
            <li><span>Le nom du processus</span> est celui du fichier Excel téléversé.</li>
            <li><span>Le nombre d'échantillons (k)</span> et <span>Le nombre de pièces par échantillon (n)</span> sont fournis respectivement dans les cases <span>B1</span> et <span>B2</span>.</li>
            <li>Chaque colonne, <span>à partir de la colonne D</span>, reprèsente un échantillon. Les lignes contiennent les mesures des pièces de l'échantillon.</li>
            <li><span>La valeur maximale acceptée (TS)</span>, <span>La valeur cible</span>, et <span>La valeur minimale acceptée (TI)</span> sont fournies respectivement dans les cases <span>B4</span>, <span>B5</span> et <span>B6</span>. <br>Si le prélèvement est consécutif, <span>Le temps de prélèvement en minutes</span> est indiqué dans la case <span>B7</span> sinon, garder sa valeur à zéro.</li>
        </ul>
        <h4>Remarques :</h4>
        <ul class="remarques">
            <li>Le nombre minimal de mesures est 30. <br><span>Exemples :</span><br> • Un seul échantillon (k = 1) et trente pièces par échantillon (n = 30). <br> • Dix échantillons (k = 10) et trois pièces par échantillon (n = 3).</li>
            <li>Dans le cas d'<span>un seul échantillon</span>, la valeur minimale de <span>n</span> est 2.</li>
            <li>Dans le cas de <span>plusieurs échantillons (k > 1)</span>, <span>n ∈ [2 ; 25]</span></li>
        </ul>
        <img src="./assets/img/excel-input.png" alt="">
        <div class="download-model">
            <a href="./assets/tamplates/[Le_nom_du_processus].xlsx"><i class="fa-solid fa-file-arrow-down"></i>Télécharger un modèle</a>
        </div>
    </div>
    <div class="forms-container grid-container" id="grid-container-forms">
        <div class="fixed-sidebar">
            <div class="vars-nbr" id="vars-nbr-form">
                <form action="" method="GET">
                    <label for="vars-name">
                        Nom du procédé :
                        <input value="<?php echo (isset($_GET['vars-name']) ? str_replace('_', ' ', $_GET['vars-name']) : (isset($_GET['process-name']) ? $_GET['process-name'] : '')); ?>" id="process-name" type="text" name="process-name" maxlength="20" required placeholder="Longueur maximale : 20 caractères">
                    </label>
                    <label for="vars-ech">
                        Taille du premier échantillon <span>(χ²)</span> :
                        <input value="<?php echo isset($_GET['first-sample-size']) ? $_GET['first-sample-size'] : (isset($_GET['vars-name']) ? get_process_details($conn, define_parameter_table(), $_GET['vars-name'], 0)[0]['normalitySample'] : '') ?>" id="first-sample-size" type="number" name="first-sample-size" min="30" required placeholder="Taille minimale : n = 30">
                    </label>
                    <label for="vars-nbr">
                        Risque <span>(α<sub> %</sub>)</span> :
                        <input value="<?php echo (isset($_GET['risque']) ? $_GET['risque'] : (isset($_GET['vars-name']) ? get_process_details($conn, define_parameter_table(), $_GET['vars-name'], 0)[0]['Alpha'] : '')) ?>" id="risque" type="number" name="risque" max="99.9" step="0.1" min="0.1" required placeholder="Risque : α ∈ ]0 ; 100[">
                    </label>
                    <br>
                    <br>
                    <h1 class="or">Ou bien</h1>
                    <br>
                    <label for="">
                        Téléverser un fichier Excel <span>(.xlsx) </span> <i id="show-info-excel" class="fa-solid fa-circle-info"></i>
                        <input type="file" name="upload" id="upload" accept=".xlsx">
                    </label>
                    <br>
                    <input type="submit" name="save-data" value="Confirmer">
                </form>
                <div class="backword" id="backword"></div>
                <div class="dashboard" id="dashboard"></div>
                <br>
                <div class="message" id="table-error"></div>
            </div>
        </div>
        <div class="existing-tables" id="existing-tables">
            <?php
            $sql = 'SELECT id FROM ' . define_parameter_table();
            $res = $conn->query($sql);
            $processList = mysqli_fetch_all($res, MYSQLI_ASSOC);
            $processCount = 0;

            usort($processList, 'process_list_date_compare');
            ?>

            <div id="nav-process" class="nav-process">
                <div id="nav-process-main"><a href=""><i class="fa-solid fa-industry"></i></a></div>
                <div id="nav-process-secondaries">
                <?php foreach ($processList as $processNav) { ?>
                    <div class="nav-process-secondary">
                        <a href="#<?php echo $processNav['id'] ?>"><?php echo str_replace('_', ' ', $processNav['id']) ?></a>
                    </div>
                <?php } ?>
                </div>
            </div>

            <div id="context-menu-tables">
                <div id="view" class="item">
                    <p><i class="fa-solid fa-eye"></i> Visualiser</p>
                </div>
                <div id="export" class="item">
                    <p><i class="fa-solid fa-file-excel"></i> Exporter</p>
                </div>
                <div class="item">
                    <p><i class="fa-solid fa-trash"></i> Supprimer</p>
                </div>
            </div>

            <div id="context-menu-archive">
                <div id="view" class="item">
                    <p><i class="fa-solid fa-folder-open"></i> Explorer</p>
                </div>
                <div id="export" class="item">
                    <p><i class="fa-solid fa-layer-group"></i> Résumé</p>
                </div>
                <div id="export" class="item">
                    <p><i class="fa-solid fa-chart-line"></i> Cartes de contrôles</p>
                </div>
                <div class="item">
                    <p><i class="fa-solid fa-magnifying-glass-chart"></i> Suivi des indicateurs</p>
                </div>
                <div class="item">
                    <p><i class="fa-solid fa-file-circle-check"></i> Rapport de capabilité</p>
                </div>
                <div class="item">
                    <p><i class="fa-solid fa-trash"></i> Supprimer</p>
                </div>
            </div>

            <?php
            $followUp = isset($_GET['follow-up']) ? $_GET['follow-up'] : "";
            $archiveSammuary = isset($_GET['archive-sammuary']) ? $_GET['archive-sammuary'] : '';
            $archiveFollowUp = isset($_GET['archive-follow-up']) ? $_GET['archive-follow-up'] : '';
            $archiveMaps = isset($_GET['archive-maps']) ? $_GET['archive-maps'] : '';
            $capabilityReport = isset($_GET['capability-report']) ? $_GET['capability-report'] : '';

            $EmiddleThirdBottom = [];
            $EmiddleThirdTop = [];
            $StDevmiddleThirdBottom = [];
            $StDevmiddleThirdTop = [];
            $XmiddleThirdBottom = [];
            $XmiddleThirdTop = [];
            $XArray = [];
            $CibleArray = [];
            $LSCxArray = [];
            $LICxArray = [];
            $LSCeArray = [];
            $LICeArray = [];
            $LSCstdevArray = [];
            $LICstdevArray = [];
            $TSArray = [];
            $TIArray = [];
            $chartArrayN = [];
            $controlMapArrayX = [];
            $controlMapArrayE = [];
            $controlMapArrayStDev = [];
            $controlMapArray = [];

            $CpFollowUp = [];
            $CpkFollowUp = [];
            $CpmFollowUp = [];

            $PpFollowUp = [];
            $PpkFollowUp = [];
            $PpmFollowUp = [];

            $drawMap = false;
            $drawControlMaps = 'nothing';

            $dataPointsArray = [];

            if (check_parameter_table($conn)) {
                add_parameter_table($conn);
            }

            for ($i = 0; $i < sizeof($processList); $i++) {
                $processCount += 1;
            ?>
                <div id="<?php echo $processList[$i]['id'] ?>" class="process">
                    <div class="process-header">
                        <h1><?php echo str_replace('_', ' ', $processList[$i]['id']) ?></h1>
                        <a id="show-details" href="./?details=<?php echo strtolower($processList[$i]['id']) ?>">Détails</a>
                        <a id="show-planning" href="./?planning=<?php echo strtolower($processList[$i]['id']) ?>">Planning</a>
                        <a id="show-follow-up" href="./?follow-up=<?php echo strtolower($processList[$i]['id']) ?>">Suivi des indicateurs</a>
                    </div>

                    <?php
                    $sql = 'SHOW TABLES LIKE "' . str_replace(' ', '_', strtolower($processList[$i]['id'])) . '_values_%"';
                    $res = $conn->query($sql);
                    $processDatesList = mysqli_fetch_all($res);

                    $ProcessSavedDates = [];

                    for ($j = 0; $j < sizeof($processDatesList); $j++) {
                        if (!(in_array(substr(($processDatesList[$j][0]), -19, -9), $ProcessSavedDates))) {
                            array_push($ProcessSavedDates, substr(($processDatesList[$j][0]), -19, -9));
                        }
                    }

                    usort($ProcessSavedDates, 'archive_date_compare');

                    if (sizeof($ProcessSavedDates) > 0) {
                        if (!($ProcessSavedDates[sizeof($ProcessSavedDates) - 1] == substr($thisInstant, 0, -9))) {
                            array_push($ProcessSavedDates, substr($thisInstant, 0, -9));
                            $restartCounter = "UPDATE `" . define_parameter_table() . "` SET RemainingSamplesThisDay = SamplesPerDay WHERE id='" . $processList[$i]['id'] . "'";
                            $conn->query($restartCounter);
                        }
                    } else {
                        array_push($ProcessSavedDates, substr($thisInstant, 0, -9));
                        $restartCounter = "UPDATE `" . define_parameter_table() . "` SET RemainingSamplesThisDay = SamplesPerDay WHERE id ='" . $processList[$i]['id'] . "'";
                        $conn->query($restartCounter);
                    }
                    ?>
                    <div class="archive-days">
                        <?php
                        foreach (array_reverse($ProcessSavedDates) as $procesSavedDate) {
                        ?>
                            <div class="archive" id="<?php echo ($procesSavedDate . '&process=' . strtolower($processList[$i]['id'])) . '&khi=' . (check_normality($conn, strtolower($processList[$i]['id']), $procesSavedDate)) ?>">
                                <?php if ($procesSavedDate == substr($thisInstant, 0, -9)) { ?>
                                    <div class="active-folder">
                                        <div class="blob green"></div>
                                    </div>
                                <?php } ?>
                                <i class="fa-solid fa-folder"></i>
                                <p class="archive-date"><?php echo ($procesSavedDate) ?></p>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            <?php
            }

            if ($processCount == 0) {
            ?>
                <div id="no-table" class="no-table">
                    <p class="none-found">Aucun processus trouvé !</p>
                    <p class="add-new">Ajoutez un nouveau processus à partir du formulaire de la colonne latérale.</p>
                </div>
            <?php
            }
            if (($archiveFollowUp == 'show') && isset($_GET['of']) && isset($_GET['history'])
                && !isset($_GET['archive']) && !isset($_GET['process']) && !isset($_GET['archive-sammuary']) && !isset($_GET['archive-maps'])
            ) {
                $sql = 'SHOW TABLES LIKE "' . $_GET['of'] . '_capability_' . $_GET['history'] . '-%"';
                $res = $conn->query($sql);
                $processDatesList = mysqli_fetch_all($res);

                $indicators = [];

                for ($i = 0; $i < sizeof($processDatesList); $i++) {
                    $tempTable = [];
                    $sql = "SELECT * From `" . $processDatesList[$i][0] . "` WHERE id='Cp' OR id='Cpk' OR id='Cpm' OR id='Pp' OR id='Ppk' OR id='Ppm'";
                    $res = $conn->query($sql);
                    array_push($tempTable, mysqli_fetch_all($res, MYSQLI_ASSOC));
                    $indicators[$processDatesList[$i][0]] = $tempTable;
                }

                foreach ($indicators as $key => $indicator) {
                    $containsPp = false;
                    $containsCp = false;

                    if (sizeof($indicator[0]) == 0) {
                        array_push($CpFollowUp, array("label" => substr($key, -19), 'y' => null));
                        array_push($CpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                        array_push($CpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                        array_push($PpFollowUp, array("label" => substr($key, -19), 'y' => null));
                        array_push($PpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                        array_push($PpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                    } else {
                        for ($i = 0; $i < sizeof($indicator[0]); $i++) {
                            if ($indicator[0][$i]['id'] == 'Cp') {
                                $containsCp = true;
                                array_push($CpFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                            } elseif ($indicator[0][$i]['id'] == 'Pp') {
                                $containsPp = true;
                                array_push($PpFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                            } elseif ($indicator[0][$i]['id'] == 'Ppk') {
                                $containsPp = true;
                                array_push($PpkFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                            } elseif ($indicator[0][$i]['id'] == 'Cpk') {
                                $containsCp = true;
                                array_push($CpkFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                            } elseif ($indicator[0][$i]['id'] == 'Cpm') {
                                $containsCp = true;
                                array_push($CpmFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                            } elseif ($indicator[0][$i]['id'] == 'Ppm') {
                                $containsPp = true;
                                array_push($PpmFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                            }
                        }
                    }

                    if (!($containsCp)) {
                        array_push($CpFollowUp, array("label" => substr($key, -19), 'y' => null));
                        array_push($CpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                        array_push($CpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                    }

                    if (!($containsPp)) {
                        array_push($PpFollowUp, array("label" => substr($key, -19), 'y' => null));
                        array_push($PpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                        array_push($PpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                    }

                    foreach ($CpFollowUp as $Cp) {
                        if ($Cp['y'] != '') {
                            $drawMap = true;
                        }
                    }

                    foreach ($PpFollowUp as $Pp) {
                        if ($Pp['y'] != '') {
                            $drawMap = true;
                        }
                    }
                }
            ?>
                <div id="follow-up-overlay" class="follow-up-overlay"></div>
                <div class="follow-up-chart-container" id="follow-up-chart-container" style=" height: 400px; width: 700px;">
                    <div id="followUp-chartContainer" style=" width: 100%;"></div>
                </div>
            <?php
            }

            if (($archiveMaps == 'show') && isset($_GET['of']) && isset($_GET['history'])
                && !isset($_GET['archive']) && !isset($_GET['process']) && !isset($_GET['archive-sammuary']) && !isset($_GET['archive-follow-up'])
            ) {
                $allValuesHistory = [];
                $coefTable = COEFTABLE;


                $sql = "SHOW TABLES LIKE '" . str_replace('_date', '_values', lcfirst($_GET['of'] . "_date_" . $_GET['history'] . "-%'"));
                $res = $conn->query($sql);
                $capabilityHistoryList = mysqli_fetch_all($res);

                foreach ($capabilityHistoryList as $capabilityTable) {
                    $sql = "SELECT value FROM `" . str_replace('values', 'capability', $capabilityTable[0]) . "` WHERE id='purpose'";
                    $res = $conn->query($sql);
                    $allPurposeHistory[str_replace('values', 'capability', $capabilityTable[0])] = mysqli_fetch_all($res);
                }

                foreach ($capabilityHistoryList as $capabilityTable) {
                    if ($allPurposeHistory[str_replace('values', 'capability', $capabilityTable[0])][0][0] != 'normality') {
                        $sql = "SELECT value FROM `" . $capabilityTable[0] . "`";
                        $res = $conn->query($sql);
                        $allValuesHistory[] = mysqli_fetch_all($res, MYSQLI_ASSOC);
                    }
                }

                $drawControlMaps = sizeof($allValuesHistory) > 0 ? 'draw' : 'dont';

                $processDetails = get_process_details($conn, define_parameter_table(), $_GET['of'], 0);
                $TS = $processDetails[0]['TS'];
                $TI = $processDetails[0]['TI'];
                $cible = $processDetails[0]['Cible'];
                $sampleSize = $processDetails[0]['sampleSize'];

                $sampleE = [];
                $sampleX = [];
                $sampleStDev = [];

                for ($i = 0; $i < sizeof($allValuesHistory); $i++) {
                    $sampleSum = 0;
                    $tempMax = 0;
                    $tempMin = $allValuesHistory[$i][0]['value'];
                    for ($j = 0; $j < ($sampleSize); $j++) {
                        $sampleSum += $allValuesHistory[$i][$j]['value'];
                        if ($allValuesHistory[$i][$j]['value'] > $tempMax) {
                            $tempMax = $allValuesHistory[$i][$j]['value'];
                        }
                        if ($allValuesHistory[$i][$j]['value'] < $tempMin) {
                            $tempMin = $allValuesHistory[$i][$j]['value'];
                        }
                    }
                    array_push($sampleE, $tempMax - $tempMin);
                    array_push($sampleX, $sampleSum / $sampleSize);
                    array_push($sampleStDev, st_dev($allValuesHistory[$i]));
                }

                $E = $sampleE ? array_sum($sampleE) / sizeof($sampleE) : intval(1);
                $stDev = $sampleStDev ? array_sum($sampleStDev) / sizeof($sampleStDev) : intval(1);

                $LSCx = round($cible + ($coefTable[$sampleSize]['A2'] * $E), 5, PHP_ROUND_HALF_UP);
                $LICx = round($cible - ($coefTable[$sampleSize]['A2'] * $E), 5, PHP_ROUND_HALF_UP);
                $LSCe = round(($coefTable[$sampleSize]['D4'] * $E), 5, PHP_ROUND_HALF_UP);
                $LICe = round(($coefTable[$sampleSize]['D3'] * $E), 5, PHP_ROUND_HALF_UP);
                $LSCstdev = round(($coefTable[$sampleSize]['B4'] * $stDev), 5, PHP_ROUND_HALF_UP);
                $LICstdev = round(($coefTable[$sampleSize]['B3'] * $stDev), 5, PHP_ROUND_HALF_UP);

                $XmapConclusion = analyse_Xmap($LSCx, $cible, $LICx, sizeof($sampleX) ? implode(' - ', $sampleX) : '0');
                $stDevmapConclusion = analyse_Emap($LSCstdev, $stDev, $LICstdev, implode(' - ', $sampleStDev));
                $EmapConclusion = analyse_Emap($LSCe, $E, $LICe, implode(' - ', $sampleE));

                for ($i = 0; $i < sizeof($sampleX); $i++) {
                    array_push($controlMapArrayX, array("label" => "Échantillon N° " . ($i + 1), "y" => $sampleX[$i]));
                    array_push($LSCxArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LSCx));
                    array_push($LICxArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICx));
                    array_push($XArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $cible));
                    array_push($XmiddleThirdBottom, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICx + (($LSCx - $LICx) / 3)));
                    array_push($XmiddleThirdTop, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICx + ((($LSCx - $LICx) / 3) * 2)));
                }

                for ($i = 0; $i < sizeof($sampleE); $i++) {
                    array_push($controlMapArrayE, array("label" => "Échantillon N° " . ($i + 1), "y" => $sampleE[$i]));
                    array_push($LSCeArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LSCe));
                    array_push($LICeArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICe));
                    array_push($EmiddleThirdBottom, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICe + (($LSCe - $LICe) / 3)));
                    array_push($EmiddleThirdTop, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICe + ((($LSCe - $LICe) / 3) * 2)));
                }

                for ($i = 0; $i < sizeof($sampleStDev); $i++) {
                    array_push($controlMapArrayStDev, array("label" => "Échantillon N° " . ($i + 1), "y" => $sampleStDev[$i]));
                    array_push($LSCstdevArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LSCstdev));
                    array_push($LICstdevArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICstdev));
                    array_push($StDevmiddleThirdBottom, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICstdev + (($LSCstdev - $LICstdev) / 3)));
                    array_push($StDevmiddleThirdTop, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICstdev + ((($LSCstdev - $LICstdev) / 3) * 2)));
                }
            ?>
                <div id="archive-maps-overlay" class="follow-up-overlay"></div>
                <div id="archive-control-maps-container" class="fixed">
                    <div class="title-container">
                        <i class="fa-solid fa-circle-left"></i>
                        <div class="title-grid">
                            <h3>Cartes de Contrôle <span style="font-size: 17px;">(X&#772;/S)</span></h3>
                            <h3>Cartes de Contrôle <span style="font-size: 17px;">(X&#772;/E)</span></h3>
                        </div>
                        <i class="fa-solid fa-circle-right"></i>
                    </div>
                    <div class="mean-control-map" style="height: 400px;">
                        <div id="X-map-chartContainer" style=" width: 100%;"></div>
                    </div>
                    <div class="dispertion-maps" id="dispertion-maps">
                        <div class="stdev-control-map" style="height: 400px; margin-top: 50px;">
                            <div id="stdev-map-chartContainer" style=" width: 100%;"></div>
                        </div>
                        <div class="range-control-map" style="height: 400px; margin-top: 50px;">
                            <div id="E-map-chartContainer" style=" width: 100%;"></div>
                        </div>
                    </div>
                    <?php if ($XmapConclusion || $EmapConclusion) { ?>
                        <div class="control-map-conclution">
                            <table>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th colspan="4">Interprétation des carte de contrôle</th>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <th>Observation</th>
                                        <th>Description</th>
                                        <th>Décision</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if ($XmapConclusion) { ?>
                                        <tr id="x-map-conclusion-tr">
                                            <td>Carte des moyennes <span>(X&#772;&#772)</span></td>
                                            <td><?php echo $XmapConclusion[0] ?></td>
                                            <td><?php echo $XmapConclusion[1] ?></td>
                                            <td><?php echo $XmapConclusion[2] ?></td>
                                        </tr>
                                    <?php }
                                    if ($stDevmapConclusion) { ?>
                                        <tr id="s-map-conclusion-tr">
                                            <td>Carte des écart-types <span>(S&#772;)</span></td>
                                            <td><?php echo $stDevmapConclusion[0] ?></td>
                                            <td><?php echo $stDevmapConclusion[1] ?></td>
                                            <td><?php echo $stDevmapConclusion[2] ?></td>
                                        </tr>
                                    <?php }
                                    if ($EmapConclusion) { ?>
                                        <tr id="e-map-conclusion-tr">
                                            <td>Carte des étendues <span>(E&#772;)</span></td>
                                            <td><?php echo $EmapConclusion[0] ?></td>
                                            <td><?php echo $EmapConclusion[1] ?></td>
                                            <td><?php echo $EmapConclusion[2] ?></td>
                                        </tr>
                                    <?php }
                                    ?>
                                </tbody>
                            </table>
                            <p id="remarque"><i>*En cas de réglage : un nouvel échantillon est mesuré et une deuxième étude doit être faite. Pour être acceptable, le point doit se situer dans le tiers central de la carte des moyennes X&#772;&#772.</i></p>
                        </div>
                </div>
            <?php }
                }

                if (($archiveSammuary == 'show') && isset($_GET['of']) && isset($_GET['history'])
                    && !isset($_GET['archive']) && !isset($_GET['process']) && !isset($_GET['archive-follow-up']) && !isset($_GET['archive-maps'])
                ) {
                    $sammuaryTrTh = [];
                    $valuesTablesList = [];
                    $valuesList = [];
                    $CpList = [];
                    $PpList = [];

                    $archiveSammuaryData = get_process_details($conn, define_parameter_table(), $_GET['of'], 0);

                    $startHour = intval(explode(':', $archiveSammuaryData[0]['startTime'])[0]);
                    $startMinute = intval(explode(':', $archiveSammuaryData[0]['startTime'])[1]);
                    $endHour = intval(explode(':', $archiveSammuaryData[0]['endTime'])[0]);
                    $endMinute = intval(explode(':', $archiveSammuaryData[0]['endTime'])[1]);
                    $startSecond = 0;

                    $measureTime = intval($archiveSammuaryData[0]['measureTime']);
                    $prodCadence = intval($archiveSammuaryData[0]['prodCadence']);

                    $CpCounter = 1;

                    if ($endHour < $startHour) {
                        $endHour += 24;
                    }
                    if (($endHour == $startHour) && ($endMinute <= $startMinute)) {
                        $endHour += 24;
                    }

                    if ($measureTime <= $prodCadence) {
                        $startSecond += $measureTime;
                        $adding = $prodCadence;
                    } else {
                        $startSecond += $prodCadence;
                        $adding = $measureTime;
                    }

                    for ($i = 0; $i < intval($archiveSammuaryData[0]['normalitySample']); $i++) {
                        $startSecond += $adding;

                        while ($startSecond >= 60) {
                            $startMinute += 1;
                            $startSecond -= 60;

                            while ($startMinute >= 60) {
                                $startHour += 1;
                                $startMinute -= 60;
                            }
                        }
                    }

                    if ($startHour < 10) {
                        $startHourLabel = '0' . $startHour;
                    } else {
                        $startHourLabel = $startHour;
                    }
                    if ($startMinute < 10) {
                        $startMinuteLabel = '0' . $startMinute;
                    } else {
                        $startMinuteLabel = $startMinute;
                    }

                    array_push($sammuaryTrTh, array("y" => intval($archiveSammuaryData[0]['normalitySample']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => 'khi'));

                    while (($startHour < $endHour) || (($startHour == $endHour) && ($startMinute < $endMinute))) {
                        $startMinute += (60 * floatval($archiveSammuaryData[0]['sampelingCadence']));
                        while ($startMinute >= 60) {
                            $startHour += 1;
                            $startMinute -= 60;
                        }

                        if ($startHour < 10) {
                            $startHourLabel = '0' . $startHour;
                        } else {
                            $startHourLabel = $startHour;
                        }
                        if ($startMinute < 10) {
                            $startMinuteLabel = '0' . $startMinute;
                        } else {
                            $startMinuteLabel = $startMinute;
                        }

                        if (($startHour < $endHour) || (($startHour == $endHour) && ($startMinute < $endMinute))) {
                            if (($CpCounter % $archiveSammuaryData[0]['samplesForCp']) == 0) {
                                array_push($sammuaryTrTh, array("y" => intval($archiveSammuaryData[0]['sampleSize']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => 'Cp'));
                            } else {
                                array_push($sammuaryTrTh, array("y" => intval($archiveSammuaryData[0]['sampleSize']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => ''));
                            }
                        }

                        $CpCounter += 1;
                    }
                    $sammuaryTrTh[sizeof($sammuaryTrTh) - 1]['indicator'] .= 'Pp';

                    $sql = "SHOW TABLES LIKE '" . $_GET['of'] . "_values_" . $_GET['history'] . "-%'";
                    $res = $conn->query($sql);
                    $valuesTablesList = mysqli_fetch_all($res);

                    for ($j = 1; $j < sizeof($valuesTablesList); $j++) {
                        $sql = "SELECT Value FROM `" . $valuesTablesList[$j][0] . "`";
                        $res = $conn->query($sql);
                        $valuesList[$j] = mysqli_fetch_all($res);

                        $sql = "SELECT Value FROM `" . str_replace('values', 'capability', $valuesTablesList[$j][0]) . "` WHERE id = 'Cp'";
                        $res = $conn->query($sql);
                        $CpList[$j] = mysqli_fetch_all($res);

                        $sql = "SELECT Value FROM `" . str_replace('values', 'capability', $valuesTablesList[$j][0]) . "` WHERE id = 'Pp'";
                        $res = $conn->query($sql);
                        $PpList[$j] = mysqli_fetch_all($res);
                    }
            ?>
            <div id="archive-sammuary-overlay" class="confirmation-overlay"></div>
            <div class="archive-sammuary fixed" id="archive-sammuary">
                <h1>Résumé : <?php echo (str_replace('_', ' ', $_GET['of']) . ' (' . $_GET['history'] . ')') ?></h1>
                <div class="archive-sammuary-content fixed">
                    <table>
                        <thead>
                            <tr>
                                <th></th>
                                <?php for ($i = 1; $i < sizeof($sammuaryTrTh); $i++) { ?>
                                    <th><?php echo $sammuaryTrTh[$i]['label']  ?></th>
                                <?php } ?>
                            </tr>
                            <tr>
                                <th></th>
                                <?php for ($i = 1; $i < sizeof($sammuaryTrTh); $i++) { ?>
                                    <th>(<?php echo (isset($valuesTablesList[$i][0]) ? substr($valuesTablesList[$i][0], -8, -3) : ' - ') ?>)</th>
                                <?php } ?>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            for ($i = 0; $i < $archiveSammuaryData[0]['sampleSize']; $i++) {
                            ?>
                                <tr>
                                    <td>X<sub><?php echo ($i + 1) ?></sub></td>
                                    <?php for ($c = 1; $c < sizeof($sammuaryTrTh); $c++) { ?>
                                        <td class='value-row-sammuary'><?php echo (isset($valuesList[$c][$i][0]) ? $valuesList[$c][$i][0] : ' - ') ?></td>
                                    <?php } ?>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr id="Cp-row-sammuary">
                                <td>C<sub>p</sub></td>
                                <?php for ($c = 1; $c < sizeof($sammuaryTrTh); $c++) {
                                    if (isset($CpList[$c][0][0])) { ?>
                                        <td colspan="<?php echo $archiveSammuaryData[0]['samplesForCp'] ?>"><?php echo round($CpList[$c][0][0], 5, PHP_ROUND_HALF_UP) ?></td>
                                        <?php } else {
                                        if ($sammuaryTrTh[$c]['indicator'] == 'Cp') { ?>
                                            <td colspan="<?php echo $archiveSammuaryData[0]['samplesForCp'] ?>"> - </td>
                                <?php }
                                    }
                                } ?>
                            </tr>
                            <tr>
                                <td>P<sub>p</sub></td>
                                <?php for ($c = 1; $c < sizeof($sammuaryTrTh); $c++) {
                                    if (isset($PpList[$c][0][0])) { ?>
                                        <td colspan="<?php echo ($archiveSammuaryData[0]['SamplesPerDay'] - 1) ?>"><?php echo round($PpList[$c][0][0], 5, PHP_ROUND_HALF_UP) ?></td>
                                        <?php } else {
                                        if ($c == (sizeof($sammuaryTrTh) - 1)) { ?>
                                            <td colspan="<?php echo ($archiveSammuaryData[0]['SamplesPerDay'] - 1) ?>"> - </td>
                                <?php }
                                    }
                                } ?>
                            </tr>
                        </tfoot>
                    </table>
                    <div id="trigger"></div>
                </div>
            </div>
        <?php
                }


                if (isset($_GET['archive']) && isset($_GET['process'])) {
        ?>
            <div class="process-header" id="process-header">
                <h1><?php echo str_replace('_', ' ', $_GET['process']) . " | " . $_GET['archive']  ?></h1>
                <a id="show-archive-sammuary" href="<?php echo get_url() ?>&archive-sammuary=show">Résumé</a>
                <a id="show-archive-control-maps" href="<?php echo get_url() ?>&archive-maps=show">Cartes de contrôles</a>
                <a id="show-archive-follow-up" href="<?php echo get_url() ?>&archive-follow-up=show">Suivi des indicateurs</a>
                <a id="capability-report" href="./?capability-report=<?php echo  lcfirst($_GET['process']) . "keyword" . $_GET['archive'] . "&from=archive" ?>">Rapport de capabilité</a>
            </div>
            <div id="process-capabilities" class="process-capabilities content">
                <?php

                    $sql = "SHOW TABLES LIKE '" . strtolower($_GET['process']) . "_values_" . $_GET['archive'] . "-%'";
                    $res = $conn->query($sql);
                    $ExisitingTables = mysqli_fetch_all($res);

                    echo '<script type="text/javascript">
                            (document.querySelectorAll(".process")).forEach(archive => {
                                archive.style.display = "none";
                            });
                        </script>';

                    echo '<script type="text/javascript">
                            document.getElementById("dashboard").innerHTML += `<a href="./">Tableau de Bord</a>`;
                            document.getElementById("dashboard").classList.add("visible");
                        </script>';

                    foreach ($ExisitingTables as $ExisitngTable) {
                        $thisCapability = get_solution($conn, str_replace('values', 'capability', $ExisitngTable[0]));

                        foreach ($thisCapability as $thisCapabilityValue) {
                            if ($thisCapabilityValue['id'] == 'purpose') {
                                $thisPurpose = $thisCapabilityValue['value'];
                            }
                        }
                ?>
                    <div class="table" id="<?php echo str_replace('_values', '_date', $ExisitngTable[0]) ?>">
                        <?php if ($thisPurpose == 'CalcCp') { ?>
                            <div class="indicator-star CalcCp">
                                <p>σ<sub>CT</sub></p>
                            </div>
                        <?php }
                        if ($thisPurpose == 'normality') { ?>
                            <div class="indicator-star normality">
                                <p>χ²</p>
                            </div>
                        <?php }
                        if ($thisPurpose == 'CalcPp') { ?>
                            <div class="indicator-star CalcPp">
                                <p>σ<sub>LT</sub></p>
                            </div>
                        <?php }
                        if ($thisPurpose == 'CalcCp,CalcPp') { ?>
                            <div class="indicator-star CalcCp-CalcPp">
                                <p>σ<sub>CT</sub></p>
                                <p>&nbsp;&nbsp;σ<sub>LT</sub></p>
                            </div>
                        <?php } ?>
                        <i class="fa-solid fa-file-excel"></i>
                        <p class="table-name"><?php echo substr($ExisitngTable[0], -8) ?></p>
                    </div>
                <?php }
                    $sqlRemainingSamplesThisDay = 'SELECT RemainingSamplesThisDay FROM ' . define_parameter_table() . " WHERE id ='" . $_GET['process'] . "'";
                    $resRemainingSamplesThisDay = $conn->query($sqlRemainingSamplesThisDay);
                    $RemainingSamplesThisDay = mysqli_fetch_all($resRemainingSamplesThisDay, MYSQLI_ASSOC);

                    if (($ProcessSavedDates[sizeof($ProcessSavedDates) - 1] == $_GET['archive']) && ($RemainingSamplesThisDay[0]['RemainingSamplesThisDay'] > 0)) { ?>
                    <div class="add-table" id="<?php echo  $_GET['process']  ?>">
                        <i class="fa-solid fa-plus"></i>
                    </div>
                <?php } ?>
            </div>
            <?php

                    if (($archiveSammuary == 'show') && !isset($_GET['of']) && !isset($_GET['history']) && !isset($_GET['archive-follow-up'])
                        && isset($_GET['archive']) && isset($_GET['process']) && !isset($_GET['archive-maps'])
                    ) {
                        $sammuaryTrTh = [];
                        $valuesTablesList = [];
                        $valuesList = [];
                        $CpList = [];
                        $PpList = [];

                        $archiveSammuaryData = get_process_details($conn, define_parameter_table(), $_GET['process'], 0);

                        $startHour = intval(explode(':', $archiveSammuaryData[0]['startTime'])[0]);
                        $startMinute = intval(explode(':', $archiveSammuaryData[0]['startTime'])[1]);
                        $endHour = intval(explode(':', $archiveSammuaryData[0]['endTime'])[0]);
                        $endMinute = intval(explode(':', $archiveSammuaryData[0]['endTime'])[1]);
                        $startSecond = 0;

                        $measureTime = intval($archiveSammuaryData[0]['measureTime']);
                        $prodCadence = intval($archiveSammuaryData[0]['prodCadence']);

                        $CpCounter = 1;

                        if ($endHour < $startHour) {
                            $endHour += 24;
                        }
                        if (($endHour == $startHour) && ($endMinute <= $startMinute)) {
                            $endHour += 24;
                        }

                        if ($measureTime <= $prodCadence) {
                            $startSecond += $measureTime;
                            $adding = $prodCadence;
                        } else {
                            $startSecond += $prodCadence;
                            $adding = $measureTime;
                        }

                        for ($i = 0; $i < intval($archiveSammuaryData[0]['normalitySample']); $i++) {
                            $startSecond += $adding;

                            while ($startSecond >= 60) {
                                $startMinute += 1;
                                $startSecond -= 60;

                                while ($startMinute >= 60) {
                                    $startHour += 1;
                                    $startMinute -= 60;
                                }
                            }
                        }

                        if ($startHour < 10) {
                            $startHourLabel = '0' . $startHour;
                        } else {
                            $startHourLabel = $startHour;
                        }
                        if ($startMinute < 10) {
                            $startMinuteLabel = '0' . $startMinute;
                        } else {
                            $startMinuteLabel = $startMinute;
                        }

                        array_push($sammuaryTrTh, array("y" => intval($archiveSammuaryData[0]['normalitySample']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => 'khi'));

                        while (($startHour < $endHour) || (($startHour == $endHour) && ($startMinute < $endMinute))) {
                            $startMinute += (60 * floatval($archiveSammuaryData[0]['sampelingCadence']));
                            while ($startMinute >= 60) {
                                $startHour += 1;
                                $startMinute -= 60;
                            }

                            if ($startHour < 10) {
                                $startHourLabel = '0' . $startHour;
                            } else {
                                $startHourLabel = $startHour;
                            }
                            if ($startMinute < 10) {
                                $startMinuteLabel = '0' . $startMinute;
                            } else {
                                $startMinuteLabel = $startMinute;
                            }

                            if (($startHour < $endHour) || (($startHour == $endHour) && ($startMinute < $endMinute))) {
                                if (($CpCounter % $archiveSammuaryData[0]['samplesForCp']) == 0) {
                                    array_push($sammuaryTrTh, array("y" => intval($archiveSammuaryData[0]['sampleSize']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => 'Cp'));
                                } else {
                                    array_push($sammuaryTrTh, array("y" => intval($archiveSammuaryData[0]['sampleSize']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => ''));
                                }
                            }

                            $CpCounter += 1;
                        }
                        $sammuaryTrTh[sizeof($sammuaryTrTh) - 1]['indicator'] .= 'Pp';

                        $sql = "SHOW TABLES LIKE '" . $_GET['process'] . "_values_" . $_GET['archive'] . "-%'";
                        $res = $conn->query($sql);
                        $valuesTablesList = mysqli_fetch_all($res);

                        for ($j = 1; $j < sizeof($valuesTablesList); $j++) {
                            $sql = "SELECT Value FROM `" . $valuesTablesList[$j][0] . "`";
                            $res = $conn->query($sql);
                            $valuesList[$j] = mysqli_fetch_all($res);

                            $sql = "SELECT Value FROM `" . str_replace('values', 'capability', $valuesTablesList[$j][0]) . "` WHERE id = 'Cp'";
                            $res = $conn->query($sql);
                            $CpList[$j] = mysqli_fetch_all($res);

                            $sql = "SELECT Value FROM `" . str_replace('values', 'capability', $valuesTablesList[$j][0]) . "` WHERE id = 'Pp'";
                            $res = $conn->query($sql);
                            $PpList[$j] = mysqli_fetch_all($res);
                        }
            ?>
                <div id="archive-sammuary-overlay" class="confirmation-overlay"></div>
                <div class="archive-sammuary fixed" id="archive-sammuary">
                    <h1>Résumé : <?php echo (str_replace('_', ' ', $_GET['process']) . ' (' . $_GET['archive'] . ')') ?></h1>
                    <div class="archive-sammuary-content fixed">
                        <table>
                            <thead>
                                <tr>
                                    <th></th>
                                    <?php for ($i = 1; $i < sizeof($sammuaryTrTh); $i++) { ?>
                                        <th><?php echo $sammuaryTrTh[$i]['label']  ?></th>
                                    <?php } ?>
                                </tr>
                                <tr>
                                    <th></th>
                                    <?php for ($i = 1; $i < sizeof($sammuaryTrTh); $i++) { ?>
                                        <th>(<?php echo (isset($valuesTablesList[$i][0]) ? substr($valuesTablesList[$i][0], -8, -3) : ' - ') ?>)</th>
                                    <?php } ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                for ($i = 0; $i < $archiveSammuaryData[0]['sampleSize']; $i++) {
                                ?>
                                    <tr>
                                        <td>X<sub><?php echo ($i + 1) ?></sub></td>
                                        <?php for ($c = 1; $c < sizeof($sammuaryTrTh); $c++) { ?>
                                            <td class='value-row-sammuary'><?php echo (isset($valuesList[$c][$i][0]) ? $valuesList[$c][$i][0] : ' - ') ?></td>
                                        <?php } ?>
                                    </tr>
                                <?php
                                }
                                ?>
                            </tbody>
                            <tfoot>
                                <tr id="Cp-row-sammuary">
                                    <td>C<sub>p</sub></td>
                                    <?php for ($c = 1; $c < sizeof($sammuaryTrTh); $c++) {
                                        if (isset($CpList[$c][0][0])) { ?>
                                            <td colspan="<?php echo $archiveSammuaryData[0]['samplesForCp'] ?>"><?php echo round($CpList[$c][0][0], 5, PHP_ROUND_HALF_UP) ?></td>
                                            <?php } else {
                                            if ($sammuaryTrTh[$c]['indicator'] == 'Cp') { ?>
                                                <td colspan="<?php echo $archiveSammuaryData[0]['samplesForCp'] ?>"> - </td>
                                    <?php }
                                        }
                                    } ?>
                                </tr>
                                <tr>
                                    <td>P<sub>p</sub></td>
                                    <?php for ($c = 1; $c < sizeof($sammuaryTrTh); $c++) {
                                        if (isset($PpList[$c][0][0])) { ?>
                                            <td colspan="<?php echo ($archiveSammuaryData[0]['SamplesPerDay'] - 1) ?>"><?php echo round($PpList[$c][0][0], 5, PHP_ROUND_HALF_UP) ?></td>
                                            <?php } else {
                                            if ($c == (sizeof($sammuaryTrTh) - 1)) { ?>
                                                <td colspan="<?php echo ($archiveSammuaryData[0]['SamplesPerDay'] - 1) ?>"> - </td>
                                    <?php }
                                        }
                                    } ?>
                                </tr>
                            </tfoot>
                        </table>
                        <div id="trigger"></div>
                    </div>
                </div>
            <?php
                    }

                    if (($archiveFollowUp == 'show') && !isset($_GET['of']) && !isset($_GET['history'])
                        && isset($_GET['archive']) && isset($_GET['process']) && !isset($_GET['archive-sammuary']) && !isset($_GET['archive-maps'])
                    ) {
                        $sql = 'SHOW TABLES LIKE "' . $_GET['process'] . '_capability_' . $_GET['archive'] . '-%"';
                        $res = $conn->query($sql);
                        $processDatesList = mysqli_fetch_all($res);

                        $indicators = [];

                        for ($i = 0; $i < sizeof($processDatesList); $i++) {
                            $tempTable = [];
                            $sql = "SELECT * From `" . $processDatesList[$i][0] . "` WHERE id='Cp' OR id='Cpk' OR id='Cpm' OR id='Pp' OR id='Ppk' OR id='Ppm'";
                            $res = $conn->query($sql);
                            array_push($tempTable, mysqli_fetch_all($res, MYSQLI_ASSOC));
                            $indicators[$processDatesList[$i][0]] = $tempTable;
                        }

                        foreach ($indicators as $key => $indicator) {
                            $containsPp = false;
                            $containsCp = false;

                            if (sizeof($indicator[0]) == 0) {
                                array_push($CpFollowUp, array("label" => substr($key, -19), 'y' => null));
                                array_push($CpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                                array_push($CpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                                array_push($PpFollowUp, array("label" => substr($key, -19), 'y' => null));
                                array_push($PpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                                array_push($PpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                            } else {
                                for ($i = 0; $i < sizeof($indicator[0]); $i++) {
                                    if ($indicator[0][$i]['id'] == 'Cp') {
                                        $containsCp = true;
                                        array_push($CpFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                    } elseif ($indicator[0][$i]['id'] == 'Pp') {
                                        $containsPp = true;
                                        array_push($PpFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                    } elseif ($indicator[0][$i]['id'] == 'Ppk') {
                                        $containsPp = true;
                                        array_push($PpkFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                    } elseif ($indicator[0][$i]['id'] == 'Cpk') {
                                        $containsCp = true;
                                        array_push($CpkFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                    } elseif ($indicator[0][$i]['id'] == 'Cpm') {
                                        $containsCp = true;
                                        array_push($CpmFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                    } elseif ($indicator[0][$i]['id'] == 'Ppm') {
                                        $containsPp = true;
                                        array_push($PpmFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                    }
                                }
                            }

                            if (!($containsCp)) {
                                array_push($CpFollowUp, array("label" => substr($key, -19), 'y' => null));
                                array_push($CpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                                array_push($CpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                            }

                            if (!($containsPp)) {
                                array_push($PpFollowUp, array("label" => substr($key, -19), 'y' => null));
                                array_push($PpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                                array_push($PpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                            }

                            foreach ($CpFollowUp as $Cp) {
                                if ($Cp['y'] != '') {
                                    $drawMap = true;
                                }
                            }

                            foreach ($PpFollowUp as $Pp) {
                                if ($Pp['y'] != '') {
                                    $drawMap = true;
                                }
                            }
                        }
            ?>
                <div id="follow-up-overlay" class="follow-up-overlay"></div>
                <div class="follow-up-chart-container" id="follow-up-chart-container" style=" height: 400px; width: 700px;">
                    <div id="followUp-chartContainer" style=" width: 100%;"></div>
                </div>
            <?php
                    }

                    if (($archiveMaps == 'show') && !isset($_GET['of']) && !isset($_GET['history'])
                        && isset($_GET['archive']) && isset($_GET['process']) && !isset($_GET['archive-sammuary']) && !isset($_GET['archive-follow-up'])
                    ) {
                        $allValuesHistory = [];
                        $coefTable = COEFTABLE;


                        $sql = "SHOW TABLES LIKE '" . str_replace('_date', '_values', lcfirst($_GET['process'] . "_date_" . $_GET['archive'] . "-%'"));
                        $res = $conn->query($sql);
                        $capabilityHistoryList = mysqli_fetch_all($res);

                        foreach ($capabilityHistoryList as $capabilityTable) {
                            $sql = "SELECT value FROM `" . str_replace('values', 'capability', $capabilityTable[0]) . "` WHERE id='purpose'";
                            $res = $conn->query($sql);
                            $allPurposeHistory[str_replace('values', 'capability', $capabilityTable[0])] = mysqli_fetch_all($res);
                        }

                        foreach ($capabilityHistoryList as $capabilityTable) {
                            if ($allPurposeHistory[str_replace('values', 'capability', $capabilityTable[0])][0][0] != 'normality') {
                                $sql = "SELECT value FROM `" . $capabilityTable[0] . "`";
                                $res = $conn->query($sql);
                                $allValuesHistory[] = mysqli_fetch_all($res, MYSQLI_ASSOC);
                            }
                        }

                        $drawControlMaps = sizeof($allValuesHistory) > 0 ? 'draw' : 'dont';

                        $processDetails = get_process_details($conn, define_parameter_table(), $_GET['process'], 0);
                        $TS = $processDetails[0]['TS'];
                        $TI = $processDetails[0]['TI'];
                        $cible = $processDetails[0]['Cible'];
                        $sampleSize = $processDetails[0]['sampleSize'];

                        $sampleE = [];
                        $sampleX = [];
                        $sampleStDev = [];

                        for ($i = 0; $i < sizeof($allValuesHistory); $i++) {
                            $sampleSum = 0;
                            $tempMax = 0;
                            $tempMin = $allValuesHistory[$i][0]['value'];
                            for ($j = 0; $j < ($sampleSize); $j++) {
                                $sampleSum += $allValuesHistory[$i][$j]['value'];
                                if ($allValuesHistory[$i][$j]['value'] > $tempMax) {
                                    $tempMax = $allValuesHistory[$i][$j]['value'];
                                }
                                if ($allValuesHistory[$i][$j]['value'] < $tempMin) {
                                    $tempMin = $allValuesHistory[$i][$j]['value'];
                                }
                            }
                            array_push($sampleE, $tempMax - $tempMin);
                            array_push($sampleX, $sampleSum / $sampleSize);
                            array_push($sampleStDev, st_dev($allValuesHistory[$i]));
                        }

                        $E = $sampleE ? array_sum($sampleE) / sizeof($sampleE) : intval(1);
                        $stDev = $sampleStDev ? array_sum($sampleStDev) / sizeof($sampleStDev) : intval(1);

                        $LSCx = round($cible + ($coefTable[$sampleSize]['A2'] * $E), 5, PHP_ROUND_HALF_UP);
                        $LICx = round($cible - ($coefTable[$sampleSize]['A2'] * $E), 5, PHP_ROUND_HALF_UP);
                        $LSCe = round(($coefTable[$sampleSize]['D4'] * $E), 5, PHP_ROUND_HALF_UP);
                        $LICe = round(($coefTable[$sampleSize]['D3'] * $E), 5, PHP_ROUND_HALF_UP);
                        $LSCstdev = round(($coefTable[$sampleSize]['B4'] * $stDev), 5, PHP_ROUND_HALF_UP);
                        $LICstdev = round(($coefTable[$sampleSize]['B3'] * $stDev), 5, PHP_ROUND_HALF_UP);

                        $XmapConclusion = analyse_Xmap($LSCx, $cible, $LICx, sizeof($sampleX) ? implode(' - ', $sampleX) : '0');
                        $stDevmapConclusion = analyse_Emap($LSCstdev, $stDev, $LICstdev, implode(' - ', $sampleStDev));
                        $EmapConclusion = analyse_Emap($LSCe, $E, $LICe, implode(' - ', $sampleE));

                        for ($i = 0; $i < sizeof($sampleX); $i++) {
                            array_push($controlMapArrayX, array("label" => "Échantillon N° " . ($i + 1), "y" => $sampleX[$i]));
                            array_push($LSCxArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LSCx));
                            array_push($LICxArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICx));
                            array_push($XArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $cible));
                            array_push($XmiddleThirdBottom, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICx + (($LSCx - $LICx) / 3)));
                            array_push($XmiddleThirdTop, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICx + ((($LSCx - $LICx) / 3) * 2)));
                        }

                        for ($i = 0; $i < sizeof($sampleE); $i++) {
                            array_push($controlMapArrayE, array("label" => "Échantillon N° " . ($i + 1), "y" => $sampleE[$i]));
                            array_push($LSCeArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LSCe));
                            array_push($LICeArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICe));
                            array_push($EmiddleThirdBottom, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICe + (($LSCe - $LICe) / 3)));
                            array_push($EmiddleThirdTop, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICe + ((($LSCe - $LICe) / 3) * 2)));
                        }

                        for ($i = 0; $i < sizeof($sampleStDev); $i++) {
                            array_push($controlMapArrayStDev, array("label" => "Échantillon N° " . ($i + 1), "y" => $sampleStDev[$i]));
                            array_push($LSCstdevArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LSCstdev));
                            array_push($LICstdevArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICstdev));
                            array_push($StDevmiddleThirdBottom, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICstdev + (($LSCstdev - $LICstdev) / 3)));
                            array_push($StDevmiddleThirdTop, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICstdev + ((($LSCstdev - $LICstdev) / 3) * 2)));
                        }
            ?>
                <div id="archive-maps-overlay" class="follow-up-overlay"></div>
                <div id="archive-control-maps-container" class="fixed">
                    <div class="title-container">
                        <i class="fa-solid fa-circle-left"></i>
                        <div class="title-grid">
                            <h3>Cartes de Contrôle <span style="font-size: 17px;">(X&#772;/S)</span></h3>
                            <h3>Cartes de Contrôle <span style="font-size: 17px;">(X&#772;/E)</span></h3>
                        </div>
                        <i class="fa-solid fa-circle-right"></i>
                    </div>
                    <div class="mean-control-map" style="height: 400px;">
                        <div id="X-map-chartContainer" style=" width: 100%;"></div>
                    </div>
                    <div class="dispertion-maps" id="dispertion-maps">
                        <div class="stdev-control-map" style="height: 400px; margin-top: 50px;">
                            <div id="stdev-map-chartContainer" style=" width: 100%;"></div>
                        </div>
                        <div class="range-control-map" style="height: 400px; margin-top: 50px;">
                            <div id="E-map-chartContainer" style=" width: 100%;"></div>
                        </div>
                    </div>
                    <?php if ($XmapConclusion || $EmapConclusion) { ?>
                        <div class="control-map-conclution">
                            <table>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th colspan="4">Interprétation des carte de contrôle</th>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <th>Observation</th>
                                        <th>Description</th>
                                        <th>Décision</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if ($XmapConclusion) { ?>
                                        <tr id="x-map-conclusion-tr">
                                            <td>Carte des moyennes <span>(X&#772;&#772)</span></td>
                                            <td><?php echo $XmapConclusion[0] ?></td>
                                            <td><?php echo $XmapConclusion[1] ?></td>
                                            <td><?php echo $XmapConclusion[2] ?></td>
                                        </tr>
                                    <?php }
                                    if ($stDevmapConclusion) { ?>
                                        <tr id="s-map-conclusion-tr">
                                            <td>Carte des écart-types <span>(S&#772;)</span></td>
                                            <td><?php echo $stDevmapConclusion[0] ?></td>
                                            <td><?php echo $stDevmapConclusion[1] ?></td>
                                            <td><?php echo $stDevmapConclusion[2] ?></td>
                                        </tr>
                                    <?php }
                                    if ($EmapConclusion) { ?>
                                        <tr id="e-map-conclusion-tr">
                                            <td>Carte des étendues <span>(E&#772;)</span></td>
                                            <td><?php echo $EmapConclusion[0] ?></td>
                                            <td><?php echo $EmapConclusion[1] ?></td>
                                            <td><?php echo $EmapConclusion[2] ?></td>
                                        </tr>
                                    <?php }
                                    ?>
                                </tbody>
                            </table>
                            <p id="remarque"><i>*En cas de réglage : un nouvel échantillon est mesuré et une deuxième étude doit être faite. Pour être acceptable, le point doit se situer dans le tiers central de la carte des moyennes X&#772;&#772.</i></p>
                        </div>
                </div>
        <?php }
                    }
                }

                if ($followUp != '') {
                    $sql = 'SHOW TABLES LIKE "' . $followUp . '_capability_%"';
                    $res = $conn->query($sql);
                    $processDatesListTemp = mysqli_fetch_all($res);

                    $processDatesList = [];


                    foreach ($processDatesListTemp as $Temp) {
                        array_push($processDatesList, array(
                            'Date' => explode('/', (substr($Temp[0], -19, -9)))[2] . '-' . explode('/', (substr($Temp[0], -19, -9)))[1] . '-' . explode('/', (substr($Temp[0], -19, -9)))[0],
                            'Name' => $Temp[0]
                        ));
                    }

                    usort($processDatesList, 'followup_date_compare');

                    $indicators = [];

                    for ($i = 0; $i < sizeof($processDatesList); $i++) {
                        $tempTable = [];
                        $sql = "SELECT * From `" . $processDatesList[$i]['Name'] . "` WHERE id='Cp' OR id='Cpk' OR id='Cpm' OR id='Pp' OR id='Ppk' OR id='Ppm'";
                        $res = $conn->query($sql);
                        array_push($tempTable, mysqli_fetch_all($res, MYSQLI_ASSOC));
                        $indicators[$processDatesList[$i]['Name']] = $tempTable;
                    }

                    foreach ($indicators as $key => $indicator) {
                        $containsPp = false;
                        $containsCp = false;

                        if (sizeof($indicator[0]) == 0) {
                            array_push($CpFollowUp, array("label" => substr($key, -19), 'y' => null));
                            array_push($CpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                            array_push($CpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                            array_push($PpFollowUp, array("label" => substr($key, -19), 'y' => null));
                            array_push($PpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                            array_push($PpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                        } else {
                            for ($i = 0; $i < sizeof($indicator[0]); $i++) {
                                if ($indicator[0][$i]['id'] == 'Cp') {
                                    $containsCp = true;
                                    array_push($CpFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                } elseif ($indicator[0][$i]['id'] == 'Pp') {
                                    $containsPp = true;
                                    array_push($PpFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                } elseif ($indicator[0][$i]['id'] == 'Ppk') {
                                    $containsPp = true;
                                    array_push($PpkFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                } elseif ($indicator[0][$i]['id'] == 'Cpk') {
                                    $containsCp = true;
                                    array_push($CpkFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                } elseif ($indicator[0][$i]['id'] == 'Cpm') {
                                    $containsCp = true;
                                    array_push($CpmFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                } elseif ($indicator[0][$i]['id'] == 'Ppm') {
                                    $containsPp = true;
                                    array_push($PpmFollowUp, array("label" => substr($key, -19), "y" => $indicator[0][$i]['value']));
                                }
                            }
                        }

                        if (!($containsCp)) {
                            array_push($CpFollowUp, array("label" => substr($key, -19), 'y' => null));
                            array_push($CpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                            array_push($CpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                        }

                        if (!($containsPp)) {
                            array_push($PpFollowUp, array("label" => substr($key, -19), 'y' => null));
                            array_push($PpkFollowUp, array("label" => substr($key, -19), 'y' => null));
                            array_push($PpmFollowUp, array("label" => substr($key, -19), 'y' => null));
                        }

                        foreach ($CpFollowUp as $Cp) {
                            if ($Cp['y'] != '') {
                                $drawMap = true;
                            }
                        }

                        foreach ($PpFollowUp as $Pp) {
                            if ($Pp['y'] != '') {
                                $drawMap = true;
                            }
                        }
                    }
        ?>
        <div id="follow-up-overlay" class="follow-up-overlay"></div>
        <div class="follow-up-chart-container" id="follow-up-chart-container" style=" height: 400px; width: 700px;">
            <div id="followUp-chartContainer" style=" width: 100%;"></div>
        </div>
    <?php
                }
    ?>
        </div>

        <?php

        $samplesSize = isset($_GET['samples-size']) ? intval($_GET['samples-size']) : 0;
        $firstSampleSize = isset($_GET['first-sample-size']) ? intval($_GET['first-sample-size']) : 0;
        $processName = isset($_GET['process-name']) ? ($_GET['process-name']) : "";
        $processDetailsTab = isset($_GET['details']) ? $_GET['details'] : '';
        $processPlanningTab = isset($_GET['planning']) ? $_GET['planning'] : '';
        $nameVars = isset($_GET['vars-name']) ? $_GET['vars-name'] : "";
        $nbrVarsEch =  isset(($_GET['vars-nbr'])) ? $_GET['vars-nbr'] : 0;
        $echVars =  isset(($_GET['vars-ech'])) ? $_GET['vars-ech'] : 0;
        $outputRead = isset($_GET['output-read']) ? $_GET['output-read'] : "";
        $upload = isset($_GET['upload']) ? $_GET['upload'] : "";
        $nrmlRisk = isset($_GET['nrml-risk']) ? $_GET['nrml-risk'] : "";
        $addTo = isset($_GET['add-to']) ? $_GET['add-to'] : "";
        $addMethod = isset($_GET['add-method']) ? $_GET['add-method'] : "";
        $importance = isset($_GET['importance']) ? $_GET['importance'] : "new";

        $nameVars = str_ireplace(array('output', '\'', '"', ',', ';', '<', '>', '!', '[', '#', '$', '%', '&', '(', ')', '*', '+', '?', '-', '.', '/', ':', '@', '=', '\\', ']', '{', '|', '}', '~'), '', $nameVars);
        $nameVars = str_replace(explode(",", "ç,æ,œ,á,é,í,ó,ú,à,è,ì,ò,ù,ä,ë,ï,ö,ü,ÿ,â,ê,î,ô,û,å,e,i,ø,u"), explode(",", "c,ae,oe,a,e,i,o,u,a,e,i,o,u,a,e,i,o,u,y,a,e,i,o,u,a,e,i,o,u"), $nameVars);
        $nameVars = str_replace(' ', '_', $nameVars);

        $nbrVars = $echVars * $nbrVarsEch;

        if (($processName) && ($firstSampleSize > 29) && (isset($_GET['risque'])) && ($samplesSize < 26)) {
            $nameVarsExists = false;
            foreach ($processList as $process) {
                if ($process['id'] == str_replace(' ', '_', $processName)) {
                    $nameVarsExists = true;
                }
            }
            if (($nameVarsExists) && ($importance == 'new')) {
                echo ('<script type="text/javascript">
                            document.getElementById("table-error").classList.remove("success");
                            document.getElementById("table-error").classList.add("error");
                            document.getElementById("table-error").innerHTML = "ERREUR : Ce processus a été déja ajouté ! Veuillez choisir un autre nom ou ajouter vos mesures dans le processus existant.";
                        </script>');
            } else {
                if (is_numeric($processName[0])) {
                    echo ('<script type="text/javascript">
                            document.getElementById("table-error").classList.remove("success");
                            document.getElementById("table-error").classList.add("error");
                            document.getElementById("table-error").innerHTML = "ERREUR : Le nom du processus doit commencer par une lettre.";
                        </script>');
                } elseif ((strpos(strtolower($processName), 'values') !== false)
                    || (strpos(strtolower($processName), 'capability') !== false)
                    || (strpos(strtolower($processName), 'khitest') !== false)
                    || (strpos(str_replace(' ', '_', strtolower($processName)), define_parameter_table()) !== false)
                ) {
                    echo ('<script type="text/javascript">
                            document.getElementById("table-error").classList.remove("success");
                            document.getElementById("table-error").classList.add("error");
                            document.getElementById("table-error").innerHTML = "ERREUR : Les mots : ' . "'Capability'" . ', ' . "'Values'" . ', ' . "'Khitest'" . ', ' . "'Process List'" . ' et ' . "'Process_list'" . ' sont réservés au système.";
                        </script>');
                } else {
                    echo '<script type="text/javascript">
                        document.getElementById("table-error").classList.remove("remove");
                        document.getElementById("table-error").classList.add("success");
                        document.getElementById("table-error").innerHTML = "SUCCÈS : Nom de processus valide. Veuillez fournir les mesures.";
                    </script>';

                    echo '<script type="text/javascript">
                            document.getElementById("existing-tables").style.display = "none";
                        </script>';

                    echo '<script type="text/javascript">
                            document.getElementById("dashboard").innerHTML += `<a href="./">Tableau de Bord</a>`;
                            document.getElementById("dashboard").classList.add("visible");
                        </script>';

                    echo '<script type="text/javascript">
                                document.getElementById("process-name").disabled = true;
                                document.getElementById("first-sample-size").disabled = true;
                                document.getElementById("risque").disabled = true;
                            </script>';
        ?>
                    <div class="new-process-form" id="new-process-form">
                        <form action="./assets/php/db/save-process.php" method="POST">
                            <input value="<?php echo $firstSampleSize ?>" id="first-sample-size-review" type="hidden" name="first-sample-size-review" required>
                            <input type="hidden" value="" name="samples-per-day" id="samples-per-day" required>
                            <input type="hidden" value="<?php echo ($_GET['risque']) ?>" name="alpha" id="alpha" required>
                            <input value="<?php echo $processName ?>" id="process-name-review" type="hidden" name="process-name-review" required>
                            <div class="process-form">
                                <div class="new-process-section">
                                    <h1 class="new-process-section-title">Procédé</h1>
                                    <label for="starting-time">
                                        Temps de démarrage :
                                        <div class="starting-time-div">
                                            <input id="starting-time" type="time" name="starting-time" required placeholder="Temps de démarrage">
                                        </div>
                                    </label>
                                    <label for="ending-time">
                                        Temps d'arrêt :
                                        <div class="ending-time-div">
                                            <input id="ending-time" type="time" name="ending-time" required placeholder="Temps de démarrage">
                                        </div>
                                    </label>
                                    <label for="process-cadence">
                                        Cadence de la production :
                                        <div class="process-cadence-div">
                                            <input id="process-cadence" type="number" name="process-cadence" min="1" step="1" required placeholder="Nombre de secondes">
                                        </div>
                                    </label>
                                </div>
                                <div class="new-process-section">
                                    <h1 class="new-process-section-title">Échantillonnage</h1>
                                    <label for="sample-size-review">
                                        Nombre de pièces par échantillon <span>(n)</span> :
                                        <input value="" id="sample-size-review" type="number" name="sample-size-review" min="2" max="25" required placeholder="Nombre de pièces : n ∈ [2 ; 25]" step="1">
                                    </label>
                                    <label for="measuring-time">
                                        Temps de mesure :
                                        <div class="measuring-time-div">
                                            <input id="measuring-time" type="number" name="measuring-time" min="1" step="1" required placeholder="Temps de mesure en secondes">
                                        </div>
                                    </label>
                                    <label for="sampeling-cadence">
                                        Fréquence de prélèvement :
                                        <div class="sampeling-cadence-div">
                                            1/
                                            <input id="sampeling-cadence" type="number" name="sampeling-cadence" min="0.25" max="24" step="0.25" required placeholder="Nombre d'heures">
                                        </div>
                                    </label>
                                </div>
                                <div class="new-process-section">
                                    <h1 class="new-process-section-title">Capabilité</h1>
                                    <label id="ts-process" for="max-value-accepted-process">La valeur maximale acceptée <span>(TS)</span> :
                                        <input class="value-confirm" id="max-value-accepted-process" name="max-value-accepted-process" type="number" step="0.00001" required placeholder="TS">
                                    </label>
                                    <br>
                                    <label id="x-process" for="cible-process">La valeur <span>cible</span> :
                                        <input class="value-confirm" id="cible-process" name="cible-process" type="number" step="0.00001" required placeholder="Cible">
                                    </label>
                                    <br>
                                    <label id="ti-process" for="min-value-accepted-process">La valeur minimale acceptée <span>(TI)</span> :
                                        <input class="value-confirm" id="min-value-accepted-process" name="min-value-accepted-process" type="number" step="0.00001" required placeholder="TI">
                                    </label>
                                    <label for="cp-cadence">
                                        Calcul de <span>C<sub>p</sub></span> :
                                        <div class="cp-cadence-div">
                                            1/
                                            <input id="cp-cadence" type="number" name="cp-cadence" min="1" step="1" required placeholder="Nombre d'échantillons">
                                        </div>
                                    </label>

                                </div>
                                <div id="sampeling-planning" class="new-process-section">
                                    <h1 class="new-process-section-title">Planning d'échantillonnage</h1>
                                    <div id="sampeling-planning-chart" style="height: 300px; position: relative;">
                                        <div class="loading-container">
                                            <div class="lds-ring">
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                            </div>
                                            <div class="lds-txt">
                                                <h3>Veuillez renseigner les informations demandées pour visualiser le planning d'échantillonnage...</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <input type="submit" value="confirmer">
                        </form>
                    </div>

            <?php
                }
            }
        }

        if (($addTo != "")) {
            if ($addMethod == 'manual-add') {
                $tableParameter = get_process_details($conn, define_parameter_table(), $addTo, 0);

                $sql = 'SHOW TABLES LIKE "' .  str_replace(' ', '_', $addTo) . '_values_' . substr($thisInstant, 0, -8) . '%"';
                $res = $conn->query($sql);
                $processValeus = mysqli_fetch_all($res);

                $string = '<script type="text/javascript">';
                if (sizeof($processValeus) == 0) {
                    $string .= 'window.location = "./?vars-name=' . $addTo . '&vars-ech=1&vars-nbr=' . $tableParameter[0]['normalitySample'] . '&importance=urgent"';
                } else {
                    $string .= 'window.location = "./?vars-name=' . $addTo . '&vars-ech=1&vars-nbr=' . $tableParameter[0]['sampleSize'] . '&importance=urgent"';
                }
                $string .= '</script>';

                echo $string;
            }
        }

        if ($processPlanningTab != '') {
            $ProcessPlanningTabInfo = get_process_details($conn, define_parameter_table(), $processPlanningTab, 0);

            $startHour = intval(explode(':', $ProcessPlanningTabInfo[0]['startTime'])[0]);
            $startMinute = intval(explode(':', $ProcessPlanningTabInfo[0]['startTime'])[1]);
            $endHour = intval(explode(':', $ProcessPlanningTabInfo[0]['endTime'])[0]);
            $endMinute = intval(explode(':', $ProcessPlanningTabInfo[0]['endTime'])[1]);
            $startSecond = 0;

            $measureTime = intval($ProcessPlanningTabInfo[0]['measureTime']);
            $prodCadence = intval($ProcessPlanningTabInfo[0]['prodCadence']);

            $CpCounter = 1;

            if ($endHour < $startHour) {
                $endHour += 24;
            }
            if (($endHour == $startHour) && ($endMinute <= $startMinute)) {
                $endHour += 24;
            }

            if ($measureTime <= $prodCadence) {
                $startSecond += $measureTime;
                $adding = $prodCadence;
            } else {
                $startSecond += $prodCadence;
                $adding = $measureTime;
            }

            for ($i = 0; $i < intval($ProcessPlanningTabInfo[0]['normalitySample']); $i++) {
                $startSecond += $adding;

                while ($startSecond >= 60) {
                    $startMinute += 1;
                    $startSecond -= 60;

                    while ($startMinute >= 60) {
                        $startHour += 1;
                        $startMinute -= 60;
                    }
                }
            }

            if ($startHour < 10) {
                $startHourLabel = '0' . $startHour;
            } else {
                $startHourLabel = $startHour;
            }
            if ($startMinute < 10) {
                $startMinuteLabel = '0' . $startMinute;
            } else {
                $startMinuteLabel = $startMinute;
            }

            array_push($dataPointsArray, array("y" => intval($ProcessPlanningTabInfo[0]['normalitySample']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => 'khi'));

            while (($startHour < $endHour) || (($startHour == $endHour) && ($startMinute < $endMinute))) {
                $startMinute += (60 * floatval($ProcessPlanningTabInfo[0]['sampelingCadence']));
                while ($startMinute >= 60) {
                    $startHour += 1;
                    $startMinute -= 60;
                }

                if ($startHour < 10) {
                    $startHourLabel = '0' . $startHour;
                } else {
                    $startHourLabel = $startHour;
                }
                if ($startMinute < 10) {
                    $startMinuteLabel = '0' . $startMinute;
                } else {
                    $startMinuteLabel = $startMinute;
                }

                if (($startHour < $endHour) || (($startHour == $endHour) && ($startMinute < $endMinute))) {
                    if (($CpCounter % $ProcessPlanningTabInfo[0]['samplesForCp']) == 0) {
                        array_push($dataPointsArray, array("y" => intval($ProcessPlanningTabInfo[0]['sampleSize']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => 'Cp'));
                    } else {
                        array_push($dataPointsArray, array("y" => intval($ProcessPlanningTabInfo[0]['sampleSize']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => ''));
                    }
                }

                $CpCounter += 1;
            }

            $dataPointsArray[sizeof($dataPointsArray) - 1]['indicator'] .= 'Pp';

            ?>
            <div id="process-planning-overlay" class="confirmation-overlay"></div>
            <div class="process-planning" id="process-planning">
                <div id="planning-chartContainer" style=" width: 100%; height: 100%"></div>
            </div>
        <?php
        }

        if ($processDetailsTab != '') {
            $ProcessDetailsTabInfo = get_process_details($conn, define_parameter_table(), $processDetailsTab, 0);
        ?>
            <div id="process-details-overlay" class="confirmation-overlay"></div>
            <div class="process-details" id="process-details">
                <h1>Détails : <?php echo str_replace('_', ' ', $processDetailsTab) ?></h1>
                <div class="process-details-grid">
                    <div class="process-sammuary">
                        <table>
                            <thead>
                                <tr>
                                    <th colspan="2">Procédé</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Nom du procédé</td>
                                    <td><?php echo str_replace('_', ' ', $processDetailsTab) ?></td>
                                </tr>
                                <tr>
                                    <td>Temps de démarrage</td>
                                    <td><?php echo $ProcessDetailsTabInfo[0]['startTime']  ?></td>
                                </tr>
                                <tr>
                                    <td>Temps d'arrêt</td>
                                    <td><?php echo $ProcessDetailsTabInfo[0]['endTime']  ?></td>
                                </tr>
                                <tr>
                                    <td>Cadence de la production</td>
                                    <td><?php echo $ProcessDetailsTabInfo[0]['prodCadence']  ?></td>
                                </tr>
                                <tr>
                                    <td>Risque <span>(α<sub> %</sub>)</span></td>
                                    <td><?php echo $ProcessDetailsTabInfo[0]['Alpha']  ?>%</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="process-sammuary">
                        <table>
                            <thead>
                                <tr>
                                    <th colspan="2">Échantillonnage</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Nombre d'échantillons par jour</td>
                                    <td><?php echo $ProcessDetailsTabInfo[0]['SamplesPerDay'] ?></td>
                                </tr>
                                <tr>
                                    <td>Taille du premier échantillon</td>
                                    <td><?php echo $ProcessDetailsTabInfo[0]['normalitySample'] ?></td>
                                </tr>
                                <tr>
                                    <td>Nombre de pièces par échantillon <span>(n)</span></td>
                                    <td><?php echo $ProcessDetailsTabInfo[0]['sampleSize']  ?></td>
                                </tr>
                                <tr>
                                    <td>Temps de mesure</td>
                                    <td><?php echo $ProcessDetailsTabInfo[0]['measureTime'] ?> secondes/pièce</td>
                                </tr>
                                <tr>
                                    <td>Fréquence de prélèvement </td>
                                    <td><?php echo (1 / $ProcessDetailsTabInfo[0]['sampelingCadence']) ?> Échantillons/heure</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="process-sammuary">
                        <table>
                            <thead>
                                <tr>
                                    <th colspan="2">Capabilité</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>La valeur maximale acceptée <span>(TS)</span></td>
                                    <td><?php echo $ProcessDetailsTabInfo[0]['TS'] ?></td>
                                </tr>
                                <tr>
                                    <td>La valeur cible </td>
                                    <td><?php echo $ProcessDetailsTabInfo[0]['Cible'] ?></td>
                                </tr>
                                <tr>
                                    <td>La valeur minimale acceptée <span>(TI)</span></td>
                                    <td><?php echo $ProcessDetailsTabInfo[0]['TI']  ?></td>
                                </tr>
                                <tr>
                                    <td>Calcul de <span>C<sub>p</sub></span></td>
                                    <td>Chaque <?php echo $ProcessDetailsTabInfo[0]['samplesForCp'] ?> Échantillons</td>
                                </tr>
                                <tr>
                                    <td>Test de normalité <span>(χ²)</span> </td>
                                    <td><?php echo ('Chaque ' . ($ProcessDetailsTabInfo[0]['SamplesPerDay'] - 1)) ?> Échantillons</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <?php
        }

        if (($nameVars != "") && ($upload == "")) {
            echo '<script type="text/javascript">
                                document.getElementById("table-error").classList.remove("remove");
                                document.getElementById("table-error").classList.add("success");
                                document.getElementById("table-error").innerHTML = "SUCCÈS : Processus trouvé. Veuillez fournir les mesures.";
                                document.getElementById("process-name").disabled = true;
                                document.getElementById("first-sample-size").disabled = true;
                                document.getElementById("risque").disabled = true;
                            </script>';


            echo '<script type="text/javascript">
                                    document.getElementById("existing-tables").style.display = "none";
                                </script>';

            echo '<div class="vars-values" id="vars-values-form">
                                <form action="./assets/php/db/save-values.php" method="POST">
                                <input type="hidden" value = "' . $nbrVars . '" name="nbrvars" id="nbrvars">
                                <input type="hidden" value = "' . $nameVars . '" name="namevars" id="namevars">
                                <input type="hidden" value = "' . $echVars . '" name="echvars" id="echvars">
                                <input type="hidden" value = "' . $nbrVarsEch . '" name="nbrvarsech" id="nbrvarsech">    
                                <div id="measurement" class ="measurement">';

            for ($i = 0; $i < $echVars; $i++) {
                echo '<div class="sample-container">
                            <h2 class="sample-number">Échantillon <span>N°' . ($i + 1) . '</span></h2>
                            <div class="sample-values-container">
                                    ';
                for ($j = 0; $j < $nbrVarsEch; $j++) {
                    echo '<label for="vars-value-' . ($i + 1) . '-' . ($j + 1) . '">La valeur de la mesure n° <span>' . ($j + 1) . '</span> : 
                                        <input class="value" id="vars-value-' . ($i + 1) . '-' . ($j + 1) . '" name="vars-value-' . ($i + 1) . '-' . ($j + 1) . '" value="' . round(9.95 + mt_rand() / mt_getrandmax() * (10.05 - (9.95)), 3, PHP_ROUND_HALF_UP) . '" type="number" step="0.00001" required> 
                                    </label>';
                }
                echo '</div>
                            </div>';
            }

            echo '  </div>
                                <div class="measurement-confirmation" id="measurement-confirmation">
                                    <button class="next" id="confirm-measurement">Confirmer</button>
                                </div>
                            </form>
                        </div>';

            echo '<script type="text/javascript">
                                document.getElementById("dashboard").innerHTML += `<a href="./">Tableau de Bord</a>`;
                                document.getElementById("dashboard").classList.add("visible");
                            </script>';
        }

        if (($outputRead != '')) {

            $normality = get_solution($conn, str_replace('_date', '_khitest', $outputRead));
            $initialValues = get_solution($conn, str_replace('_date', '_values', $outputRead));
            $capability = get_solution($conn, str_replace('_date', '_capability', $outputRead));
            $initialValuesArray = [];
            $indicatorsArray = [];
            $processDetails = get_process_details($conn, define_parameter_table(), str_replace('_date', '_values', $outputRead), 27);
            $TS = $processDetails[0]['TS'];
            $TI = $processDetails[0]['TI'];
            $Cible = $processDetails[0]['Cible'];
            $sampleNbr = 1;

            $sql = 'SHOW TABLES LIKE "' .  str_replace('_date', '_values', substr($outputRead, 0, -8)) . '%"';
            $res = $conn->query($sql);
            $processValeusHistory = mysqli_fetch_all($res);

            $sampleSize = (str_replace('_date', '_values', $outputRead) == $processValeusHistory[0][0]) ? $processDetails[0]['normalitySample'] : $processDetails[0]['sampleSize'];
            $sampleOrder = 0;

            for ($i = 0; $i < sizeof($processValeusHistory); $i++) {
                if (str_replace('_date', '_values', $outputRead) == $processValeusHistory[$i][0]) {
                    $sampleOrder = $i;
                }
            }

            foreach ($capability as $capabilityValue) {
                if ($capabilityValue['id'] == 'Khi2-measured') {
                    $KhiMeasured = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'Khi2-theoretical') {
                    $KhiTheoretical = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'LSCx') {
                    $LSCx = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'LICx') {
                    $LICx = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'LSCe') {
                    $LSCe = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'LICe') {
                    $LICe = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'Mean of means') {
                    $X = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'Mean of ranges') {
                    $E = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'Means') {
                    $means = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'Ranges') {
                    $ranges = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'khi-probability') {
                    $alpha = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'stDev') {
                    $stDev = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'S') {
                    $S = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'purpose') {
                    $purpose = $capabilityValue['value'];
                }
                if ($capabilityValue['id'] == 'normality') {
                    $khiResult = $capabilityValue['value'];
                }
                if (($capabilityValue['id'] == 'Cp') ||
                    ($capabilityValue['id'] == 'Cpk') ||
                    ($capabilityValue['id'] == 'Cpm') ||
                    ($capabilityValue['id'] == 'Pp') ||
                    ($capabilityValue['id'] == 'Ppk') ||
                    ($capabilityValue['id'] == 'Ppm') ||
                    ($capabilityValue['id'] == 'Rs') ||
                    ($capabilityValue['id'] == 'Rr') ||
                    ($capabilityValue['id'] == 'Zéquivalent') ||
                    ($capabilityValue['id'] == 'Zprocessus')
                ) {
                    array_push($indicatorsArray, array($capabilityValue['id'], $capabilityValue['value']));
                }
            }

            for ($i = 0; $i < $sampleNbr; $i++) {
                for ($j = 0; $j < $sampleSize; $j++) {
                    foreach ($initialValues as $initialValue) {
                        if ($initialValue['id'] == ($i + 1) . ':' . ($j + 1)) {
                            array_push($initialValuesArray, $initialValue['value']);
                        }
                    }
                }
            }

            echo ('<script type="text/javascript">
                        document.getElementById("backword").innerHTML += `<a href="./?archive=' . (substr($outputRead, -19, -9)) . '&process=' . lcfirst(substr($outputRead, 0, -25)) . '&khi=' . (check_normality($conn, substr($outputRead, 0, -25), substr($outputRead, -19, -9))) . '">Retour</a>`;
                        document.getElementById("backword").classList.add("visible");
                    </script>');

            echo ('<script type="text/javascript">
                        document.getElementById("dashboard").innerHTML += `<a href="./">Tableau de Bord</a>`;
                        document.getElementById("dashboard").classList.add("visible");
                    </script>');


            echo '<script type="text/javascript">
                        document.getElementById("existing-tables").style.display = "none";
                    </script>';
        ?>
            <div class="solution" id="solution">
                <div class="summuary">
                    <div class="info">
                        <p class="solution-name">Nom et date du processus : <span><?php echo str_replace('date', '</span> | <span>', str_replace('-', '</span> à <span>', str_replace('_', ' ', $outputRead))) ?></span></p>
                        <p class="solution-name">Nombre de l'échantillons : <span><?php echo ($sampleOrder + 1) ?></span>
                        </p>
                        <p class="solution-name">Nombre de pièces <span>(n)</span> : <span><?php echo $sampleSize ?></span>
                        </p>
                    </div>
                    <div class="IT">
                        <p class="solution-name">Tolérance supérieure <span>(TS)</span> : <span><?php echo $TS ?></span>
                        </p>
                        <p class="solution-name">Cible : <span><?php echo $Cible ?></span>
                        </p>
                        <p class="solution-name">Tolérance inférieure <span>(TI)</span> : <span><?php echo $TI ?></span>
                        </p>
                    </div>
                    <div class="download drop">
                        <a id="drop-db" class="delete-btn"><i class="fa-solid fa-trash"></i> Supprimer</a>
                        <a class="download-btn-excel" href="./assets/php/query/download.php/?download=<?php echo $outputRead ?>"><i class="fa-solid fa-file-excel"></i> Exporter (Excel)</a>
                    </div>
                </div>
                <div class="data">
                    <h3>Données</h3>
                    <table class="initial-values">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th>Moyenne <span>(X&#772)</span></th>
                                <th>Étendue <span>(E)</span></th>
                                <th>Écart-Type <span>(S)</span></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php for ($i = 0; $i < $sampleNbr; $i++) { ?>
                                <tr class="sample">
                                    <td class="sample-nbr">
                                        <p><?php echo 'Échantillon N° ' . ($sampleOrder + 1) ?></p>
                                    </td>
                                    <td>
                                        <div class="sample-values"><?php for ($j = 0; $j < $sampleSize; $j++) {
                                                                        foreach ($initialValues as $initialValue) {
                                                                            if ($initialValue['id'] == ($i + 1) . ':' . ($j + 1)) { ?>
                                                        <p class="initial-value"><?php echo $initialValue['value'] ?></p>
                                            <?php
                                                                            }
                                                                        }
                                                                    } ?>
                                        </div>
                                    </td>
                                    <td><?php echo round(explode(" - ", $means)[$i], 5, PHP_ROUND_HALF_UP) ?></td>
                                    <td><?php echo round(explode(" - ", $ranges)[$i], 5, PHP_ROUND_HALF_UP) ?></td>
                                    <td><?php echo round(explode(" - ", $stDev)[$i], 5, PHP_ROUND_HALF_UP) ?></td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
                <?php if ($purpose == 'normality') {
                    $conclusion = ($KhiMeasured < $KhiTheoretical) ? "χ²<sub>pratique</sub> (" . round($KhiMeasured, 5, PHP_ROUND_HALF_UP) . ") < χ²<sub>théorique</sub> (" . round($KhiTheoretical, 5, PHP_ROUND_HALF_UP) . ") &#8594; Le procédé suit une loi normale." : "χ²<sub>pratique</sub> (" . round($KhiMeasured, 5, PHP_ROUND_HALF_UP) . ") > χ²<sub>théorique</sub> (" . round($KhiTheoretical, 5, PHP_ROUND_HALF_UP) . ") &#8594; Le procédé ne suit pas une loi normale (avec une probabilité d'erreur inférieure à " . $alpha . "%)."; ?>
                    <div class="khi-test" id="khi-test">
                        <h3>Test de Normalité (χ²)</h3>
                        <table class="calculated-values">
                            <thead>
                                <tr>
                                    <th>Classes</th>
                                    <th>Min</th>
                                    <th>Max</th>
                                    <th>Centre <span>(X<sub>i</sub>)</span></th>
                                    <th>N<sub>i</sub></th>
                                    <th>N<sub>i</sub>.X<sub>i</sub></th>
                                    <th>N<sub>i</sub>.(X<sub>i</sub>-X)<sup>2</sup></th>
                                    <th>Z<sub>max</sub></th>
                                    <th>P<sub>i</sub></th>
                                    <th>N.P<sub>i</sub></th>
                                    <th>|N<sub>i</sub>-N.P<sub>i</sub>|</th>
                                    <th>(N<sub>i</sub>-N.P<sub>i</sub>)<sup>2</sup></th>
                                    <th>
                                        <p>(N<sub>i</sub>-N.P<sub>i</sub>)<sup>2</sup></p>
                                        <p>N.P<sub>i</sub></p>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                foreach ($normality as $normal) {
                                ?>
                                    <tr>
                                        <td><?php echo $normal['Intervalle']; ?></td>
                                        <td><?php echo $normal['Min']; ?></td>
                                        <td><?php echo $normal['Max']; ?></td>
                                        <td><?php echo $normal['Centre']; ?></td>
                                        <td><?php echo $normal['Ni']; ?></td>
                                        <td><?php echo $normal['NiXi']; ?></td>
                                        <td><?php echo $normal['NiXi_XSQR']; ?></td>
                                        <td><?php echo $normal['Zmax']; ?></td>
                                        <td><?php echo $normal['P']; ?></td>
                                        <td><?php echo $normal['Npi']; ?></td>
                                        <td><?php echo $normal['Ni_Npi']; ?></td>
                                        <td><?php echo $normal['Ni_NpiSQR']; ?></td>
                                        <td><?php echo $normal['Ni_NpiSQRNpi']; ?></td>
                                    </tr>
                                <?php
                                }
                                ?>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>Somme</td>
                                    <td><?php echo round($KhiMeasured, 5, PHP_ROUND_HALF_UP) ?></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        <br>
                        <br>
                        <div class="khi-conclusion" style="height: 400px;">
                            <div id="N-chartContainer" style="width: 100%;">
                                <?php
                                foreach ($normality as $normal) {
                                    array_push($chartArrayN, array("label" => str_replace(' ', '', $normal['Intervalle']), "y" => floatval($normal['Ni'])));
                                }
                                ?>
                            </div>
                            <div id="khi-conclusion">
                                <table>
                                    <thead>
                                        <tr>
                                            <th colspan="2">Résultat du test</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <p>χ²<sub>pratique</sub>
                                            </td>
                                            <td><?php echo round($KhiMeasured, 5, PHP_ROUND_HALF_UP) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Degrés de liberté <span>(ν)</span></td>
                                            <td><?php echo sizeof($normality) - 3 ?></td>
                                        </tr>
                                        <tr>
                                            <td>Risque <span>(α)</span></td>
                                            <td>
                                                <div class="nrml-risk-container">
                                                    <input type="number" name="nrml-risk" max="99.9" step="0.1" min="0.1" id="nrml-risk" value="<?php echo $alpha ?>">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>χ²<sub>théorique</sub></td>
                                            <td><?php echo round($KhiTheoretical, 5, PHP_ROUND_HALF_UP) ?></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" id="last-khi-conclusion"><?php echo $conclusion ?></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                <?php } else  if ($indicatorsArray) { ?>
                        <div id="capability" class="capability">
                            <h3>Indicateurs de Capabilité</h3>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Indicateur</th>
                                        <th>Valeur</th>
                                        <?php if (conclude_indicators($capability) != '') { ?>
                                            <th>Interprétation</th>
                                        <?php } ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php for ($i = 0; $i < sizeof($indicatorsArray); $i++) {
                                        if ($i == 0) { ?>
                                            <tr>
                                                <td><?php echo (str_replace($indicatorsArray[$i][0][0], $indicatorsArray[$i][0][0] . '<sub>', $indicatorsArray[$i][0]) . '</sub>') ?></td>
                                                <td><?php echo round($indicatorsArray[$i][1], 5, PHP_ROUND_HALF_UP) ?></td>
                                                <?php if (conclude_indicators($capability) != '') { ?>
                                                    <td style="text-align: start; padding: 10px 25px; border-right: none; vertical-align: text-top; line-height: 25px; width: 50%;" rowspan="<?php echo sizeof($indicatorsArray) ?>"><?php echo conclude_indicators($capability) ?></td>
                                                <?php } ?>
                                            </tr>
                                        <?php } else { ?>
                                            <tr>
                                                <td><?php echo (str_replace($indicatorsArray[$i][0][0], $indicatorsArray[$i][0][0] . '<sub>', $indicatorsArray[$i][0]) . '</sub>') ?></td>
                                                <td><?php echo round($indicatorsArray[$i][1], 5, PHP_ROUND_HALF_UP) ?></td>
                                            </tr>
                                    <?php }
                                    } ?>
                                </tbody>
                            </table>
                        </div>
                   

                <?php } ?>
            </div>
            <?php

            if ($nrmlRisk != '') {
                $string = '<script type="text/javascript">';
                $string .= 'window.location = "./assets/php/query/change-nrml-risk.php/?table=' . $outputRead . '&nrml-risk=' . $nrmlRisk . '"';
                $string .= '</script>';

                echo $string;
            }
        }

        if ($capabilityReport != '') {
            $goBackTo = isset($_GET['from']) ? $_GET['from'] : '';

            if ($goBackTo == 'archive') {
                echo ('<script type="text/javascript">
                        document.getElementById("backword").innerHTML += `<a href="./?archive=' . substr($capabilityReport, -10) . '&process=' . lcfirst(substr($capabilityReport, 0, -17)) . '&khi=' . (check_normality($conn, substr($capabilityReport, 0, -17), substr($capabilityReport, -10))) . '">Retour</a>`;
                        document.getElementById("backword").classList.add("visible");
                    </script>');
            }
            echo ('<script type="text/javascript">
                        document.getElementById("dashboard").innerHTML += `<a href="./">Tableau de Bord</a>`;
                        document.getElementById("dashboard").classList.add("visible");
                    </script>');

            echo '<script type="text/javascript">
                        document.getElementById("existing-tables").style.display = "none";
                    </script>';

            $keywords = ['values', 'capability', 'khitest'];
            $base = "SHOW TABLES LIKE '" . $capabilityReport . "-%'";

            $processParams = get_process_details($conn, define_parameter_table(), ucfirst(substr($capabilityReport, 0, -17)), 0);
            ?>
            <div id="nav-bubbles" class="nav-bubbles">
                <div id="scroll-top"><a href=""><i class="fa-solid fa-angles-up"></i></a></div>
                <div id="scroll-normality"><a href="#khi-test"><img src="./assets/img/khi.png" alt=""></a></div>
                <div id="scroll-maps"><a href="#sampeling-resume"><i class="fa-solid fa-chart-line"></i></a></div>
                <div id="scroll-capability"><a href="#capability"><img src="./assets/img/sigma.png" alt=""></a></div>
            </div>
            <div class="solution" id="solution">
                <div class="summuary">
                    <div class="info">
                        <p class="solution-name">Nom du procédé : <span><?php echo str_replace('date', '</span> | <span>', str_replace('-', '</span> à <span>', str_replace('_', ' ', ucfirst(substr($capabilityReport, 0, -17))))) ?></span></p>
                        <p class="solution-name">Horaires : <span><?php echo $processParams[0]['startTime'] . ' - ' .  $processParams[0]['endTime'] . ' (' . substr($capabilityReport, -10) ?>)</span>
                        </p>
                        <p class="solution-name">Nombre d'échantillons total : <span><?php echo $processParams[0]['SamplesPerDay']  ?></span>
                        </p>
                    </div>
                    <div class="IT">
                        <p class="solution-name">Tolérance supérieure <span>(TS)</span> : <span><?php echo $processParams[0]['TS'] ?></span>
                        </p>
                        <p class="solution-name">Cible : <span><?php echo $processParams[0]['Cible'] ?></span>
                        </p>
                        <p class="solution-name">Tolérance inférieure <span>(TI)</span> : <span><?php echo $processParams[0]['TI'] ?></span>
                        </p>
                    </div>
                    <div class="download drop">
                        <a class="download-btn-pdf" id="download-btn-pdf" href=""><i class="fa-solid fa-file-pdf"></i></i> Exporter (PDF)</a>
                        <a class="download-btn-excel" href=""><i class="fa-solid fa-file-excel"></i> Exporter (Excel)</a>
                    </div>
                </div>

                <?php
                for ($i = 0; $i < 3; $i++) {
                    $sql = str_replace('keyword', ('_' . $keywords[$i] . '_'), $base);
                    $res = $conn->query($sql);
                    $DB[$keywords[$i]] = mysqli_fetch_all($res);
                }


                if ((sizeof($DB['values']) == $processParams[0]['SamplesPerDay'])) {
                    $sql = "SELECT value FROM `" . str_replace('khitest', 'values', $DB['khitest'][0][0]) . "`";
                    $res = $conn->query($sql);
                    $normalityValues = mysqli_fetch_all($res);

                    $sql = "SELECT * FROM `" . str_replace('khitest', 'capability', $DB['khitest'][0][0]) . "`";
                    $res = $conn->query($sql);
                    $normalityCapability = mysqli_fetch_all($res, MYSQLI_ASSOC);

                    foreach ($normalityCapability as $capabilityValue) {
                        if ($capabilityValue['id'] == 'Khi2-measured') {
                            $KhiMeasured = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'Khi2-theoretical') {
                            $KhiTheoretical = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'LSCx') {
                            $LSCx = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'LICx') {
                            $LICx = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'LSCe') {
                            $LSCe = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'LICe') {
                            $LICe = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'Mean of means') {
                            $X = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'Mean of ranges') {
                            $E = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'Means') {
                            $means = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'Ranges') {
                            $ranges = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'khi-probability') {
                            $alpha = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'stDev') {
                            $stDev = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'S') {
                            $S = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'purpose') {
                            $purpose = $capabilityValue['value'];
                        }
                        if ($capabilityValue['id'] == 'normality') {
                            $khiResult = $capabilityValue['value'];
                        }
                    }
                ?>


                    <div class="data">
                        <h3>1<sup style="font-size: 13px; font-weight: bold;">er</sup> Échantillon</h3>
                        <table class="initial-values">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th>Moyenne <span>(X&#772)</span></th>
                                    <th>Étendue <span>(E)</span></th>
                                    <th>Écart-Type <span>(S)</span></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="sample">
                                    <td class="sample-nbr">
                                        <p>Échantillon N° 1</p>
                                    </td>
                                    <td>
                                        <div class="sample-values"><?php for ($j = 0; $j < $processParams[0]['normalitySample']; $j++) { ?>
                                                <p class="initial-value"><?php echo $normalityValues[$j][0] ?></p>
                                            <?php } ?>
                                        </div>
                                    </td>
                                    <td><?php echo round($means, 5, PHP_ROUND_HALF_UP) ?></td>
                                    <td><?php echo round($ranges, 5, PHP_ROUND_HALF_UP) ?></td>
                                    <td><?php echo round($stDev, 5, PHP_ROUND_HALF_UP) ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <?php
                    $conclusion = ($KhiMeasured < $KhiTheoretical) ? "χ²<sub>pratique</sub> (" . round($KhiMeasured, 5, PHP_ROUND_HALF_UP) . ") < χ²<sub>théorique</sub> (" . round($KhiTheoretical, 5, PHP_ROUND_HALF_UP) . ") &#8594; Le procédé suit une loi normale." : "χ²<sub>pratique</sub> (" . round($KhiMeasured, 5, PHP_ROUND_HALF_UP) . ") > χ²<sub>théorique</sub> (" . round($KhiTheoretical, 5, PHP_ROUND_HALF_UP) . ") &#8594; Le procédé ne suit pas une loi normale (avec une probabilité d'erreur inférieure à " . $alpha . "%).";
                    $normality = get_solution($conn, $DB['khitest'][0][0]);
                    ?>

                    <div class="khi-test" id="khi-test">
                        <h3>Test de Normalité (χ²)</h3>
                        <table class="calculated-values">
                            <thead>
                                <tr>
                                    <th>Classes</th>
                                    <th>Min</th>
                                    <th>Max</th>
                                    <th>Centre <span>(X<sub>i</sub>)</span></th>
                                    <th>N<sub>i</sub></th>
                                    <th>N<sub>i</sub>.X<sub>i</sub></th>
                                    <th>N<sub>i</sub>.(X<sub>i</sub>-X)<sup>2</sup></th>
                                    <th>Z<sub>max</sub></th>
                                    <th>P<sub>i</sub></th>
                                    <th>N.P<sub>i</sub></th>
                                    <th>|N<sub>i</sub>-N.P<sub>i</sub>|</th>
                                    <th>(N<sub>i</sub>-N.P<sub>i</sub>)<sup>2</sup></th>
                                    <th>
                                        <p>(N<sub>i</sub>-N.P<sub>i</sub>)<sup>2</sup></p>
                                        <p>N.P<sub>i</sub></p>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                foreach ($normality as $normal) {
                                ?>
                                    <tr>
                                        <td><?php echo $normal['Intervalle']; ?></td>
                                        <td><?php echo $normal['Min']; ?></td>
                                        <td><?php echo $normal['Max']; ?></td>
                                        <td><?php echo $normal['Centre']; ?></td>
                                        <td><?php echo $normal['Ni']; ?></td>
                                        <td><?php echo $normal['NiXi']; ?></td>
                                        <td><?php echo $normal['NiXi_XSQR']; ?></td>
                                        <td><?php echo $normal['Zmax']; ?></td>
                                        <td><?php echo $normal['P']; ?></td>
                                        <td><?php echo $normal['Npi']; ?></td>
                                        <td><?php echo $normal['Ni_Npi']; ?></td>
                                        <td><?php echo $normal['Ni_NpiSQR']; ?></td>
                                        <td><?php echo $normal['Ni_NpiSQRNpi']; ?></td>
                                    </tr>
                                <?php
                                }
                                ?>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>Somme</td>
                                    <td><?php echo round($KhiMeasured, 5, PHP_ROUND_HALF_UP) ?></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        <br>
                        <br>
                        <div class="khi-conclusion" style="height: 400px;">
                            <div id="N-chartContainer" style="width: 100%;">
                                <?php
                                foreach ($normality as $normal) {
                                    array_push($chartArrayN, array("label" => str_replace(' ', '', $normal['Intervalle']), "y" => floatval($normal['Ni'])));
                                }
                                ?>
                            </div>
                            <div id="khi-conclusion">
                                <table>
                                    <thead>
                                        <tr>
                                            <th colspan="2">Résultat du test</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <p>χ²<sub>pratique</sub>
                                            </td>
                                            <td><?php echo round($KhiMeasured, 5, PHP_ROUND_HALF_UP) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Degrés de liberté <span>(ν)</span></td>
                                            <td><?php echo sizeof($normality) - 3 ?></td>
                                        </tr>
                                        <tr>
                                            <td>Risque <span>(α)</span></td>
                                            <td><?php echo $alpha ?> %</td>
                                        </tr>
                                        <tr>
                                            <td>χ²<sub>théorique</sub></td>
                                            <td><?php echo round($KhiTheoretical, 5, PHP_ROUND_HALF_UP) ?></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" id="last-khi-conclusion"><?php echo $conclusion ?></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <?php

                    $sammuaryTrTh = [];
                    $valuesTablesList = $DB['values'];
                    $valuesList = [];
                    $CpList = [];
                    $PpList = [];

                    $startHour = intval(explode(':', $processParams[0]['startTime'])[0]);
                    $startMinute = intval(explode(':', $processParams[0]['startTime'])[1]);
                    $endHour = intval(explode(':', $processParams[0]['endTime'])[0]);
                    $endMinute = intval(explode(':', $processParams[0]['endTime'])[1]);
                    $startSecond = 0;

                    $measureTime = intval($processParams[0]['measureTime']);
                    $prodCadence = intval($processParams[0]['prodCadence']);

                    $CpCounter = 1;

                    if ($endHour < $startHour) {
                        $endHour += 24;
                    }
                    if (($endHour == $startHour) && ($endMinute <= $startMinute)) {
                        $endHour += 24;
                    }

                    if ($measureTime <= $prodCadence) {
                        $startSecond += $measureTime;
                        $adding = $prodCadence;
                    } else {
                        $startSecond += $prodCadence;
                        $adding = $measureTime;
                    }

                    for ($i = 0; $i < intval($processParams[0]['normalitySample']); $i++) {
                        $startSecond += $adding;

                        while ($startSecond >= 60) {
                            $startMinute += 1;
                            $startSecond -= 60;

                            while ($startMinute >= 60) {
                                $startHour += 1;
                                $startMinute -= 60;
                            }
                        }
                    }

                    if ($startHour < 10) {
                        $startHourLabel = '0' . $startHour;
                    } else {
                        $startHourLabel = $startHour;
                    }
                    if ($startMinute < 10) {
                        $startMinuteLabel = '0' . $startMinute;
                    } else {
                        $startMinuteLabel = $startMinute;
                    }

                    array_push($sammuaryTrTh, array("y" => intval($processParams[0]['normalitySample']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => 'khi'));

                    while (($startHour < $endHour) || (($startHour == $endHour) && ($startMinute < $endMinute))) {
                        $startMinute += (60 * floatval($processParams[0]['sampelingCadence']));
                        while ($startMinute >= 60) {
                            $startHour += 1;
                            $startMinute -= 60;
                        }

                        if ($startHour < 10) {
                            $startHourLabel = '0' . $startHour;
                        } else {
                            $startHourLabel = $startHour;
                        }
                        if ($startMinute < 10) {
                            $startMinuteLabel = '0' . $startMinute;
                        } else {
                            $startMinuteLabel = $startMinute;
                        }

                        if (($startHour < $endHour) || (($startHour == $endHour) && ($startMinute < $endMinute))) {
                            if (($CpCounter % $processParams[0]['samplesForCp']) == 0) {
                                array_push($sammuaryTrTh, array("y" => intval($processParams[0]['sampleSize']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => 'Cp'));
                            } else {
                                array_push($sammuaryTrTh, array("y" => intval($processParams[0]['sampleSize']), "label" => $startHourLabel . ':' . $startMinuteLabel, "indicator" => ''));
                            }
                        }

                        $CpCounter += 1;
                    }
                    $sammuaryTrTh[sizeof($sammuaryTrTh) - 1]['indicator'] .= 'Pp';

                    for ($j = 1; $j < sizeof($valuesTablesList); $j++) {
                        $sql = "SELECT Value FROM `" . $valuesTablesList[$j][0] . "`";
                        $res = $conn->query($sql);
                        $valuesList[$j] = mysqli_fetch_all($res);

                        $sql = "SELECT Value FROM `" . str_replace('values', 'capability', $valuesTablesList[$j][0]) . "` WHERE id = 'Cp'";
                        $res = $conn->query($sql);
                        $CpList[$j] = mysqli_fetch_all($res);

                        $sql = "SELECT Value FROM `" . str_replace('values', 'capability', $valuesTablesList[$j][0]) . "` WHERE id = 'Pp'";
                        $res = $conn->query($sql);
                        $PpList[$j] = mysqli_fetch_all($res);
                    }

                    ?>

                    <div class="archive-sammuary" id="sampeling-resume">
                        <h3 class="title">Résumé de l'échantillonnage</h3>
                        <div class="archive-sammuary-content">
                            <table>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <?php for ($i = 1; $i < sizeof($sammuaryTrTh); $i++) { ?>
                                            <th><?php echo $sammuaryTrTh[$i]['label']  ?></th>
                                        <?php } ?>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <?php for ($i = 1; $i < sizeof($sammuaryTrTh); $i++) { ?>
                                            <th>(<?php echo (isset($valuesTablesList[$i][0]) ? substr($valuesTablesList[$i][0], -8, -3) : ' - ') ?>)</th>
                                        <?php } ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    for ($i = 0; $i < $processParams[0]['sampleSize']; $i++) {
                                    ?>
                                        <tr>
                                            <td>X<sub><?php echo ($i + 1) ?></sub></td>
                                            <?php for ($c = 1; $c < sizeof($sammuaryTrTh); $c++) { ?>
                                                <td class='value-row-sammuary'><?php echo (isset($valuesList[$c][$i][0]) ? $valuesList[$c][$i][0] : ' - ') ?></td>
                                            <?php } ?>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                </tbody>
                                <tfoot>
                                    <tr id="Cp-row-sammuary">
                                        <td>C<sub>p</sub></td>
                                        <?php for ($c = 1; $c < sizeof($sammuaryTrTh); $c++) {
                                            if (isset($CpList[$c][0][0])) { ?>
                                                <td colspan="<?php echo $processParams[0]['samplesForCp'] ?>"><?php echo round($CpList[$c][0][0], 5, PHP_ROUND_HALF_UP) ?></td>
                                                <?php } else {
                                                if ($sammuaryTrTh[$c]['indicator'] == 'Cp') { ?>
                                                    <td colspan="<?php echo $processParams[0]['samplesForCp'] ?>"> - </td>
                                        <?php }
                                            }
                                        } ?>
                                    </tr>
                                    <tr>
                                        <td>P<sub>p</sub></td>
                                        <?php for ($c = 1; $c < sizeof($sammuaryTrTh); $c++) {
                                            if (isset($PpList[$c][0][0])) { ?>
                                                <td colspan="<?php echo ($processParams[0]['SamplesPerDay'] - 1) ?>"><?php echo round($PpList[$c][0][0], 5, PHP_ROUND_HALF_UP) ?></td>
                                                <?php } else {
                                                if ($c == (sizeof($sammuaryTrTh) - 1)) { ?>
                                                    <td colspan="<?php echo ($processParams[0]['SamplesPerDay'] - 1) ?>"> - </td>
                                        <?php }
                                            }
                                        } ?>
                                    </tr>
                                </tfoot>
                            </table>
                            <div id="trigger"></div>
                        </div>
                    </div>

                    <?php
                    $allValuesHistory = [];
                    $coefTable = COEFTABLE;

                    foreach ($DB['values'] as $capabilityTable) {
                        if ($capabilityTable[0] != str_replace('khitest', 'values', $DB['khitest'][0][0])) {
                            $sql = "SELECT value FROM `" . $capabilityTable[0] . "`";
                            $res = $conn->query($sql);
                            $allValuesHistory[] = mysqli_fetch_all($res, MYSQLI_ASSOC);
                        }
                    }

                    $drawControlMaps = sizeof($allValuesHistory) > 0 ? 'draw' : 'dont';

                    $sampleSize = $processParams[0]['sampleSize'];
                    $cible = $processParams[0]['Cible'];

                    $sampleE = [];
                    $sampleX = [];
                    $sampleStDev = [];

                    for ($i = 0; $i < sizeof($allValuesHistory); $i++) {
                        $sampleSum = 0;
                        $tempMax = 0;
                        $tempMin = $allValuesHistory[$i][0]['value'];
                        for ($j = 0; $j < ($sampleSize); $j++) {
                            $sampleSum += $allValuesHistory[$i][$j]['value'];
                            if ($allValuesHistory[$i][$j]['value'] > $tempMax) {
                                $tempMax = $allValuesHistory[$i][$j]['value'];
                            }
                            if ($allValuesHistory[$i][$j]['value'] < $tempMin) {
                                $tempMin = $allValuesHistory[$i][$j]['value'];
                            }
                        }
                        array_push($sampleE, $tempMax - $tempMin);
                        array_push($sampleX, $sampleSum / $sampleSize);
                        array_push($sampleStDev, st_dev($allValuesHistory[$i]));
                    }
                    $E = $sampleE ? array_sum($sampleE) / sizeof($sampleE) : intval(1);
                    $stDev = $sampleStDev ? array_sum($sampleStDev) / sizeof($sampleStDev) : intval(1);
                    $LSCx = round($cible + ($coefTable[$sampleSize]['A2'] * $E), 5, PHP_ROUND_HALF_UP);
                    $LICx = round($cible - ($coefTable[$sampleSize]['A2'] * $E), 5, PHP_ROUND_HALF_UP);
                    $LSCe = round(($coefTable[$sampleSize]['D4'] * $E), 5, PHP_ROUND_HALF_UP);
                    $LICe = round(($coefTable[$sampleSize]['D3'] * $E), 5, PHP_ROUND_HALF_UP);
                    $LSCstdev = round(($coefTable[$sampleSize]['B4'] * $stDev), 5, PHP_ROUND_HALF_UP);
                    $LICstdev = round(($coefTable[$sampleSize]['B3'] * $stDev), 5, PHP_ROUND_HALF_UP);
                    $XmapConclusion = analyse_Xmap($LSCx, $cible, $LICx, sizeof($sampleX) ? implode(' - ', $sampleX) : ' 0');
                    $stDevmapConclusion = analyse_Emap($LSCstdev, $stDev, $LICstdev, implode(' - ', $sampleStDev));
                    $EmapConclusion = analyse_Emap($LSCe, $E, $LICe, implode(' - ', $sampleE));

                    for ($i = 0; $i < sizeof($sampleX); $i++) {
                        array_push($controlMapArrayX, array("label" => "Échantillon N° " . ($i + 1), "y" => $sampleX[$i]));
                        array_push($LSCxArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LSCx));
                        array_push($LICxArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICx));
                        array_push($XArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $cible));
                        array_push($XmiddleThirdBottom, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICx + (($LSCx - $LICx) / 3)));
                        array_push($XmiddleThirdTop, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICx + ((($LSCx - $LICx) / 3) * 2)));
                    }

                    for ($i = 0; $i < sizeof($sampleE); $i++) {
                        array_push($controlMapArrayE, array("label" => "Échantillon N° " . ($i + 1), "y" => $sampleE[$i]));
                        array_push($LSCeArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LSCe));
                        array_push($LICeArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICe));
                        array_push($EmiddleThirdBottom, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICe + (($LSCe - $LICe) / 3)));
                        array_push($EmiddleThirdTop, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICe + ((($LSCe - $LICe) / 3) * 2)));
                    }

                    for ($i = 0; $i < sizeof($sampleStDev); $i++) {
                        array_push($controlMapArrayStDev, array("label" => "Échantillon N° " . ($i + 1), "y" => $sampleStDev[$i]));
                        array_push($LSCstdevArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LSCstdev));
                        array_push($LICstdevArray, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICstdev));
                        array_push($StDevmiddleThirdBottom, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICstdev + (($LSCstdev - $LICstdev) / 3)));
                        array_push($StDevmiddleThirdTop, array("label" => "Échantillon N° " . ($i + 1), "y" => $LICstdev + ((($LSCstdev - $LICstdev) / 3) * 2)));
                    }
                    ?>
                    <div id="archive-control-maps-container">
                        <h3 class="title">Cartes de Contrôle</h3>
                        <div class="mean-control-map" style="height: 400px;">
                            <div id="X-map-chartContainer" style=" width: 100%;"></div>
                        </div>

                        <div class="stdev-control-map" style="height: 400px; margin-top: 50px;">
                            <div id="stdev-map-chartContainer" style=" width: 100%;"></div>
                        </div>
                        <div class="range-control-map" style="height: 400px; margin-top: 50px;">
                            <div id="E-map-chartContainer" style=" width: 100%;"></div>
                        </div>

                        <?php if ($XmapConclusion || $EmapConclusion) { ?>
                            <div class="control-map-conclution">
                                <table>
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th colspan="4">Interprétation des carte de contrôle</th>
                                        </tr>
                                        <tr>
                                            <th></th>
                                            <th>Observation</th>
                                            <th>Description</th>
                                            <th>Décision</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if ($XmapConclusion) { ?>
                                            <tr>
                                                <td>Carte des moyennes <span>(X&#772;&#772)</span></td>
                                                <td><?php echo $XmapConclusion[0] ?></td>
                                                <td><?php echo $XmapConclusion[1] ?></td>
                                                <td><?php echo $XmapConclusion[2] ?></td>
                                            </tr>
                                        <?php }
                                        if ($stDevmapConclusion) { ?>
                                            <tr>
                                                <td>Carte des écart-types <span>(S&#772;)</span></td>
                                                <td><?php echo $stDevmapConclusion[0] ?></td>
                                                <td><?php echo $stDevmapConclusion[1] ?></td>
                                                <td><?php echo $stDevmapConclusion[2] ?></td>
                                            </tr>
                                        <?php }
                                        if ($EmapConclusion) { ?>
                                            <tr>
                                                <td>Carte des étendues <span>(E&#772;)</span></td>
                                                <td><?php echo $EmapConclusion[0] ?></td>
                                                <td><?php echo $EmapConclusion[1] ?></td>
                                                <td><?php echo $EmapConclusion[2] ?></td>
                                            </tr>
                                        <?php }
                                        ?>
                                    </tbody>
                                </table>
                                <p id="remarque"><i>*En cas de réglage : un nouvel échantillon est mesuré et une deuxième étude doit être faite. Pour être acceptable, le point doit se situer dans le tiers central de la carte des moyennes X&#772;&#772.</i></p>
                            </div>
                        <?php } ?>
                    </div>
                    <?php
                    $indicatorsArray = [];
                    foreach ($DB['capability'] as $SearchPps) {
                        $sql = "SELECT value FROM `" . $SearchPps[0] . "` WHERE id = 'Pp'";
                        $res = $conn->query($sql);
                        if (mysqli_fetch_row($res)) {
                            $capability = get_solution($conn, str_replace('_date', '_capability', $SearchPps[0]));
                        }
                    }

                    foreach ($capability as $capabilityValue) {
                        if (($capabilityValue['id'] == 'Pp') ||
                            ($capabilityValue['id'] == 'Ppk') ||
                            ($capabilityValue['id'] == 'Ppm') ||
                            ($capabilityValue['id'] == 'Rs') ||
                            ($capabilityValue['id'] == 'Rr') ||
                            ($capabilityValue['id'] == 'Zéquivalent') ||
                            ($capabilityValue['id'] == 'Zprocessus')
                        ) {
                            array_push($indicatorsArray, array($capabilityValue['id'], $capabilityValue['value']));
                        }
                    }
                    if ($indicatorsArray) { ?>
                        <div id="capability" class="capability">
                            <h3>Indicateurs de Capabilité</h3>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Indicateur</th>
                                        <th>Valeur</th>
                                        <?php if (conclude_indicators($capability) != '') { ?>
                                            <th>Interprétation</th>
                                        <?php } ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php for ($i = 0; $i < sizeof($indicatorsArray); $i++) {
                                        if ($i == 0) { ?>
                                            <tr>
                                                <td><?php echo (str_replace($indicatorsArray[$i][0][0], $indicatorsArray[$i][0][0] . '<sub>', $indicatorsArray[$i][0]) . '</sub>') ?></td>
                                                <td><?php echo round($indicatorsArray[$i][1], 5, PHP_ROUND_HALF_UP) ?></td>
                                                <?php if (conclude_indicators($capability) != '') { ?>
                                                    <td style="text-align: start; padding: 10px 25px; border-right: none; vertical-align: text-top; line-height: 25px; width: 50%;" rowspan="<?php echo sizeof($indicatorsArray) ?>"><?php echo conclude_indicators($capability) ?></td>
                                                <?php } ?>
                                            </tr>
                                        <?php } else { ?>
                                            <tr>
                                                <td><?php echo (str_replace($indicatorsArray[$i][0][0], $indicatorsArray[$i][0][0] . '<sub>', $indicatorsArray[$i][0]) . '</sub>') ?></td>
                                                <td><?php echo round($indicatorsArray[$i][1], 5, PHP_ROUND_HALF_UP) ?></td>
                                            </tr>
                                    <?php }
                                    } ?>
                                </tbody>
                            </table>
                        </div>
                    <?php } ?>
            </div>
        <?php } else {
        ?>
            <div class="not-ready" id="capa-report-not-ready">
                <h1>Rapport de capabilité indisponible.</h1>
                <p>Le rapport de qualité sera prêt à la fin du jour.
                    Si le rapport est toujours indisponible, il se peut que certains échantillons manquent. </p>
            </div>
        <?php
                } ?>
    </div>
<?php
        }
?>

</div>

<div id="drop-overlay" class="confirmation-overlay"></div>
<div class="confirm-drop" id="confirm-drop">
    <h1>Êtes-vous sûr de vouloir supprimer cette étude ?</h1>
    <p>La suppression de cette étude est irréversible. Toutes les données seront perdues.</p>
    <br>
    <br>
    <div class="drop-buttons">
        <a href="./assets/php/views/drop.php/?drop=<?php echo $outputRead ?>" id="confirm-drop-db" class="delete-btn"><i class="fa-solid fa-trash"></i> Supprimer</a>
        <a id="cancel-drop-db" class="cancel-delete-btn"><i class="fa-solid fa-circle-xmark"></i> Annuler</a>
    </div>
</div>

<div id="add-overlay" class="confirmation-overlay"></div>
<div class="add-method" id="add-method">
    <h1>Méthode d' ajout</h1>
    <p>Veuillez choisir une méthode pour ajouter les nouvelles données du processus.</p>
    <br>
    <br>
    <div class="add-buttons">
        <a id="manual-add" class="manual-add"><i class="fa-solid fa-keyboard"></i> Saisir maintenant</a>
        <a id="excel-add" class="excel-add"><i class="fa-solid fa-file-excel"></i> Téléverser un fichier Excel</a>
    </div>
    <form action="" method="POST" enctype="multipart/form-data" id="excel-add-method-form">
        <div id="add-method-excel-label">
            <label id="excel-hidden-label" for="add-method-excel">Téléverser un fichier Excel <span>(.xlsx)</span> :
                <input class="excel-upload" id="add-method-excel" name="add-method-excel" type="file" required accept=".xlsx">
            </label>
        </div>
    </form>
</div>

<div id="add-confirmation-overlay" class="confirmation-overlay"></div>
<div class="add-confirmation" id="add-confirmation">
    <h1>Le procédé ne suit pas une loi normale</h1>
    <p>Le procédé ne suit pas une loi normale. Voulez vous poursuivre quand même ?</p>
    <br>
    <br>
    <div class="confirm-add-buttons">
        <a id="confirm-add" class="confirm-add"><i class="fa-solid fa-circle-arrow-right"></i> Poursuivre</a>
        <a id="cancel-add" class="cancel-add"><i class="fa-solid fa-circle-xmark"></i> Annuler</a>
    </div>
</div>

<div class="copyright">
    <div class="photo">
        <img src="./assets/img/author.png">
        <img src="./assets/img/author2.png">
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

<script>
    window.onload = function() {
        CanvasJS.addColorSet("khi-test", ["#0070c0"]);
        CanvasJS.addColorSet("control-map", ["#f1133e", "#0070c0", "#10793f", "#ff7b00", "#00000080", "#00000080"]);
        CanvasJS.addColorSet("E-control-map", ["#f1133e", "#0070c0", "#10793f", "#00000080", "#00000080"]);
        CanvasJS.addColorSet("follow-up-map", ["#f1133e", "#0070c0", "#10793f", "#ffd557", "#72ddf7", "#9357ff"]);

        if (document.getElementById('planning-chartContainer')) {
            var chart = new CanvasJS.Chart("planning-chartContainer", {
                animationEnabled: true,
                zoomEnabled: true,
                colorSet: "follow-up-map",
                theme: "light2",
                exportFileName: "Planning d'échantillonnage (<?php echo isset($_GET['planning']) ? str_replace('_', ' ', $_GET['planning']) : '' ?>)",
                exportEnabled: true,
                title: {
                    text: "Planning d'échantillonnage : <?php echo isset($_GET['planning']) ? str_replace('_', ' ', $_GET['planning']) : '' ?>",
                    fontSize: 17,
                    fontColor: '#000000',
                    fontFamily: 'Roboto'
                },

                axisY: [{
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                    gridColor: "#ccc",
                    titleFontSize: 12,
                    titleFontColor: '#000000',
                    titleFontFamily: 'Roboto'
                }, {
                    title: "Nombre de pièces",
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                    gridColor: "#ccc",
                    titleFontSize: 12,
                    titleFontColor: '#000000',
                    titleFontFamily: 'Roboto'
                }],
                axisX: {
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                },
                data: [{
                    type: "bar",
                    color: "#0070c0",
                    indexLabelFontSize: 13,
                    indexLabelFontFamily: 'Roboto',
                    indexLabelFontColor: '#000000',
                    indexLabelFontWeight: "bold",
                    indexLabelFormatter: function(e) {
                        if (e.dataPoint.indicator == 'khi') {
                            return "χ²"
                        } else if (e.dataPoint.indicator == 'Cp') {
                            return "Cp"
                        } else if (e.dataPoint.indicator == 'Pp') {
                            return "Pp"
                        } else if (e.dataPoint.indicator == 'CpPp') {
                            return "Cp, Pp"
                        } else return "";
                    },
                    dataPoints: (<?php echo json_encode($dataPointsArray, JSON_NUMERIC_CHECK); ?>).reverse()
                }]
            });
            chart.render();
        }

        if (document.getElementById('followUp-chartContainer')) {
            var followUpChart = new CanvasJS.Chart("followUp-chartContainer", {
                colorSet: "follow-up-map",
                animationEnabled: <?php echo (((sizeof($CpFollowUp) > 1) || (sizeof($PpFollowUp) > 1)) ? 'true' : 'false'); ?>,
                theme: "light2",
                zoomEnabled: true,
                zoomType: "x",
                exportFileName: "Suivi des indicateurs de capabilité (<?php echo str_replace('_', ' ', $followUp) ?>)",
                exportEnabled: true,
                title: {
                    text: "Suivi des indicateurs de capabilité : <?php echo str_replace('_', ' ', $followUp) ?>",
                    fontSize: 17,
                    fontColor: '#000000',
                    fontFamily: 'Roboto'
                },
                axisY: {
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                    gridColor: "#ccc",
                    titleFontSize: 17,
                    titleFontColor: '#000000',
                    titleFontFamily: 'Roboto'
                },
                axisX: {
                    title: "",
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                },
                toolTip: {
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    cornerRadius: 4,
                    fontWeight: "bold",
                    shared: true
                },
                data: [{
                        type: "line",
                        name: "Cp",
                        markerType: "triangle",
                        indexLabelFontSize: 16,
                        showInLegend: true,
                        markerSize: 10,
                        connectNullData: true,
                        dataPoints: <?php echo json_encode($CpFollowUp, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: "Cpk",
                        markerType: "triangle",
                        indexLabelFontSize: 16,
                        showInLegend: true,
                        markerSize: 10,
                        connectNullData: true,
                        dataPoints: <?php echo json_encode($CpkFollowUp, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: "Cpm",
                        markerType: "triangle",
                        indexLabelFontSize: 16,
                        showInLegend: true,
                        markerSize: 10,
                        connectNullData: true,
                        dataPoints: <?php echo json_encode($CpmFollowUp, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: "Pp",
                        markerType: "square",
                        showInLegend: true,
                        markerSize: 10,
                        connectNullData: true,
                        indexLabelFontSize: 16,
                        dataPoints: <?php echo json_encode($PpFollowUp, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: "Ppk",
                        markerType: "square",
                        showInLegend: true,
                        markerSize: 10,
                        connectNullData: true,
                        indexLabelFontSize: 16,
                        dataPoints: <?php echo json_encode($PpkFollowUp, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: "Ppm",
                        markerType: "square",
                        showInLegend: true,
                        markerSize: 10,
                        connectNullData: true,
                        indexLabelFontSize: 16,
                        dataPoints: <?php echo json_encode($PpmFollowUp, JSON_NUMERIC_CHECK); ?>
                    }
                ]
            });


            if ((<?php echo ($drawMap ? 'true' : 'false') ?>)) {
                followUpChart.render();
            } else {
                document.getElementById('follow-up-chart-container').innerHTML = '<h1 class="no-map-found-title">Suivi des indicateurs de capabilité : <?php echo str_replace('_', ' ', $followUp) ?></h1>';
                document.getElementById('follow-up-chart-container').innerHTML += '<div class="no-map-found-error-container"><h1 class="no-map-found-error">Aucun indicateur trouvé.</h1><p class="no-map-found-desc">Veuillez vérifier l\'existance des mesures ou reéssayez plus tard.</p></div>';
            }
        }

        if (document.getElementById('archive-control-maps-container')) {
            var eMapchart = new CanvasJS.Chart("E-map-chartContainer", {
                colorSet: "E-control-map",
                animationEnabled: (urlParams.get('capability-report') == null),
                theme: "light2",
                zoomEnabled: true,
                zoomType: "xy",
                exportFileName: "Carte de contrôle (étendues)",
                exportEnabled: true,
                title: {
                    text: "",
                    fontSize: 17,
                    fontColor: '#000000',
                    fontFamily: 'Roboto'
                },
                axisY: [{
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                    gridColor: "#ccc",
                    titleFontSize: 17,
                    titleFontColor: '#000000',
                    titleFontFamily: 'Roboto'
                }, {
                    title: "Carte des étendues (Ē)",
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                    gridColor: "#ccc",
                    titleFontSize: 17,
                    titleFontColor: '#000000',
                    titleFontFamily: 'Roboto'

                }],
                axisX: {
                    title: "",
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                },
                toolTip: {
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    cornerRadius: 4,
                    fontWeight: "bold",
                    shared: true
                },
                data: [{
                        type: "line",
                        name: "LSC",
                        indexLabelFontSize: 13,
                        indexLabelFontFamily: 'Roboto',
                        indexLabelFontColor: '#000000',
                        indexLabelFormatter: function(e) {
                            if (e.dataPoint.label == 'Échantillon N° <?php echo round(sizeof($LSCxArray) / 2) ?>') {
                                return "LSC = " + e.dataPoint.y;
                            } else return "";
                        },
                        showInLegend: true,
                        markerSize: 0,
                        dataPoints: <?php echo json_encode($LSCeArray, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: " Ē",
                        indexLabelFontSize: 16,
                        showInLegend: true,
                        markerSize: 0,
                        dataPoints: <?php echo json_encode($controlMapArrayE, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: "LIC",
                        indexLabelFontSize: 13,
                        indexLabelFontFamily: 'Roboto',
                        indexLabelFontColor: '#000000',
                        indexLabelFormatter: function(e) {
                            if (e.dataPoint.label == 'Échantillon N° <?php echo round(sizeof($LSCxArray) / 2) ?>') {
                                return "LIC = " + e.dataPoint.y;
                            } else return "";
                        },
                        showInLegend: true,
                        markerSize: 0,
                        dataPoints: <?php echo json_encode($LICeArray, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        lineDashType: "dash",
                        toolTipContent: null,
                        indexLabelFontSize: 16,
                        markerType: "none",
                        dataPoints: <?php echo json_encode($EmiddleThirdBottom, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        lineDashType: "dash",
                        toolTipContent: null,
                        indexLabelFontSize: 16,
                        markerType: "none",
                        dataPoints: <?php echo json_encode($EmiddleThirdTop, JSON_NUMERIC_CHECK); ?>
                    }
                ]
            });
            if (('<?php echo ($drawControlMaps) ?>') == 'draw') {
                eMapchart.render();
            } else if (('<?php echo ($drawControlMaps) ?>') == 'dont') {
                document.getElementById('archive-control-maps-container').innerHTML = '<h1 class="no-map-found-title">Cartes de contrôles : <?php echo (isset($_GET['process']) ? str_replace('_', ' ', $_GET['process']) : '') ?></h1>';
                document.getElementById('archive-control-maps-container').innerHTML += '<div class="no-map-found-error-container"><h1 class="no-map-found-error">Aucun échantillon trouvé.</h1><p class="no-map-found-desc">Veuillez vérifier l\'existance des mesures ou reéssayez plus tard.</p></div>';
            }
        }

        if (document.getElementById('archive-control-maps-container')) {
            var stdevMapchart = new CanvasJS.Chart("stdev-map-chartContainer", {
                colorSet: "E-control-map",
                animationEnabled: (urlParams.get('capability-report') == null),
                theme: "light2",
                zoomEnabled: true,
                zoomType: "xy",
                exportFileName: "Carte de contrôle (écart-types)",
                exportEnabled: true,
                title: {
                    text: "",
                    fontSize: 17,
                    fontColor: '#000000',
                    fontFamily: 'Roboto'
                },
                axisY: [{
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                    gridColor: "#ccc",
                    titleFontSize: 17,
                    titleFontColor: '#000000',
                    titleFontFamily: 'Roboto'
                }, {
                    title: "Carte des écart-types (S̄)",
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                    gridColor: "#ccc",
                    titleFontSize: 17,
                    titleFontColor: '#000000',
                    titleFontFamily: 'Roboto'
                }],
                axisX: {
                    title: "",
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                },
                toolTip: {
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    cornerRadius: 4,
                    fontWeight: "bold",
                    shared: true
                },
                data: [{
                        type: "line",
                        name: "LSC",
                        indexLabelFontSize: 13,
                        indexLabelFontFamily: 'Roboto',
                        indexLabelFontColor: '#000000',
                        indexLabelFormatter: function(e) {
                            if (e.dataPoint.label == 'Échantillon N° <?php echo round(sizeof($LSCstdevArray) / 2) ?>') {
                                return "LSC = " + e.dataPoint.y;
                            } else return "";
                        },
                        showInLegend: true,
                        markerSize: 0,
                        dataPoints: <?php echo json_encode($LSCstdevArray, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: " S̄",
                        indexLabelFontSize: 16,
                        showInLegend: true,
                        markerSize: 0,
                        dataPoints: <?php echo json_encode($controlMapArrayStDev, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: "LIC",
                        indexLabelFontSize: 13,
                        indexLabelFontFamily: 'Roboto',
                        indexLabelFontColor: '#000000',
                        indexLabelFormatter: function(e) {
                            if (e.dataPoint.label == 'Échantillon N° <?php echo round(sizeof($LICstdevArray) / 2) ?>') {
                                return "LIC = " + e.dataPoint.y;
                            } else return "";
                        },
                        showInLegend: true,
                        markerSize: 0,
                        dataPoints: <?php echo json_encode($LICstdevArray, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        lineDashType: "dash",
                        toolTipContent: null,
                        indexLabelFontSize: 16,
                        markerType: "none",
                        dataPoints: <?php echo json_encode($StDevmiddleThirdBottom, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        lineDashType: "dash",
                        toolTipContent: null,
                        indexLabelFontSize: 16,
                        markerType: "none",
                        dataPoints: <?php echo json_encode($StDevmiddleThirdTop, JSON_NUMERIC_CHECK); ?>
                    }
                ]
            });
            if (('<?php echo ($drawControlMaps) ?>') == 'draw') {
                stdevMapchart.render();
            } else if (('<?php echo ($drawControlMaps) ?>') == 'dont') {
                document.getElementById('archive-control-maps-container').innerHTML = '<h1 class="no-map-found-title">Cartes de contrôles : <?php echo (isset($_GET['process']) ? str_replace('_', ' ', $_GET['process']) : '') ?></h1>';
                document.getElementById('archive-control-maps-container').innerHTML += '<div class="no-map-found-error-container"><h1 class="no-map-found-error">Aucun échantillon trouvé.</h1><p class="no-map-found-desc">Veuillez vérifier l\'existance des mesures ou reéssayez plus tard.</p></div>';
            }
        }

        if (document.getElementById('archive-control-maps-container')) {
            var xMapchart = new CanvasJS.Chart("X-map-chartContainer", {
                colorSet: "control-map",
                animationEnabled: (urlParams.get('capability-report') == null),
                theme: "light2",
                zoomEnabled: true,
                zoomType: "xy",
                exportFileName: "Carte de contrôle (moyennes)",
                exportEnabled: true,
                title: {
                    text: "",
                    fontSize: 17,
                    fontColor: '#000000',
                    fontFamily: 'Roboto'
                },
                axisY: [{
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                    gridColor: "#ccc",
                    titleFontSize: 17,
                    titleFontColor: '#000000',
                    titleFontFamily: 'Roboto'
                }, {
                    title: "Carte des moyennes (X̄̄)",
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                    gridColor: "#ccc",
                    titleFontSize: 17,
                    titleFontColor: '#000000',
                    titleFontFamily: 'Roboto'
                }],
                axisX: {
                    title: "",
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto'
                },
                toolTip: {
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    cornerRadius: 4,
                    fontWeight: "bold",
                    shared: true
                },
                data: [{
                        type: "line",
                        name: "LSC",
                        indexLabelFontSize: 13,
                        indexLabelFontFamily: 'Roboto',
                        indexLabelFontColor: '#000000',
                        indexLabelFormatter: function(e) {
                            if (e.dataPoint.label == 'Échantillon N° <?php echo round(sizeof($LSCxArray) / 2) ?>') {
                                return "LSC = " + e.dataPoint.y;
                            } else return "";
                        },
                        showInLegend: true,
                        markerSize: 0,
                        dataPoints: <?php echo json_encode($LSCxArray, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: "X̄",
                        indexLabelFontSize: 16,
                        showInLegend: true,
                        markerSize: 0,
                        dataPoints: <?php echo json_encode($controlMapArrayX, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: "Cible",
                        indexLabelFontSize: 16,
                        showInLegend: true,
                        markerSize: 0,
                        dataPoints: <?php echo json_encode($XArray, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        name: "LIC",
                        indexLabelFontSize: 13,
                        indexLabelFontFamily: 'Roboto',
                        indexLabelFontColor: '#000000',
                        indexLabelFormatter: function(e) {
                            if (e.dataPoint.label == 'Échantillon N° <?php echo round(sizeof($LSCxArray) / 2) ?>') {
                                return "LIC = " + e.dataPoint.y;
                            } else return "";
                        },
                        showInLegend: true,
                        markerSize: 0,
                        dataPoints: <?php echo json_encode($LICxArray, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        lineDashType: "dash",
                        toolTipContent: null,
                        indexLabelFontSize: 16,
                        markerType: "none",
                        dataPoints: <?php echo json_encode($XmiddleThirdBottom, JSON_NUMERIC_CHECK); ?>
                    },
                    {
                        type: "line",
                        lineDashType: "dash",
                        toolTipContent: null,
                        indexLabelFontSize: 16,
                        markerType: "none",
                        dataPoints: <?php echo json_encode($XmiddleThirdTop, JSON_NUMERIC_CHECK); ?>
                    }
                ]
            });
            if (('<?php echo ($drawControlMaps) ?>') == 'draw') {
                xMapchart.render();
            } else if (('<?php echo ($drawControlMaps) ?>') == 'dont') {
                document.getElementById('archive-control-maps-container').innerHTML = '<h1 class="no-map-found-title">Cartes de contrôles : <?php echo (isset($_GET['process']) ? str_replace('_', ' ', $_GET['process']) : '') ?></h1>';
                document.getElementById('archive-control-maps-container').innerHTML += '<div class="no-map-found-error-container"><h1 class="no-map-found-error">Aucun échantillon trouvé.</h1><p class="no-map-found-desc">Veuillez vérifier l\'existance des mesures ou reéssayez plus tard.</p></div>';
            }

        }

        if (document.getElementById('N-chartContainer')) {
            var Nchart = new CanvasJS.Chart("N-chartContainer", {
                colorSet: "khi-test",
                animationEnabled: (urlParams.get('capability-report') == null),
                exportFileName: "Répartition des occurrences par classe",
                exportEnabled: true,
                theme: "light2",
                title: {
                    text: "Répartition des occurrences par classe",
                    fontSize: 17,
                    fontColor: '#000000',
                    fontFamily: 'Roboto'
                },
                axisY: {
                    title: "",
                    labelFontSize: 13,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto',
                    gridColor: "#ccc",
                },
                axisX: {
                    title: "",
                    labelFontSize: 10,
                    labelFontColor: '#000000',
                    labelFontFamily: 'Roboto'
                },
                toolTip: {
                    fontColor: "#0070c0",
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    cornerRadius: 4,
                    fontWeight: "bold",
                },
                data: [{
                    type: "column",
                    yValueFormatString: "#,##0.##",
                    dataPoints: <?php echo json_encode($chartArrayN, JSON_NUMERIC_CHECK); ?>
                }, ]
            });

            Nchart.render();
        }
    }
</script>

<script src="./assets/js/index.js"></script>
<script src="./assets/js/canvasjs.min.js"></script>
<script src="./assets/js/html2canvas.js"></script>
</body>

</html>