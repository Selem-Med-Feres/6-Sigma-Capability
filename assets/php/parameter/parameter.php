<?php

function define_parameter_table()
{
    return 'process_list';
}

function check_parameter_table($conn)
{
    $sql = "SHOW TABLES LIKE '" . define_parameter_table() . "'";
    $res = $conn->query($sql);

    if (mysqli_fetch_array($res)) {
        return false;
    } else {
        return true;
    }
}

function add_parameter_table($conn)
{
    $sql = "CREATE TABLE " . define_parameter_table() . " (
        id TEXT NOT NULL,
        startTime TEXT NOT NULL,
        endTime TEXT NOT NULL,
        prodCadence TEXT NOT NULL,
        normalitySample TEXT NOT NULL,
        sampleSize TEXT NOT NULL,
        measureTime TEXT NOT NULL,
        sampelingCadence TEXT NOT NULL,
        SamplesPerDay TEXT NOT NULL,
        RemainingSamplesThisDay TEXT NOT NULL,
        TS TEXT NOT NULL,
        Cible TEXT NOT NULL,
        TI TEXT NOT NULL,
        samplesForCp TEXT NOT NULL,
        Alpha TEXT NOT NULL,
        PRIMARY key idx_id(id(255))
    )";

    $conn->query($sql);
}

function create_process($conn, string $processName, string $startTime, string $endTime, string $prodCadence, string $normalitySample, string $sampleSize, string $measureTime, string $sampelingCadence, string $TS, string $X, string $TI, string $samplesForCp, string $samplesDerDay, string $alpha)
{
    $sql = 'INSERT INTO ' . define_parameter_table() . ' (id, startTime, endTime, prodCadence, normalitySample, sampleSize, measureTime, sampelingCadence, SamplesPerDay, RemainingSamplesThisDay, TS, Cible, TI, samplesForCp, Alpha) ';
    $sql .= 'VALUES ("' . ucfirst(str_replace(' ', '_', $_POST[$processName])) . '",
    "' . $_POST[$startTime] . '", 
    "' . $_POST[$endTime] . '",
    "' . $_POST[$prodCadence] . '",
    "' . $_POST[$normalitySample] . '", 
    "' . $_POST[$sampleSize] . '", 
    "' . $_POST[$measureTime] . '", 
    "' . $_POST[$sampelingCadence] . '",
    "' . $_POST[$samplesDerDay] . '",
    "' . $_POST[$samplesDerDay] . '",
    "' . $_POST[$TS] . '",
    "' . $_POST[$X] . '", 
    "' . $_POST[$TI] . '", 
    "' . $_POST[$samplesForCp] . '",
    "' . $_POST[$alpha] . '")';

    $conn->query($sql);
}

function insert_excel_into_parameter_table($conn, $namevars, $sampleNbr, $sampleSize, $TS, $Cible, $TI)
{
    $sql = 'SELECT id FROM ' . define_parameter_table() . ' WHERE id=' . str_replace('_values', '', $namevars);
    if (!($conn->query($sql))) {
        $sql = 'INSERT INTO ' . define_parameter_table() . ' (id, N, sampleNbr, Alpha, sampleSize, TS, Cible, TI) 
        VALUES ("' . str_replace('_values', '', $namevars) . '", "'
            . $sampleNbr * $sampleSize . '", "'
            . $sampleNbr . '", "'
            . '5", "'
            . $sampleSize . '", "'
            . $TS . '", "'
            . $Cible . '", "'
            . $TI . '")';

        $conn->query($sql);
    }
}
