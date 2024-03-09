<?php
include('./db.php');
include('../parameter/parameter.php');

$allIsSet = false;

if (
    isset($_POST['process-name-review'])
    && isset($_POST['starting-time'])
    && isset($_POST['ending-time'])
    && isset($_POST['process-cadence'])
    && isset($_POST['first-sample-size-review'])
    && isset($_POST['sample-size-review'])
    && isset($_POST['measuring-time'])
    && isset($_POST['sampeling-cadence'])
    && isset($_POST['max-value-accepted-process'])
    && isset($_POST['cible-process'])
    && isset($_POST['min-value-accepted-process'])
    && isset($_POST['cp-cadence'])
    && isset($_POST['samples-per-day'])
    && isset($_POST['alpha'])
) {
    $allIsSet = true;
}

if ($allIsSet) {
    if (check_parameter_table($conn)) {
        add_parameter_table($conn);
    }  

    create_process($conn, 'process-name-review', 'starting-time', 'ending-time', 'process-cadence', 'first-sample-size-review', 'sample-size-review', 'measuring-time', 'sampeling-cadence', 'max-value-accepted-process', 'cible-process', 'min-value-accepted-process', 'cp-cadence', 'samples-per-day', 'alpha');
    header('Location: ../../../');
}
