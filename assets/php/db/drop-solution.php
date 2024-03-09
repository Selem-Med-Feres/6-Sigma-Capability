<?php

use LDAP\Result;

function drop_table($conn, $thisInstant, $drop, $parameter_table, int $int = 1)
{
    $drop = strtolower($drop);
    
    $nameVars =  str_replace('_date', '_values', $drop);
    $nameKhiTest = str_replace('_date', '_khitest', $drop);
    $nameCapability = str_replace('_date', '_capability', $drop);

    $process = get_process_details($conn, define_parameter_table(), $nameVars, 27);

    $string = '<script type="text/javascript">';
    $string .= 'window.location = "../../../../?archive=' . (substr($drop, -19, -9)) . '&process=' . ucfirst(substr($drop, 0, -25)) . '"';
    $string .= '</script>';

    $sql = 'DROP TABLE `' . $nameVars . '`, `' . $nameKhiTest . '`, `' . $nameCapability . '`;';
    $conn->query($sql);

    if ($result = $conn->query("SHOW TABLES LIKE '" . substr($drop, 0, strlen($drop) - 25) . "%'")) {
        if ($result->num_rows  == 0) {
            $conn->query('DELETE FROM ' . $parameter_table . ' WHERE id="' . substr(ucfirst($drop), 0, strlen($drop) - 25) . '"');

            $string = '<script type="text/javascript">';
            $string .= 'window.location = "../../../../"';
            $string .= '</script>';
        } else {
            if (substr($thisInstant, 0, -9) == (substr($drop, -19, -9))) {
                $sql = "UPDATE " . define_parameter_table() . " SET RemainingSamplesThisDay='" . ($process[0]['RemainingSamplesThisDay'] + 1) . "' WHERE id='"  .  substr($nameVars, 0, strlen($nameVars) - 27) . "'";
                $conn->query($sql);
            }
        }
    }

    if ($int == 1) {
        echo $string;
    }
}

function drop_archive($conn, $thisInstant, $dropAll, $process, $parameter_table, int $int = 0)
{
    $drop = $process . '_values_' . $dropAll . '-%';

    $sql = "SHOW TABLES LIKE '" . $drop . "'";
    $res = $conn->query($sql);
    $toDrop = mysqli_fetch_all($res);

  if (sizeof($toDrop) > 0){
    foreach ($toDrop as $dropping) {
        drop_table($conn, $thisInstant, str_replace('values', 'date', $dropping[0]), $parameter_table, $int);
    }
  }
   else {
	$conn->query('DELETE FROM ' . $parameter_table . ' WHERE id="' . (ucfirst($process)) . '"');
   }

  
    $string = '<script type="text/javascript">';
    $string .= 'window.location = "../../../../"';
    $string .= '</script>';

    echo $string;
}
