let tables = document.querySelectorAll('.table');
let archives = document.querySelectorAll('.archive');
let confirmation = document.getElementById('confirm-measurement');
let final = document.getElementById('final');
let varsNbrForm = document.getElementById('vars-nbr-form');
let measurement = document.getElementById('measurement');
let measurementConfirmation = document.getElementById('measurement-confirmation');
let confirmationOverlay = document.getElementById('confirmation-overlay');
let values = document.querySelectorAll('.value');
let TI = document.getElementById('min-value-accepted');
let Cible = document.getElementById('cible');
let TS = document.getElementById('max-value-accepted');
let khiConclusion = document.querySelectorAll('#khi-conclusion *');
let samples = document.querySelectorAll('#measurement .sample-container');
let sampleName = document.getElementById('vars-name');
let sampleNbr = document.getElementById('vars-ech');
let sampleSize = document.getElementById('vars-nbr');
let sampleTimeInput = document.getElementById('sample-time');
let sampleTimeContainer = document.getElementById('sample-time-label');
let consecutive = document.getElementById('consecutive');
let consecutiveContainer = document.getElementById('consecutive-container');
let sampleTimeLabel = document.getElementById('hidden-label');
let khiConclusionTR = document.querySelector('#khi-conclusion table tbody tr:last-child');
let khiConclusionTable = document.querySelector('#khi-conclusion table');
let dropDB = document.getElementById('drop-db');
let confirmDrop = document.getElementById('confirm-drop');
let addMethod = document.getElementById('add-method');
let addConfirmation = document.getElementById('add-confirmation');
let dropOverlay = document.getElementById('drop-overlay');
let addOverlay = document.getElementById('add-overlay');
let addConfirmationOverlay = document.getElementById('add-confirmation-overlay');
let cancelDropDB = document.getElementById('cancel-drop-db');
let manualAdd = document.getElementById('manual-add');
let confirmAdd = document.getElementById('confirm-add');
let cancelAdd = document.getElementById('cancel-add');
let excelAdd = document.getElementById('excel-add');
let scrollTop = document.getElementById('scroll-top');
let scrollNormality = document.getElementById('scroll-normality');
let scrollCapability = document.getElementById('scroll-capability');
let scrollMaps = document.getElementById('scroll-maps');
let navBubbles = document.getElementById('nav-bubbles');
let infoExcel = document.getElementById('show-info-excel');
let infoExelBox = document.getElementById('excel-info');
let excelOverlay = document.getElementById('excel-overlay');
let contextMenu = document.getElementById('context-menu-tables');
let contextMenuItems = document.querySelectorAll('#existing-tables #context-menu-tables .item');
let contextMenuArchive = document.getElementById('context-menu-archive');
let contextMenuItemsArchive = document.querySelectorAll('#existing-tables #context-menu-archive .item');
let nrmlRisk = document.getElementById('nrml-risk');
let addTable = document.querySelectorAll('.existing-tables .process-capabilities .add-table');
let addMethodExcel = document.getElementById('add-method-excel');
let addMethodExcelLabel = document.getElementById('add-method-excel-label');
let excelHiddenLabel = document.getElementById('excel-hidden-label');
let followUpOverlay = document.getElementById('follow-up-overlay');
let sampelingPlanning = document.getElementById('sampeling-planning');
let newProcessForm = document.getElementById('new-process-form');

const urlParams = new URLSearchParams(window.location.search);

if (khiConclusionTR) {
    khiConclusionTR.style.height = (400 - (khiConclusionTable.clientHeight)) + 'px'
}


if (document.getElementById('download-btn-pdf')) {
    document.getElementById('download-btn-pdf').addEventListener('click', (e) => {
        e.preventDefault();
        html2canvas(document.getElementById('solution'), { scale: 4 }).then(

            function (canvas) {
                var dataURL = canvas.toDataURL();
                var width = canvas.width / 4;
                var printWindow = window.open('', 'PRINT', 'height=' + window.clientHeight + ',width=' + width);

                printWindow.document.write("<img id='Image' src=" + dataURL + " style='width :" + width + ";'></img>");
                printWindow.document.write("<p id='copyright' style='width :" + width + "; text-align: end; font-family: roboto;'>Made with ❤️ by <b>Selem M<sup>ed</sup> Feres</b> & <b>Marai Jihen</b></p>");
                printWindow.document.close();

                printWindow.addEventListener('load', () => {
                    printWindow.focus();
                    printWindow.print();
                    printWindow.close();
                })
            })
    })
}

if (urlParams.get('capability-report') != null) {
    if ((document.querySelectorAll('#trigger')) && (document.querySelectorAll('.archive-sammuary-content table'))) {
        let CpNumber = 0;
        let CpCaseColspan = 0;
        let TotalColSpan = 0;

        Array.from(document.querySelectorAll('.archive-sammuary-content table thead tr th')).forEach(col => {
            TotalColSpan += parseInt(col.colSpan);
        });
        TotalColSpan = TotalColSpan / 2;

        Array.from(document.querySelectorAll('#Cp-row-sammuary td')).forEach(CpCase => {
            CpNumber += 1
            CpCaseColspan += CpCase.colSpan;
        });
        CpNumber -= 1;

        if (CpCaseColspan != TotalColSpan) {
            document.getElementById('Cp-row-sammuary').innerHTML += '<td colspan="' + String(TotalColSpan - CpCaseColspan) + '"> - </td>';
        }

        for (j = 0; j < Array.from(document.querySelectorAll('table tbody tr')).length; j++) {
            bodyTds = Array.from(document.querySelectorAll('table tbody tr:nth-child(' + (j + 1) + ') .value-row-sammuary'));
            for (let i = 1; i < (TotalColSpan); i++) {
                if ((i) % ((CpCaseColspan - 1) / CpNumber) == 0) {
                    if (bodyTds[i - 1]) {
                        bodyTds[i - 1].style.borderRight = 'solid 2px #0070c0';
                    }
                }
            }
        }
    }
}

if (document.getElementById('capa-report-not-ready')) {
    document.getElementById('solution').style.position = 'relative';
    document.getElementById('solution').style.minHeight = '75vh';
}

