<?php

function archive_date_compare($element1, $element2)
{
    $datetime1 = strtotime(explode('/', $element1)[2] . '-' . explode('/', $element1)[1] . '-' . explode('/', $element1)[0]);
    $datetime2 = strtotime(explode('/', $element2)[2] . '-' . explode('/', $element2)[1] . '-' . explode('/', $element2)[0]);
    return ($datetime1) - $datetime2;
}

function followup_date_compare($element1, $element2)
{
    $datetime1 = strtotime($element1['Date']);
    $datetime2 = strtotime($element2['Date']);
    return $datetime1 - $datetime2;
}

function process_list_date_compare($element1, $element2)
{
    $datetime1 = ($element1['id']);
    $datetime2 = ($element2['id']);
    return $datetime1 > $datetime2;
}
