<?php

function get_measurements($conn, $nameVars)
{
    $result = $conn->query("SHOW TABLES LIKE '" . $nameVars . "'");
    if ($result->num_rows >= 1) {
        $sql = "SELECT * FROM `" . $nameVars . "`;";
        $res = $conn->query($sql);

        if ($res->num_rows > 0) {
            $Values = mysqli_fetch_all($res, MYSQLI_ASSOC);
        } else {                                                                          // zid chouf lena chneya theb taamel soit http soit error 
            echo ('<script type="text/javascript">                                                          
                            document.getElementById("table-error").classList.remove("success");
                            document.getElementById("table-error").classList.add("error");
                            document.getElementById("table-error").innerHTML = "Acune valeur trouvée.";
                        </script>');
        }

        return $Values;
    } else {
        die('<style>
            .container{
                display: none;
            }
            </style>
            Ce lien est invalide! Veuillez réessayer ultérieurement.');
    }
}

function get_solution($conn, $outputRead)
{
    if ($result = $conn->query("SHOW TABLES LIKE '" . $outputRead . "'")) {
        if ($result->num_rows >= 1) {
            $sql = "SELECT * FROM `" . $outputRead . "` ORDER BY id;";
            $res = $conn->query($sql);
            if ($res) {
                if ($res->num_rows > 0) {
                    $Values = mysqli_fetch_all($res, MYSQLI_ASSOC);
                } else {
                    $Values = [];
                }
            }
            return $Values;
        }
    }
}

function get_process_details($conn, $detailsTable, $outputRead, int $i)
{
    $sql = 'SELECT * FROM `' . $detailsTable . '` WHERE id="' .  substr($outputRead, 0, strlen($outputRead) - $i) .'"';
    $res = $conn->query($sql);
    if ($res) {
        if ($res->num_rows > 0) {
            $Values = mysqli_fetch_all($res, MYSQLI_ASSOC);
        } else {
            $Values = [];
        }
    }
    return $Values;
}