if (urlParams.get('archive-sammuary') == 'show') {
    document.querySelector('body').classList.add('overflow');
    varsNbrForm.classList.add('blur');

    if ((urlParams.get('process') != null) && (urlParams.get('archive') != null)) {
        document.getElementById('process-header').classList.add('blur');
        document.getElementById('process-capabilities').classList.add('blur');
    } else if ((urlParams.get('history') != null) && (urlParams.get('of') != null)) {
        document.querySelectorAll('.process').forEach(process => {
            process.classList.add('blur');
        });
    }

    if ((document.querySelectorAll('#trigger')) && (document.querySelectorAll('.archive-sammuary-content table'))) {
        let CpNumber = 0;
        let CpCaseColspan = 0;
        let TotalColSpan = 0;

        Array.from(document.querySelectorAll('table thead tr th')).forEach(col => {
            TotalColSpan += parseInt(col.colSpan);
        });
        TotalColSpan = TotalColSpan / 2;

        Array.from(document.querySelectorAll('#Cp-row-sammuary td')).forEach(CpCase => {
            CpNumber += 1
            CpCaseColspan += CpCase.colSpan;
        });
        CpNumber -= 1;

        if (CpCaseColspan != TotalColSpan) {
            document.getElementById('Cp-row-sammuary').innerHTML += '<td colspan="' + String(TotalColSpan - CpCaseColspan) + '"> - </td>';
        }

        for (j = 0; j < Array.from(document.querySelectorAll('table tbody tr')).length; j++) {
            bodyTds = Array.from(document.querySelectorAll('table tbody tr:nth-child(' + (j + 1) + ') .value-row-sammuary'));
            for (let i = 1; i < (TotalColSpan); i++) {
                if ((i) % ((CpCaseColspan - 1) / CpNumber) == 0) {
                    if (bodyTds[i - 1]) {
                        bodyTds[i - 1].style.borderRight = 'solid 2px #0070c0';
                    }
                }
            }
        }
    }
}

if (urlParams.get('archive-maps') == 'show') {
    document.querySelector('#archive-control-maps-container .title-container i:first-child').style.display = 'none';

    if (document.getElementById('e-map-conclusion-tr')) {
        document.getElementById('e-map-conclusion-tr').style.display = 'none';
    }

    if ((urlParams.get('archive-maps') == 'show') && (urlParams.get('process') != null) && ((urlParams.get('archive') != null))) {
        document.querySelector('body').classList.add('overflow');
        varsNbrForm.classList.add('blur');
        document.getElementById('process-capabilities').classList.add('blur');
        document.getElementById('process-header').classList.add('blur');
    } else {
        document.querySelector('body').classList.add('overflow');
        varsNbrForm.classList.add('blur');
        document.querySelectorAll('.process').forEach(process => {
            process.classList.add('blur');
        });
    }

    var styleElement = document.createElement("style");
    styleElement.appendChild(document.createTextNode("::-webkit-scrollbar-track{border-radius : 0 4px 4px 0;}::-webkit-scrollbar-thumb{border-radius : 0 4px 4px 0;}"));
    document.getElementsByTagName("head")[0].appendChild(styleElement);

    document.getElementById('archive-maps-overlay').addEventListener('click', () => {
        if ((urlParams.get('archive-maps') == 'show') && (urlParams.get('process') != null) && ((urlParams.get('archive') != null))) {
            window.location = './?archive=' + urlParams.get('archive') + '&process=' + urlParams.get('process') + '&khi=' + urlParams.get('khi');
        } else {
            window.location = './';
        }
    });


    document.querySelector('#archive-control-maps-container .title-container i:last-child').addEventListener('click', () => {
        document.querySelector('#archive-control-maps-container .title-container h3:first-child').style.transform = 'translateX(-200%)';
        document.querySelector('#archive-control-maps-container .title-container h3:last-child').style.transform = 'translateX(-200%)';
        document.getElementById('dispertion-maps').style.transform = 'translateX(-200%)';
        document.querySelector('#archive-control-maps-container .title-container i:last-child').style.display = 'none';
        document.querySelector('#archive-control-maps-container .title-container i:first-child').style.display = 'block';

        if (document.getElementById('e-map-conclusion-tr')) {
            document.getElementById('e-map-conclusion-tr').style.display = 'table-row';
        }
        if (document.getElementById('s-map-conclusion-tr')) {
            document.getElementById('s-map-conclusion-tr').style.display = 'none';
        }

    });

    document.querySelector('#archive-control-maps-container .title-container i:first-child').addEventListener('click', () => {
        document.querySelector('#archive-control-maps-container .title-container h3:first-child').style.transform = 'translateX(0%)';
        document.querySelector('#archive-control-maps-container .title-container h3:last-child').style.transform = 'translateX(0%)';
        document.getElementById('dispertion-maps').style.transform = 'translateX(0%)';
        document.querySelector('#archive-control-maps-container .title-container i:last-child').style.display = 'block';
        document.querySelector('#archive-control-maps-container .title-container i:first-child').style.display = 'none';

        if (document.getElementById('s-map-conclusion-tr')) {
            document.getElementById('s-map-conclusion-tr').style.display = 'table-row';
        }
        if (document.getElementById('e-map-conclusion-tr')) {
            document.getElementById('e-map-conclusion-tr').style.display = 'none';
        }

    });

}

if ((urlParams.get('follow-up') != null) || (urlParams.get('details') != null) || (urlParams.get('planning') != null) || (urlParams.get('archive-follow-up'))) {
    if ((urlParams.get('process') != null) && ((urlParams.get('archive') != null))) {
        document.querySelector('body').classList.add('overflow');
        varsNbrForm.classList.add('blur');
        document.getElementById('process-capabilities').classList.add('blur');
        document.getElementById('process-header').classList.add('blur');
    }
    else {
        document.querySelector('body').classList.add('overflow');
        varsNbrForm.classList.add('blur');
        document.querySelectorAll('.process').forEach(process => {
            process.classList.add('blur');
        });
    }
}

