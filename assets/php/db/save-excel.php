<?php
include('./db.php');
include('../query/query.php');
include('../parameter/parameter.php');
include('../db/retrieve-values.php');

require '../../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

date_default_timezone_set("Africa/Tunis");
$thisInstant = date("d/m/Y-H:i:s");
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>6σ - Capabilité Processus</title>

    <link rel="stylesheet" type="text/css" href="../../css/font-awsome-all.css">

    <link rel="stylesheet" href="../../css/excel-import.css">
    <link rel="shortcut icon" href="../../img/favicon.png" type="image/x-icon">

</head>

<body>
    <?php

    $allowedExt = 'xlsx';

    $importance = (isset($_GET['importance'])) ? $_GET['importance'] : "new";
    $fileName = isset($_FILES['upload']['name']) ? $_FILES['upload']['name'] : $_FILES['add-method-excel']['name'];
    $fileExt = pathinfo($fileName, PATHINFO_EXTENSION);

    if ($fileExt == $allowedExt) {
        $nameVars = str_replace('.xlsx', '', $fileName);
        $nameVars = str_ireplace(array('output', '\'', '"', ',', ';', '<', '>', '!', '[', '#', '$', '%', '&', '(', ')', '*', '+', '?', '-', '.', '/', ':', '@', '=', '\\', ']', '{', '|', '}', '~'), '', $nameVars);
        $nameVars = str_replace(explode(",", "ç,æ,œ,á,é,í,ó,ú,à,è,ì,ò,ù,ä,ë,ï,ö,ü,ÿ,â,ê,î,ô,û,å,e,i,ø,u"), explode(",", "c,ae,oe,a,e,i,o,u,a,e,i,o,u,a,e,i,o,u,y,a,e,i,o,u,a,e,i,o,u"), $nameVars);
        $nameVars = str_replace(' ', '_', $nameVars);

        $nameKhiTest = $nameVars . '_khitest_' . $thisInstant;
        $nameCapability = $nameVars . '_capability_' . $thisInstant;
        $nameVars .= '_values';
        $nameVarsExists = false;

        if ($importance != 'urgent') {
            $sql = 'SELECT id FROM ' . define_parameter_table();
            $res = $conn->query($sql);
            $processList = mysqli_fetch_all($res, MYSQLI_ASSOC);

            foreach ($processList as $process) {
                if ($process['id'] == str_replace('_values', '', $nameVars)) {
                    $nameVarsExists = true;
                }
            }
        } else {
            $nameVars = (isset($_GET['vars-name'])) ? $_GET['vars-name'] : "";
            $nameKhiTest = $nameVars . '_khitest_' . $thisInstant;
            $nameCapability = $nameVars . '_capability_' . $thisInstant;
            $nameVars .= '_values';
        }

        if ($nameVarsExists) { ?>
            <div class="error">
                <h1><i class="fa-solid fa-circle-exclamation"></i>ERREUR</h1>
                <h2>Ce processus a été déja ajouté ! Veuillez choisir un autre nom ou ajouter vos mesures dans le processus existant.</h2>
                <p>Renommez le fichier Excel et réessayez.</p>
                <a href="../../../">Tableau de Bord</a>
            </div>
        <?php
        } elseif (is_numeric($nameVars[0])) { ?>
            <div class="error">
                <h1><i class="fa-solid fa-circle-exclamation"></i>NOM INVALIDE</h1>
                <h2>Le nom du processus doit commencer par une lettre.</h2>
                <p>Renommez le fichier Excel et réessayez.</p>
                <a href="../../../">Tableau de Bord</a>
            </div>
        <?php
        } elseif (strlen($nameVars) > 48) { ?>
            <div class="error">
                <h1><i class="fa-solid fa-circle-exclamation"></i>NOM INVALIDE</h1>
                <h2>La longueur maximale du nom du processus ne doit pas dépasser 20 caractères.</h2>
                <p>Renommez le fichier Excel et réessayez.</p>
                <a href="../../../">Tableau de Bord</a>
            </div>
        <?php
        } else {
        ?>
            <div class="container">
                <div class="lds-ring">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div class="lds-txt">
                    <h3>Mais pourquoi tant de valeurs ?</h3>
                    <h3>Je déteste mon travail ... <span><i class="fa-solid fa-heart-crack"></i></span></h3>
                </div>
            </div>
    <?php
            $inputFilePath = isset($_FILES['upload']['tmp_name']) ? $_FILES['upload']['tmp_name'] : $_FILES['add-method-excel']['tmp_name'];
            $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($inputFilePath);
            $data = $spreadsheet->getActiveSheet()->toArray();

            $nbrEch = str_replace(',', '.', $data[0][1]);
            $nbrVarsEch = str_replace(',', '.', $data[1][1]);
            $TS = str_replace(',', '.', $data[3][1]);
            $cible = str_replace(',', '.', $data[4][1]);
            $TI = str_replace(',', '.', $data[5][1]);
            $TempsPrel = str_replace(',', '.', $data[6][1]);

            if (check_parameter_table($conn)) {
                add_parameter_table($conn);
            }

            insert_excel_into_parameter_table($conn, $nameVars, $nbrEch, $nbrVarsEch, $TS, $cible, $TI);
            $nameVars .= '_' . $thisInstant;

            $namesTable = "CREATE TABLE `" . $nameVars . "`(
                    id TEXT NOT NULL,
                    value TEXT NOT NULL,
                    PRIMARY KEY idx_id(id(255))
                )";

            $capabilityTable = "CREATE TABLE `" . $nameCapability . "`(
                    id TEXT NOT NULL,
                    value TEXT NOT NULL,
                    PRIMARY KEY idx_id(id(255))
                )";

            $tables = [$namesTable, $capabilityTable];
            foreach ($tables as $table) {
                $conn->query($table);
            }

            $sqlSampleTime = "INSERT INTO `" . $nameCapability . "` (id, value) VALUES ('sampleTime', '" . $TempsPrel . "')";
            $conn->query($sqlSampleTime);

            for ($i = 3; $i <= ($nbrEch + 2); $i++) {
                for ($j = 1; $j <= $nbrVarsEch; $j++) {
                    $id = ($i - 2) . ':' . $j;
                    $value = str_replace(',', '.', $data[$j][$i]);

                    $sql = "INSERT INTO `" . $nameVars . "` (id, value) VALUES ('" . $id . "', '" . $value . "')";
                    $conn->query($sql);
                }
            }

            $sql = "CREATE TABLE `" . $nameKhiTest . "`(
                    id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                    Intervalle TEXT,
                    Min TEXT,
                    Max TEXT,
                    Centre TEXT,
                    Ni TEXT,
                    NiXi TEXT,
                    NiXi_XSQR TEXT,
                    Zmax TEXT,
                    P TEXT,
                    Npi TEXT,
                    Ni_Npi TEXT,
                    Ni_NpiSQR TEXT,
                    Ni_NpiSQRNpi TEXT
                )";

            if ($conn->query($sql)) {
                $alpha = get_process_details($conn, define_parameter_table(), $nameVars, 27);

                if ($importance != 'urgent') {
                    header('Location: ' . str_replace('db/save-excel.php', 'calc/che-test.php/?calculate=' . $nameVars . '&nrml-risk=' . $alpha[0]['Alpha'], get_url()));
                } else {
                    $string = '<script type="text/javascript">';
                    $string .= 'window.location = "../../../assets/php/calc/che-test.php/?calculate=' . $nameVars . '&nrml-risk=' . $alpha[0]['Alpha'] . '"';
                    $string .= '</script>';

                    echo $string;
                }
            }
            echo $conn->error;
        }
    } else {
        header('Location: ../../../');
    }

    ?>

    <div class="copyright">
        <div class="photo">
            <img src="../../../assets/img/author.png">
            <img src="../../../assets/img/author2.png">
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
</body>

</html>