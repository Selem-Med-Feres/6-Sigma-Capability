<?php
include('../db/db.php');
include('../db/drop-solution.php');
include('../parameter/parameter.php');
include('../db/retrieve-values.php');

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
            <h3>Ça me fait mal de supprimer mon propre travail...</h3>
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

    $drop = isset($_GET['drop']) ? $_GET['drop'] : "";
    $dropAll = isset($_GET['drop-all']) ? $_GET['drop-all'] : "";
    $process = isset($_GET['process']) ? $_GET['process'] : "";

    if ($drop != "") {
        drop_table($conn, $thisInstant, $drop, define_parameter_table());
    } elseif (($dropAll != '') && ($process != '')) {
        drop_archive($conn, $thisInstant, $dropAll, $process, define_parameter_table());
    } else {
        $string = '<script type="text/javascript">';
        $string .= 'window.location = "../../../../"';
        $string .= '</script>';
        echo $string;
    }

    ?>
</body>

</html>