if (newProcessForm) {
    document.getElementById('min-value-accepted-process').addEventListener('change', () => {
        if (document.getElementById('max-value-accepted-process').value) {
            if (parseFloat(document.getElementById('min-value-accepted-process').value) >= parseFloat(document.getElementById('max-value-accepted-process').value)) {
                document.getElementById('min-value-accepted-process').value = NaN;
                alert('La tolérance inférieure (TI) doit être inférieure à la tolérance superieure (TS).')
            }
        }

        if (Cible.value) {
            if (parseFloat(document.getElementById('min-value-accepted-process').value) >= parseFloat(Cible.value)) {
                document.getElementById('min-value-accepted-process').value = NaN;
                alert('La tolérance inférieure (TI) doit être inférieure à la cible.')
            }
        }
    });

    document.getElementById('max-value-accepted-process').addEventListener('change', () => {
        if (document.getElementById('min-value-accepted-process').value) {
            if (parseFloat(document.getElementById('max-value-accepted-process').value) <= parseFloat(document.getElementById('min-value-accepted-process').value)) {
                document.getElementById('max-value-accepted-process').value = NaN;
                alert('La tolérance superieure (TS) doit être supérieure à la tolérance inférieure (TI).')
            }
        }

        if (Cible.value) {
            if (parseFloat(document.getElementById('max-value-accepted-process').value) <= parseFloat(Cible.value)) {
                document.getElementById('max-value-accepted-process').value = NaN;
                alert('La tolérance superieure (TS) doit être supérieure à la cible.')
            }
        }
    });

    document.getElementById('cible-process').addEventListener('change', () => {
        if (document.getElementById('max-value-accepted-process').value) {
            if (parseFloat(document.getElementById('cible-process').value) >= parseFloat(document.getElementById('max-value-accepted-process').value)) {
                document.getElementById('cible-process').value = NaN;
                alert('La cible doit être inférieure à la tolérance superieure (TS).')
            }
        }

        if (document.getElementById('min-value-accepted-process').value) {
            if (parseFloat(document.getElementById('min-value-accepted-process').value) >= parseFloat(document.getElementById('cible-process').value)) {
                document.getElementById('cible-process').value = NaN;
                alert('La cible doit être supérieure à la tolérance inférieure (TI)')
            }
        }
    });

    document.querySelector('#sample-size-review').addEventListener('input', () => {
        if (document.querySelector('.new-process-form .measuring-time-div input').value != '') {
            document.querySelector('.new-process-form .measuring-time-div input').value = '';
            document.querySelector('.new-process-form .measuring-time-div input').dispatchEvent(new Event('change', { bubbles: true }));
        }
    });

    document.querySelector('.new-process-form .ending-time-div input').addEventListener('change', () => {
        document.querySelector('.new-process-form .process-cadence-div input').value = '';
        document.querySelector('.new-process-form .process-cadence-div input').dispatchEvent(new Event('change', { bubbles: true }));
    });

    document.querySelector('.new-process-form .starting-time-div input').addEventListener('change', () => {
        document.querySelector('.new-process-form .process-cadence-div input').value = '';
        document.querySelector('.new-process-form .process-cadence-div input').dispatchEvent(new Event('change', { bubbles: true }));
    });

    document.querySelector('.new-process-form .process-cadence-div input').addEventListener('change', () => {
        document.querySelector('.new-process-form .measuring-time-div input').value = '';
        document.querySelector('.new-process-form .sampeling-cadence-div input').value = '';
        document.querySelector('.new-process-form .cp-cadence-div input').value = '';
        document.querySelector('.new-process-form .cp-cadence-div input').dispatchEvent(new Event('input', { bubbles: true }));
    });

    document.querySelector('.new-process-form .measuring-time-div input').addEventListener('change', () => {
        if (!(document.querySelector('.new-process-form .process-cadence-div input').value > 0)) {
            alert('ERREUR : Veuillez renseigner la cadence de la production.');
            document.querySelector('.new-process-form .measuring-time-div input').value = '';
        } else {
            let sampelingTime = 0;
            if (parseInt(document.querySelector('.new-process-form .process-cadence-div input').value) <= parseInt(document.querySelector('.new-process-form .measuring-time-div input').value)) {
                sampelingTime = parseInt(document.querySelector('.new-process-form .process-cadence-div input').value)
                    + (parseInt(document.querySelector('.new-process-form .measuring-time-div input').value) *
                        parseInt(document.querySelector('.new-process-form #sample-size-review').value));
            } else {
                sampelingTime = (parseInt(document.querySelector('.new-process-form .process-cadence-div input').value) * parseInt(document.querySelector('.new-process-form #sample-size-review').value)) + parseInt(document.querySelector('.new-process-form .measuring-time-div input').value);
            }
            sampelingTime /= 3600;

            let [startingHour, startingMinute] = ((document.querySelector('.new-process-form .starting-time-div input').value).split(":"));
            let [endingHour, endingMinute] = (document.querySelector('.new-process-form .ending-time-div input').value).split(":");

            startingHour = parseInt(startingHour);
            endingHour = parseInt(endingHour);
            startingMinute = parseInt(startingMinute);
            endingMinute = parseInt(endingMinute);

            let startingSecond = 0;

            if (endingHour < startingHour) {
                endingHour = (endingHour) + 24;
            }

            if ((endingHour == startingHour) && (endingMinute <= startingMinute)) {
                endingHour = (endingHour) + 24;
            }

            endingMinute += (endingHour) * 60;

            if (parseInt(document.getElementById('measuring-time').value) <= parseInt(document.getElementById('process-cadence').value)) {
                startingSecond += parseInt(document.getElementById('measuring-time').value);
                adding = parseInt(document.getElementById('process-cadence').value);
            } else {
                adding = parseInt(document.getElementById('measuring-time').value);
                startingSecond += parseInt(document.getElementById('process-cadence').value);
            }

            for (let i = 0; i < parseInt(document.getElementById('first-sample-size-review').value); i++) {
                startingSecond += adding;
                while (startingSecond >= 60) {
                    startingMinute = (startingMinute) + 1;
                    startingSecond -= 60;
                    while ((startingMinute) >= 60) {
                        startingHour = ((startingHour) + 1);
                        startingMinute = ((startingMinute) - 60);
                    }
                }
            }

            startingMinute += (startingHour) * 60;
            CpShiftTime = ((endingMinute) - (startingMinute)) / 60;

            if (CpShiftTime <= 0) {
                alert('ERREUR : Le temps de production et de mesure du premier échantillon dépasses les heures de travail. Réduisez la taille de l\'échantillon ou optimisez le temps de mesure.');
                document.querySelector('.new-process-form .measuring-time-div input').value = '';
            }

            if (((0.5 * (Math.floor(2.0 * sampelingTime)) + 0.5) <= (CpShiftTime))) {
                document.querySelector('.new-process-form .sampeling-cadence-div input').setAttribute('min', String(0.5 * (Math.floor(2.0 * sampelingTime)) + 0.5));
                document.querySelector('.new-process-form .sampeling-cadence-div input').setAttribute('max', String(0.5 * (Math.floor(2.0 * CpShiftTime)) - 0.25));
            } else if (document.querySelector('.new-process-form .measuring-time-div input').value != '') {
                alert('ERREUR : Veuillez vérifier les données renseignées.');
                document.querySelector('.new-process-form .measuring-time-div input').value = '';
            }
        }

        document.querySelector('.new-process-form .sampeling-cadence-div input').value = '';
        document.querySelector('.new-process-form .cp-cadence-div input').value = '';
        document.querySelector('.new-process-form .cp-cadence-div input').dispatchEvent(new Event('input', { bubbles: true }));
    });

    document.querySelector('.new-process-form .sampeling-cadence-div input').addEventListener('change', () => {
        if (!(document.querySelector('.new-process-form .measuring-time-div input').value > 0)) {
            alert('ERREUR : Veuillez renseigner le temps de mesure.');
            document.querySelector('.new-process-form .sampeling-cadence-div input').value = '';
        }

        if (parseFloat(document.querySelector('.new-process-form .sampeling-cadence-div input').value) < parseFloat(document.querySelector('.new-process-form .sampeling-cadence-div input').min)) {
            alert('La fréquence de prélèvement minimale est d\'un échantillon chaque ' + document.querySelector('.new-process-form .sampeling-cadence-div input').min + ' heures')
            document.querySelector('.new-process-form .sampeling-cadence-div input').value = document.querySelector('.new-process-form .sampeling-cadence-div input').min;
        }

        if (parseFloat(document.querySelector('.new-process-form .sampeling-cadence-div input').value) > parseFloat(document.querySelector('.new-process-form .sampeling-cadence-div input').max)) {
            alert('La fréquence de prélèvement maximale est d\'un échantillon chaque ' + document.querySelector('.new-process-form .sampeling-cadence-div input').max + ' heures')
            document.querySelector('.new-process-form .sampeling-cadence-div input').value = document.querySelector('.new-process-form .sampeling-cadence-div input').max;
        }

        document.querySelector('.new-process-form .cp-cadence-div input').value = '';
        document.querySelector('.new-process-form .cp-cadence-div input').dispatchEvent(new Event('input', { bubbles: true }));
    });

    document.querySelector('.new-process-form .cp-cadence-div input').addEventListener('input', () => {
        if (document.querySelector('.new-process-form .cp-cadence-div input').value) {
            if ((parseFloat((document.querySelector('.new-process-form .sampeling-cadence-div input').value)) > 0)
                && (parseFloat((document.querySelector('.new-process-form .measuring-time-div input').value)) > 0)) {
                let dataPointsArray = [];
                let CpCounter = 1;

                if (((document.querySelector('.new-process-form .starting-time-div input').value).length == 5)
                    && ((document.querySelector('.new-process-form .ending-time-div input').value).length == 5)) {
                    let [startingHour, startingMinute] = ((document.querySelector('.new-process-form .starting-time-div input').value).split(":"));
                    let [endingHour, endingMinute] = (document.querySelector('.new-process-form .ending-time-div input').value).split(":");
                    let startingSecond = 0;

                    if (parseInt(endingHour) < parseInt(startingHour)) {
                        endingHour = String((parseInt(endingHour)) + 24);
                    }
                    if ((endingHour == startingHour) && (endingMinute <= startingMinute)) {
                        endingHour = String((parseInt(endingHour)) + 24);
                    }

                    if (parseInt(document.getElementById('measuring-time').value) <= parseInt(document.getElementById('process-cadence').value)) {
                        startingSecond += parseInt(document.getElementById('measuring-time').value);
                        adding = parseInt(document.getElementById('process-cadence').value);
                    } else {
                        adding = parseInt(document.getElementById('measuring-time').value);
                        startingSecond += parseInt(document.getElementById('process-cadence').value);
                    }

                    for (let i = 0; i < parseInt(document.getElementById('first-sample-size-review').value); i++) {
                        startingSecond += adding;
                        while (startingSecond >= 60) {
                            startingMinute = String(parseInt(startingMinute) + 1)
                            startingSecond -= 60;
                            while (parseInt(startingMinute) >= 60) {
                                startingHour = String(parseInt(startingHour) + 1);
                                startingMinute = String(parseInt(startingMinute) - 60);
                            }
                        }
                    }

                    if (startingHour.length == 1) {
                        startingHour = '0' + startingHour;
                    }
                    if (startingMinute.length == 1) {
                        startingMinute = '0' + startingMinute;
                    }
                    dataPointsArray.push({ y: parseInt(document.getElementById('first-sample-size-review').value), label: startingHour + ':' + startingMinute, indicator: 'khi' });

                    while ((parseInt(startingHour) < parseInt(endingHour))
                        || ((parseInt(startingHour) == parseInt(endingHour)) && (parseInt(startingMinute) < parseInt(endingMinute)))) {

                        startingMinute = String(parseInt(startingMinute) + (60 * parseFloat((document.querySelector('.new-process-form .sampeling-cadence-div input').value))));
                        while (parseInt(startingMinute) >= 60) {
                            startingHour = String(parseInt(startingHour) + 1)
                            startingMinute = String(parseInt(startingMinute) - 60);
                        }

                        let startingHourLabel = startingHour;
                        let startingminuteLabel = startingMinute;

                        if (startingHour.length == 1) {
                            startingHourLabel = '0' + startingHour;
                        }
                        if (startingMinute.length == 1) {
                            startingminuteLabel = '0' + startingMinute;
                        }

                        if ((parseInt(startingHour) < parseInt(endingHour))
                            || ((parseInt(startingHour) == parseInt(endingHour)) && (parseInt(startingMinute) < parseInt(endingMinute)))) {
                            if ((CpCounter % document.querySelector('.new-process-form .cp-cadence-div input').value) == 0) {
                                dataPointsArray.push({ y: parseInt(document.getElementById('sample-size-review').value), label: startingHourLabel + ':' + startingminuteLabel, indicator: 'Cp' });
                            } else {
                                dataPointsArray.push({ y: parseInt(document.getElementById('sample-size-review').value), label: startingHourLabel + ':' + startingminuteLabel, indicator: '' });
                            }
                        }

                        CpCounter += 1;
                    }
                    document.getElementById('samples-per-day').value = (CpCounter - 1);

                    dataPointsArray.reverse();
                    dataPointsArray[0]['indicator'] += 'Pp'

                    document.getElementById('sampeling-planning-chart').innerHTML = '';
                    var chart = new CanvasJS.Chart("sampeling-planning-chart", {
                        animationEnabled: true,
                        zoomEnabled: true,
                        colorSet: "follow-up-map",
                        theme: "light2",
                        exportFileName: "Planning d'échantillonnage (" + document.getElementById("process-name-review").value + ")",
                        exportEnabled: true,
                        title: {
                            text: "",
                            fontSize: 17,
                            fontColor: '#000000',
                            fontFamily: 'Roboto'
                        },

                        axisY: [{
                            labelFontSize: 10,
                            labelFontColor: '#000000',
                            labelFontFamily: 'Roboto',
                            gridColor: "#ccc",
                            titleFontSize: 12,
                            titleFontColor: '#000000',
                            titleFontFamily: 'Roboto'
                        }, {
                            title: "Nombre de pièces",
                            labelFontSize: 10,
                            labelFontColor: '#000000',
                            labelFontFamily: 'Roboto',
                            gridColor: "#ccc",
                            titleFontSize: 12,
                            titleFontColor: '#000000',
                            titleFontFamily: 'Roboto'
                        }],
                        axisX: {
                            labelFontSize: 10,
                            labelFontColor: '#000000',
                            labelFontFamily: 'Roboto',
                        },
                        data: [{
                            type: "bar",
                            color: "#0070c0", indexLabelFontSize: 13,
                            indexLabelFontFamily: 'Roboto',
                            indexLabelFontColor: '#000000',
                            indexLabelFontWeight: "bold",
                            indexLabelFormatter: function (e) {
                                if (e.dataPoint.indicator == 'khi') {
                                    return "χ²"
                                } else if (e.dataPoint.indicator == 'Cp') {
                                    return "Cp"
                                } else if (e.dataPoint.indicator == 'Pp') {
                                    return "Pp"
                                } else if (e.dataPoint.indicator == 'CpPp') {
                                    return "Cp, Pp"
                                }
                                else return "";
                            },
                            dataPoints: dataPointsArray
                        }]
                    });
                    chart.render();
                } else {
                    alert('ERREUR : Veuillez renseigner les horaires de travail.');
                    document.querySelector('.new-process-form .cp-cadence-div input').value = '';
                }
            } else {
                if (!(parseFloat((document.querySelector('.new-process-form .sampeling-cadence-div input').value)) > 0)) {
                    alert('ERREUR : Veuillez renseigner la cadence du prélèvement.');
                    document.querySelector('.new-process-form .cp-cadence-div input').value = '';
                }
                if (!(parseFloat((document.querySelector('.new-process-form .measuring-time-div input').value)) > 0)) {
                    alert('ERREUR : Veuillez renseigner le temps de mesure.');
                    document.querySelector('.new-process-form .cp-cadence-div input').value = '';
                }
            }
        } else {
            let tempString = '';
            document.getElementById('sampeling-planning-chart').innerHTML = '';

            tempString += '<div class="loading-container">';
            tempString += '<div class="lds-ring">';
            tempString += '<div></div>';
            tempString += '<div></div>';
            tempString += '<div></div>';
            tempString += '<div></div>';
            tempString += '</div>';
            tempString += '<div class="lds-txt">';
            tempString += '<h3>Veuillez renseigner les informations demandées pour visualiser le planning d\'échantillonnage...</h3 > ';
            tempString += '</div>';
            tempString += '</div>';

            document.getElementById('sampeling-planning-chart').innerHTML = tempString;

        }
    });
}

