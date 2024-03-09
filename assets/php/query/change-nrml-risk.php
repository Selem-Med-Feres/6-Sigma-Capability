<?php
include('../db/db.php');
include('../db/retrieve-values.php');
include('../parameter/parameter.php');
include('../query/query.php');

$outputRead = isset($_GET['table']) ? $_GET['table'] : "";
$nrmlRisk = isset($_GET['nrml-risk']) ? $_GET['nrml-risk'] : "";

$toDelete = [];
$values = get_solution($conn, str_replace('_date', '_capability', $outputRead));

foreach ($values as $value) {
    if ($value['id'] != 'purpose') {
        array_push($toDelete, $value['id']);
    }
}

$sql = "UPDATE " . define_parameter_table() . " SET Alpha='" . $nrmlRisk . "' WHERE id='" . get_process_details($conn, define_parameter_table(), $outputRead, 25)[0]['id'] . "'";
$conn->query($sql);



foreach ($toDelete as $delete) {
    $sql = "DELETE FROM `" . str_replace('_date', '_capability', $outputRead) . "` WHERE id='" . $delete . "'";
    $conn->query($sql);
}

$sql = "TRUNCATE TABLE `" . str_replace('_date', '_khitest', $outputRead) . "`";
$conn->query($sql);



header('Location: ' . str_replace('query/change-nrml-risk.php', 'calc/che-test.php/?calculate=' . str_replace('_date', '_values', $outputRead) . '&nrml-risk=' . $nrmlRisk, get_url()));
