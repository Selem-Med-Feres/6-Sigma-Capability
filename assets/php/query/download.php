<?php
include_once('../db/db.php');
include_once('../db/retrieve-values.php');
require('../../../vendor/autoload.php');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

function getNameFromNumber($num)
{
    $numeric = ($num - 1) % 26;
    $letter = chr(65 + $numeric);
    $num2 = intval(($num - 1) / 26);
    if ($num2 > 0) {
        return getNameFromNumber($num2) . $letter;
    } else {
        return $letter;
    }
}

$from = isset($_GET['download']) ? $_GET['download'] : '';
$fileName = $from . '.xlsx';

$normality = get_solution($conn, $from . '_khitest');
$initialValues = get_solution($conn, $from . '_values');
$capability = get_solution($conn, $from . '_capability');

$CapabilityArray = [];
$DataArray = [];

foreach ($initialValues as $initialValue) {
    $DataArray[$initialValue['id']] = $initialValue['value'];
}

foreach ($capability as $capabilityIndicator) {
    $CapabilityArray[$capabilityIndicator['id']] = $capabilityIndicator['value'];
}

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

$spreadsheet->getProperties()
    ->setCreator("Selem Med Feres")
    ->setLastModifiedBy("Marai Jihen")
    ->setTitle("3-GSIL-QM 2022 - 2023")
    ->setSubject("Projet MSQ")
    ->setDescription("Développé avec amour, par Selem Med Feres & Marai Jihen")
    ->setKeywords("MSQ PHP OUTPUT GSIL ENICAR")
    ->setCategory("Ficher OUTPUT");

$MSQsheet = new Worksheet(null, $from);
$spreadsheet->addSheet($MSQsheet, 0);
$spreadsheet->removeSheetByIndex(1);

$MSQsheet->setCellValue('A1', getNameFromNumber($CapabilityArray['sampleNbr']));
$MSQsheet->mergeCells('A1:' . getNameFromNumber($CapabilityArray['sampleNbr']) . '1');

$spreadsheet->getActiveSheet()->getStyle('A1:M1')->getFont()->getColor()->setRGB('FFFFFFFF');
$spreadsheet->getActiveSheet()->getStyle('A1:M1')->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
$spreadsheet->getActiveSheet()->getStyle('A1:M1')->getFill()->getStartColor()->setRGB('ff0070c0');



$MSQsheet->setCellValue('B1', 'Product Name');
$MSQsheet->setCellValue('C1', 'Quantity');
$MSQsheet->setCellValue('D1', 'Price');
$MSQsheet->setCellValue('E1', 'Subtotal');

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="' . $fileName . '"');

$writer = new Xlsx($spreadsheet);
$writer->save("php://output");

exit();