if (followUpOverlay) {
    followUpOverlay.addEventListener('click', () => {
        if (urlParams.get('follow-up') != null) {
            window.location = './';
        } else if (urlParams.get('archive-follow-up') != null) {
            if ((urlParams.get('history') != null) && (urlParams.get('of') != null)) {
                window.location = './';
            } else if ((urlParams.get('archive') != null) && (urlParams.get('process') != null)) {
                window.location = './?archive=' + urlParams.get('archive') + '&process=' + urlParams.get('process') + '&khi=' + urlParams.get('khi');
            }
        }
    })
}

if (document.getElementById('process-details-overlay')) {
    (document.getElementById('process-details-overlay')).addEventListener('click', () => {
        window.location = './';
    })
}

if (document.getElementById('archive-sammuary-overlay')) {
    (document.getElementById('archive-sammuary-overlay')).addEventListener('click', () => {
        if ((urlParams.get('archive') != null) && (urlParams.get('process') != null)) {
            window.location = './?archive=' + urlParams.get('archive') + '&process=' + urlParams.get('process') + '&khi=' + (urlParams.get('khi'));
        } else if ((urlParams.get('history') != null) && (urlParams.get('of') != null)) {
            window.location = './';
        }
    })
}

if (document.getElementById('process-planning-overlay')) {
    (document.getElementById('process-planning-overlay')).addEventListener('click', () => {
        window.location = './';
    })
}

