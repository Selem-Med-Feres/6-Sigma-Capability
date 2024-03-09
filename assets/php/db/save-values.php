<?php
include('./db.php');
include('./retrieve-values.php');
include('../query/query.php');
include('../parameter/parameter.php');

date_default_timezone_set("Africa/Tunis");
$thisInstant = date("d/m/Y-H:i:s");

$allValuesIsset = true;
$nameVars =  $_POST['namevars'] . '_values_' . $thisInstant;
$nameKhiTest = $_POST['namevars'] . '_khitest_' . $thisInstant;
$nameCapability = $_POST['namevars'] . '_capability_' . $thisInstant;

$lastValueInserted = 0;

for ($i = 0; $i < $_POST['echvars']; $i++) {
    for ($j = 0; $j < $_POST['nbrvarsech']; $j++) {
        if (!isset($_POST['vars-value-' . ($i + 1) . '-' . ($j + 1)])) {
            $allValuesIsset = false;
        }
    }
}

if ($allValuesIsset) {
    $process = get_process_details($conn, define_parameter_table(), $nameVars, 27);

    $namesTable = "CREATE TABLE `" . strtolower($nameVars) . "`(
        id TEXT NOT NULL,
        value TEXT NOT NULL,
        PRIMARY KEY idx_id(id(255))
    )";

    $capabilityTable = "CREATE TABLE `" . strtolower($nameCapability) . "`(
        id TEXT NOT NULL,
        value TEXT NOT NULL,
        PRIMARY KEY idx_id(id(255))
    )";

    $conn->query($namesTable);
    $conn->query($capabilityTable);

    $purposeString = '';
    if ($process[0]['RemainingSamplesThisDay'] == 1) {
        $purposeString = 'CalcPp';
    }
    if ((($process[0]['SamplesPerDay'] - $process[0]['RemainingSamplesThisDay']) % ($process[0]['samplesForCp']))==0) {
        $purposeString = 'CalcCp';
        if ($process[0]['RemainingSamplesThisDay'] == 1) {
            $purposeString .= ',CalcPp';
        }
    }
    if ($process[0]['SamplesPerDay'] == $process[0]['RemainingSamplesThisDay']) {
        $purposeString = 'normality';
    }
    if ($purposeString == '') {
        $purposeString = 'check';
    }

    $purpose = "INSERT INTO `" . $nameCapability . "` (id, value) VALUES ('purpose', '" . $purposeString . "')";
    $conn->query($purpose);

    $sql = "UPDATE " . define_parameter_table() . " SET RemainingSamplesThisDay='" . ($process[0]['RemainingSamplesThisDay'] - 1) . "' WHERE id='"  .  substr($nameVars, 0, strlen($nameVars) - 27) . "'";
    $conn->query($sql);

    for ($i = 0; $i < $_POST['echvars']; $i++) {
        for ($j = 0; $j < $_POST['nbrvarsech']; $j++) {
            $id = ($i + 1) . ':' . ($j + 1);
            $Value = ($_POST['vars-value-' . ($i + 1) . '-' . ($j + 1)]);
            $sql = 'INSERT INTO `' . $nameVars . '` (id, value) VALUES ("' . $id . '", "' . $Value . '")';

            if ($conn->query($sql)) {
                if ($lastValueInserted == ($_POST['nbrvars'] - 1)) {
                    $sql = "CREATE TABLE `" . strtolower($nameKhiTest) . "`(
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

                    if ($purposeString == 'normality') {
                        $conn->query($sql);
                    }

                  header('Location: ' . str_replace('db/save-values.php', 'calc/che-test.php/?calculate=' . $nameVars . '&nrml-risk=' . $process[0]['Alpha'], get_url()));
                }
            } else {
                echo $conn->error . '<br>';
            }
            $lastValueInserted += 1;
        }
    }
}