if (nrmlRisk) {
    let currenNtmlRisk = nrmlRisk.value;
    nrmlRisk.style.width = String(nrmlRisk.value).replace('.', '').length * 8.25 + 'px';
    nrmlRisk.addEventListener('change', () => {
        if ((parseFloat(nrmlRisk.value) < 100) && (parseFloat(nrmlRisk.value) > 0)) {
            window.location = "./?output-read=" + urlParams.get('output-read') + '&nrml-risk=' + nrmlRisk.value;
        } else {
            nrmlRisk.value = currenNtmlRisk;
        }
    });
}

if (addTable) {
    addTable.forEach(add => {
        add.addEventListener('click', () => {
            let toTable = add.id;
            let excel = false;

            if (urlParams.get('khi') !== 'false') {
                document.querySelector('body').classList.add('overflow');
                addMethod.style.zIndex = "5";
                addOverlay.style.zIndex = "4";
                varsNbrForm.classList.add('blur');
                document.getElementById('existing-tables').classList.add('blur');
                addOverlay.style.opacity = "1";
                addMethod.style.opacity = "1";
            } else {
                document.querySelector('body').classList.add('overflow');
                addConfirmation.style.zIndex = "5";
                addConfirmationOverlay.style.zIndex = "4";
                varsNbrForm.classList.add('blur');
                document.getElementById('existing-tables').classList.add('blur');
                addConfirmationOverlay.style.opacity = "1";
                addConfirmation.style.opacity = "1";

                addConfirmationOverlay.addEventListener('click', () => {
                    addConfirmation.style.opacity = "0";
                    addConfirmationOverlay.style.opacity = "0";
                    document.getElementById('existing-tables').classList.remove('blur');
                    varsNbrForm.classList.remove('blur');
                    setTimeout(() => {
                        addConfirmationOverlay.style.zIndex = "-1";
                        addConfirmation.style.zIndex = "-1";
                    }, 310);
                    document.querySelector('body').classList.remove('overflow');
                });

                cancelAdd.addEventListener('click', (e) => {
                    addConfirmation.style.opacity = "0";
                    addConfirmationOverlay.style.opacity = "0";
                    document.getElementById('existing-tables').classList.remove('blur');
                    varsNbrForm.classList.remove('blur');
                    setTimeout(() => {
                        addConfirmationOverlay.style.zIndex = "-1";
                        addConfirmation.style.zIndex = "-1";
                    }, 310);
                    document.querySelector('body').classList.remove('overflow');
                });

                confirmAdd.addEventListener('click', (e) => {
                    addConfirmation.style.opacity = "0";
                    addConfirmation.style.transitionDuration = '0s';
                    addConfirmationOverlay.style.opacity = "0";
                    document.getElementById('existing-tables').classList.remove('blur');
                    varsNbrForm.classList.remove('blur');
                    setTimeout(() => {
                        addConfirmationOverlay.style.zIndex = "-1";
                    }, 310);

                    addMethod.style.transitionDuration = '0s';
                    addConfirmation.style.zIndex = "-1";
                    document.querySelector('body').classList.remove('overflow');
                    addMethod.style.zIndex = "5";
                    addOverlay.style.zIndex = "4";
                    varsNbrForm.classList.add('blur');
                    document.getElementById('existing-tables').classList.add('blur');
                    addOverlay.style.opacity = "1";
                    addMethod.style.opacity = "1";
                    setTimeout(() => {
                        addConfirmation.style.transitionDuration = '0.3s';
                        addMethod.style.transitionDuration = '0.3s';
                    }, 310);
                });
            }

            addOverlay.addEventListener('click', () => {
                addMethod.style.opacity = "0";
                addOverlay.style.opacity = "0";
                document.getElementById('existing-tables').classList.remove('blur');
                varsNbrForm.classList.remove('blur');
                setTimeout(() => {
                    addOverlay.style.zIndex = "-1";
                    addMethod.style.zIndex = "-1";
                }, 310);
                document.querySelector('body').classList.remove('overflow');
            });

            manualAdd.addEventListener('click', (e) => {
                e.preventDefault();
                window.location = "./?add-to=" + toTable + "&add-method=manual-add";
            });

            excelAdd.addEventListener('click', (e) => {
                if (excel) {
                    e.preventDefault();
                    excel = false;
                    addMethodExcelLabel.style.opacity = "0";
                    addMethodExcel.style.opacity = "0";
                    setTimeout(() => {
                        excelHiddenLabel.style.display = "none";
                        addMethodExcelLabel.style.height = "0px";
                        addMethodExcelLabel.style.marginTop = "0";
                        excelAdd.style.backgroundColor = '#10793f';
                        excelAdd.addEventListener('mouseover', () => {
                            excelAdd.style.backgroundColor = '#185c37';
                        })
                        excelAdd.addEventListener('mouseleave', () => {
                            excelAdd.style.backgroundColor = '#10793f';
                        })
                    }, 15);
                }
                else {
                    e.preventDefault();
                    excel = true;
                    excelAdd.style.backgroundColor = '#185c37';
                    excelAdd.addEventListener('mouseover', () => {
                        excelAdd.style.backgroundColor = '#185c37';
                    })
                    excelAdd.addEventListener('mouseleave', () => {
                        excelAdd.style.backgroundColor = '#185c37';
                    })
                    excelHiddenLabel.style.display = "inline";
                    addMethodExcelLabel.style.height = "80px";
                    addMethodExcelLabel.style.marginTop = "20px";
                    setTimeout(() => {
                        addMethodExcelLabel.style.opacity = "1";
                        addMethodExcel.style.opacity = "1";
                    }, 15);
                }
            });

            document.getElementById('add-method-excel').onchange = () => {
                const selectedFile = document.getElementById('add-method-excel').files[0];
                if (selectedFile) {
                    document.querySelector('#excel-add-method-form').setAttribute("action", "./assets/php/db/save-excel.php?save-data=Confirmer&importance=urgent&vars-name=" + toTable);
                    document.querySelector('#excel-add-method-form').submit();
                }
            }

        });
    });
}

if (infoExcel) {
    infoExcel.addEventListener('click', () => {
        document.querySelector('body').classList.add('overflow');
        infoExelBox.style.zIndex = "5";
        excelOverlay.style.zIndex = "4";
        varsNbrForm.classList.add('blur');
        if (document.getElementById('solution')) {
            document.getElementById('solution').classList.add('blur');
        }
        if (document.getElementById('existing-tables')) {
            document.getElementById('existing-tables').classList.add('blur');
        }
        if (measurement) {
            measurement.classList.add('blur');
        }
        if (measurementConfirmation) {
            measurementConfirmation.classList.add('blur');
        }
        excelOverlay.style.opacity = "1";
        infoExelBox.style.opacity = "1";
    });

    excelOverlay.addEventListener('click', () => {
        infoExelBox.style.opacity = "0";
        excelOverlay.style.opacity = "0";
        varsNbrForm.classList.remove('blur');
        if (document.getElementById('solution')) {
            document.getElementById('solution').classList.remove('blur');
        }
        if (document.getElementById('existing-tables')) {
            document.getElementById('existing-tables').classList.remove('blur');
        }
        if (measurement) {
            measurement.classList.remove('blur');
        }
        if (measurementConfirmation) {
            measurementConfirmation.classList.remove('blur');
        }
        setTimeout(() => {
            excelOverlay.style.zIndex = "-1";
            infoExelBox.style.zIndex = "-1";
        }, 310);
        document.querySelector('body').classList.remove('overflow');
    });
}

if (scrollTop) {
    navBubbles.addEventListener('mouseover', () => {
        scrollCapability.style.opacity = 1;
        scrollNormality.style.opacity = 1;
        scrollMaps.style.opacity = 1;
        scrollTop.style.opacity = 1;

        scrollCapability.style.right = "60px";
        scrollCapability.style.bottom = "10px";

        scrollNormality.style.right = "10px";
        scrollNormality.style.bottom = "60px";

        scrollMaps.style.right = "50px";
        scrollMaps.style.bottom = "50px";
    });

    navBubbles.addEventListener('mouseleave', () => {

        scrollCapability.style.opacity = 0;
        scrollNormality.style.opacity = 0;
        scrollTop.style.opacity = 0.5;
        scrollMaps.style.opacity = 0;

        scrollCapability.style.right = "15px";
        scrollCapability.style.bottom = "15px";

        scrollNormality.style.right = "15px";
        scrollNormality.style.bottom = "15px";

        scrollMaps.style.right = "15px";
        scrollMaps.style.bottom = "15px";

    });

    scrollTop.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
}

if (document.getElementById('upload')) {
    document.getElementById('upload').onchange = () => {
        const selectedFile = document.getElementById('upload').files[0];
        if (selectedFile) {

            document.querySelector('#vars-nbr-form form').setAttribute("method", "POST");
            document.querySelector('#vars-nbr-form form').setAttribute("enctype", "multipart/form-data");
            if (urlParams.get('importance') == 'urgent') {
                document.querySelector('#vars-nbr-form form').setAttribute("action", "./assets/php/db/save-excel.php?importance=urgent&vars-name=" + urlParams.get('vars-name'))
            } else {
                document.querySelector('#vars-nbr-form form').setAttribute("action", "./assets/php/db/save-excel.php");
            }
            sampleName.required = false;
            sampleNbr.required = false;
            sampleSize.required = false;
        } else {
            document.querySelector('#vars-nbr-form form').setAttribute("method", "GET");
            document.querySelector('#vars-nbr-form form').removeAttribute("enctype");
            document.querySelector('#vars-nbr-form form').removeAttribute("action");
            sampleName.required = true;
            sampleNbr.required = true;
            sampleSize.required = true;
        }
    }
}

history.pushState(null, null, location.href);
history.back();
history.forward();
window.onpopstate = function () {
    history.go(1);
};

if (consecutiveContainer) {
    if (urlParams.get('vars-ech') != 1) {
        consecutiveContainer.style.display = "none";
    }
}

if (dropDB) {
    dropDB.addEventListener('click', (e) => {
        e.preventDefault();
        document.querySelector('body').classList.add('overflow');
        confirmDrop.style.zIndex = "5";
        dropOverlay.style.zIndex = "4";
        varsNbrForm.classList.add('blur');
        document.getElementById('solution').classList.add('blur');
        dropOverlay.style.opacity = "1";
        confirmDrop.style.opacity = "1";
    });

    cancelDropDB.addEventListener('click', () => {
        confirmDrop.style.opacity = "0";
        dropOverlay.style.opacity = "0";
        document.getElementById('solution').classList.remove('blur');
        varsNbrForm.classList.remove('blur');
        setTimeout(() => {
            dropOverlay.style.zIndex = "-1";
            confirmDrop.style.zIndex = "-1";
        }, 310);
        document.querySelector('body').classList.remove('overflow');
    });

    dropOverlay.addEventListener('click', () => {
        confirmDrop.style.opacity = "0";
        dropOverlay.style.opacity = "0";
        document.getElementById('solution').classList.remove('blur');
        varsNbrForm.classList.remove('blur');
        setTimeout(() => {
            dropOverlay.style.zIndex = "-1";
            confirmDrop.style.zIndex = "-1";
        }, 310);
        document.querySelector('body').classList.remove('overflow');
    });
}

if (final) {
    consecutive.addEventListener('change', () => {
        if (consecutive.checked) {
            sampleTimeInput.required = true;
            sampleTimeInput.value = "";
            sampleTimeLabel.style.display = "inline";
            sampleTimeInput.setAttribute("min", "1");
            sampleTimeContainer.style.height = "50px";
            setTimeout(() => {
                sampleTimeContainer.style.opacity = "1";
                sampleTimeInput.style.opacity = "1";
            }, 15);

        } else {
            sampleTimeInput.required = false;
            sampleTimeInput.removeAttribute("min");
            sampleTimeInput.value = "0";
            sampleTimeContainer.style.opacity = "0";
            sampleTimeInput.style.opacity = "0";
            sampleTimeLabel.style.display = "none";
            setTimeout(() => {
                sampleTimeContainer.style.height = "0px";
            }, 15);
        }
    });
}

if (samples) {
    let samplesNbr = samples.length % 3;
    switch (samplesNbr) {
        case 1:
            samples[samples.length - 1].style.width = '100%';
            break;
        case 2:
            samples[samples.length - 1].style.width = 'calc(50% - 30px)';
            samples[samples.length - 2].style.width = 'calc(50% - 30px)';
            break;
    }
}

if (contextMenu) {
    tables.forEach(table => {
        table.addEventListener('click', () => {
            window.location = ("./?output-read=" + String(table.id)).replace(" ", "");
        });

        table.addEventListener('contextmenu', (e) => {
            e.preventDefault();

            const {
                clientX: mouseX,
                clientY: mouseY
            } = e;

            contextMenu.style.top = `${mouseY}px`;
            contextMenu.style.left = `${mouseX}px`;

            contextMenu.classList.remove('visible');
            setTimeout(() => {
                contextMenu.classList.add('visible');
            });

            document.querySelector('body').addEventListener('click', (e) => {
                if (e.target.offsetParent != contextMenu) {
                    contextMenu.classList.remove('visible');
                }
            });

            document.querySelector('body').addEventListener('contextmenu', (e) => {
                if (e.target.offsetParent != contextMenu) {
                    contextMenu.classList.remove('visible');
                }
            });

            contextMenuItems.forEach(item => {
                item.addEventListener('click', () => {
                    switch (Array.from(contextMenuItems).indexOf(item)) {
                        case 0:
                            contextMenu.classList.remove('visible');
                            window.location = ("./?output-read=" + String(table.id)).replace(" ", "");
                            break;
                        case 1:
                            contextMenu.classList.remove('visible');
                            window.location = ("./assets/php/query/download.php/?download=" + String(table.id)).replace(" ", "");
                            break;
                        case 2:
                            e.preventDefault();
                            contextMenu.classList.remove('visible');
                            document.querySelector('.confirm-drop .drop-buttons #confirm-drop-db').setAttribute('href', ('./assets/php/views/drop.php/?drop=' + String(table.id)).replace(" ", ""));
                            document.querySelector('body').classList.add('overflow');
                            confirmDrop.style.zIndex = "5";
                            dropOverlay.style.zIndex = "4";
                            varsNbrForm.classList.add('blur');
                            document.getElementById('existing-tables').classList.add('blur');
                            dropOverlay.style.opacity = "1";
                            confirmDrop.style.opacity = "1";
                            break;
                    }
                });
            });

            cancelDropDB.addEventListener('click', () => {
                document.querySelector('.confirm-drop .drop-buttons #confirm-drop-db').removeAttribute('href');
                confirmDrop.style.opacity = "0";
                dropOverlay.style.opacity = "0";
                document.getElementById('existing-tables').classList.remove('blur');
                varsNbrForm.classList.remove('blur');
                setTimeout(() => {
                    dropOverlay.style.zIndex = "-1";
                    confirmDrop.style.zIndex = "-1";
                }, 310);
                document.querySelector('body').classList.remove('overflow');
            });

            dropOverlay.addEventListener('click', () => {
                document.querySelector('.confirm-drop .drop-buttons #confirm-drop-db').removeAttribute('href');
                confirmDrop.style.opacity = "0";
                dropOverlay.style.opacity = "0";
                document.getElementById('existing-tables').classList.remove('blur');
                varsNbrForm.classList.remove('blur');
                setTimeout(() => {
                    dropOverlay.style.zIndex = "-1";
                    confirmDrop.style.zIndex = "-1";
                }, 310);
                document.querySelector('body').classList.remove('overflow');
            });

        });
    });
}

if (contextMenuArchive) {
    archives.forEach(archive => {
        archive.addEventListener('click', () => {
            window.location = ("./?archive=" + String(archive.id)).replace(" ", "");
        });

        archive.addEventListener('contextmenu', (e) => {
            e.preventDefault();

            const {
                clientX: mouseX,
                clientY: mouseY
            } = e;

            contextMenuArchive.style.top = `${mouseY}px`;
            contextMenuArchive.style.left = `${mouseX}px`;

            contextMenuArchive.classList.remove('visible');
            setTimeout(() => {
                contextMenuArchive.classList.add('visible');
            });

            document.querySelector('body').addEventListener('click', (e) => {
                if (e.target.offsetParent != contextMenuArchive) {
                    contextMenuArchive.classList.remove('visible');
                }
            });

            document.querySelector('body').addEventListener('contextmenu', (e) => {
                if (e.target.offsetParent != contextMenuArchive) {
                    contextMenuArchive.classList.remove('visible');
                }
            });

            contextMenuItemsArchive.forEach(item => {
                item.addEventListener('click', () => {
                    switch (Array.from(contextMenuItemsArchive).indexOf(item)) {
                        case 0:
                            contextMenuArchive.classList.remove('visible');
                            window.location = ("./?archive=" + String(archive.id)).replace(" ", "");
                            break;
                        case 1:
                            contextMenuArchive.classList.remove('visible');
                            window.location = (("./?history=" + String(archive.id) + "&archive-sammuary=show").replace(" ", "")).replace('process', 'of');
                            break;
                        case 2:
                            contextMenuArchive.classList.remove('visible');
                            window.location = (("./?history=" + String(archive.id) + "&archive-maps=show").replace(" ", "")).replace('process', 'of');
                            break;
                        case 3:
                            contextMenuArchive.classList.remove('visible');
                            window.location = (("./?history=" + String(archive.id) + "&archive-follow-up=show").replace(" ", "")).replace('process', 'of');
                            break;
                        case 4:
                            contextMenuArchive.classList.remove('visible');
                            window.location = ("./?capability-report=" + ((((String(archive.id)).split('&')[1]).slice(8)).toLowerCase() + "keyword" + ((String(archive.id)).split('&')[0])).replace(" ", ""));
                            break;
                        case 5:
                            e.preventDefault();
                            contextMenuArchive.classList.remove('visible');
                            document.querySelector('.confirm-drop .drop-buttons #confirm-drop-db').setAttribute('href', ('./assets/php/views/drop.php/?drop-all=' + String(archive.id)).replace(" ", ""));
                            document.querySelector('body').classList.add('overflow');
                            confirmDrop.style.zIndex = "5";
                            dropOverlay.style.zIndex = "4";
                            varsNbrForm.classList.add('blur');
                            document.getElementById('existing-tables').classList.add('blur');
                            dropOverlay.style.opacity = "1";
                            confirmDrop.style.opacity = "1";
                            break;
                    }
                });
            });

            cancelDropDB.addEventListener('click', () => {
                document.querySelector('.confirm-drop .drop-buttons #confirm-drop-db').removeAttribute('href');
                confirmDrop.style.opacity = "0";
                dropOverlay.style.opacity = "0";
                document.getElementById('existing-tables').classList.remove('blur');
                varsNbrForm.classList.remove('blur');
                setTimeout(() => {
                    dropOverlay.style.zIndex = "-1";
                    confirmDrop.style.zIndex = "-1";
                }, 310);
                document.querySelector('body').classList.remove('overflow');
            });

            dropOverlay.addEventListener('click', () => {
                document.querySelector('.confirm-drop .drop-buttons #confirm-drop-db').removeAttribute('href');
                confirmDrop.style.opacity = "0";
                dropOverlay.style.opacity = "0";
                document.getElementById('existing-tables').classList.remove('blur');
                varsNbrForm.classList.remove('blur');
                setTimeout(() => {
                    dropOverlay.style.zIndex = "-1";
                    confirmDrop.style.zIndex = "-1";
                }, 310);
                document.querySelector('body').classList.remove('overflow');
            });

        });
    });
}

if (document.getElementById('nav-process')) {
    if ((parseInt(document.getElementById('existing-tables').clientHeight) >= 1250) && (urlParams.get('process') == null)) {
        document.getElementById('nav-process').style.display = 'flex';
    }

    document.getElementById('nav-process').addEventListener('mouseover', () => {
        document.getElementById('nav-process-main').style.opacity = '1';
    });

    document.getElementById('nav-process').addEventListener('mouseleave', () => {
        document.getElementById('nav-process-main').style.opacity = '0.5';
    });

    document.querySelector('#nav-process-main').addEventListener('mouseover', () => {

        for (let i = 0; i < Array.from(document.querySelectorAll('.nav-process #nav-process-secondaries .nav-process-secondary a')).length; i++) {
            document.querySelector('.nav-process #nav-process-secondaries').style.transition = (Array.from(document.querySelectorAll('.nav-process #nav-process-secondaries .nav-process-secondary a')).length * 0.1) + 's'

            document.querySelectorAll('.nav-process #nav-process-secondaries .nav-process-secondary a')[i].style.display = 'block';
            document.querySelectorAll('.nav-process #nav-process-secondaries .nav-process-secondary')[i].style.maxHeight = 'none';
            document.querySelector('.nav-process').style.height = (document.querySelector('.nav-process').scrollHeight) + 'px';
            document.querySelector('.nav-process #nav-process-secondaries').style.maxHeight = document.querySelector('.nav-process #nav-process-secondaries').scrollHeight + 'px';
        }

        document.querySelector('#nav-process').style.height = document.querySelector('#nav-process').clientHeight + 'px';

        document.querySelector('#nav-process-main').style.borderRadius = '4px';
        document.querySelector('#nav-process-main').style.backgroundColor = '#003860';
        document.querySelector('#nav-process-main').style.width = document.querySelector('.nav-process #nav-process-secondaries').clientWidth + 'px';
    });

    document.querySelector('#nav-process').addEventListener('mouseleave', () => {
        for (let i = 0; i < Array.from(document.querySelectorAll('.nav-process #nav-process-secondaries .nav-process-secondary a')).length; i++) {
            document.querySelector('.nav-process #nav-process-secondaries').style.transition = (Array.from(document.querySelectorAll('.nav-process #nav-process-secondaries .nav-process-secondary a')).length * 0.1) + 's'

            document.querySelectorAll('.nav-process #nav-process-secondaries .nav-process-secondary a')[i].style.display = 'none';
            document.querySelectorAll('.nav-process #nav-process-secondaries .nav-process-secondary')[i].style.maxHeight = '0'
            document.querySelector('.nav-process').style.height = '82px';
        }
        document.querySelector('.nav-process #nav-process-secondaries').style.maxHeight = '0px';
        document.querySelector('#nav-process-main').style.borderRadius = '50%';
        document.querySelector('#nav-process-main').style.backgroundColor = '#0070c0';
        document.querySelector('#nav-process-main').style.width = '40px';
    });
}

khiConclusion.forEach(conclusion => {
    var style = window.getComputedStyle(conclusion, null).getPropertyValue('font-size');
    var fontSize = parseFloat(style);
    conclusion.style.fontSize = fontSize + 1 + 'px';
});
