import {renderRevisioneCard} from "../renderComponents/renderRevisione.js";

// based on the page where this function is called it calls the loadRevisioniDivDV(dettagli veicolo) or
// loadRevisioniDivDT(dettagli targa) that differs for the parameter (array of plates or plate)
// it's called on various situation, when loading the dettagli-veicolo/targa pages, when adding a new revision from
// the dettaglio pages and when handling the edit mode in revisioniHandlers.js
export function loadRevisioniDiv(identifier) {
    var path = window.location.pathname;
    if (path.includes('/vehicle-details/')) {
        const segments = path.split('/').filter(segment => segment !== '');
        const vehicleDetailsIndex = segments.indexOf('vehicle-details');
        const nextSegment = segments[vehicleDetailsIndex + 1];

        if (!isNaN(nextSegment)) {
            console.log("This is a child page of vehicle-details/");
            loadRevisioniDivDV(identifier);
        } else {
            console.log("This is NOT a child page of vehicle-details/");
        }
    } else if (path.includes('/plate-details/')) {
        const segments = path.split('/').filter(segment => segment !== '');
        const vehicleDetailsIndex = segments.indexOf('plate-details');
        const nextSegment = segments[vehicleDetailsIndex + 1];

        if (!isNaN(nextSegment)) {
            console.log("This is a child page of plate-details/");
            loadRevisioniDivDT(identifier);
        } else {
            console.log("This is NOT a child page of plate-details/");
        }
    } else {
        console.log("This is NOT a child page of vehicle-details/ or plate-details/");
    }
}

async function loadRevisioniDivDV(targhe) {
    var div = "#revisione";
    $(div).empty();
    try {
        const revisioneResponse = await new Promise((resolve, reject) => {
            handleAjaxRequest("/vehicle-revisions/revision-search/", "GET", "targhe=" + targhe + "&action=read-array", resolve, reject);
        });
        if (revisioneResponse.success == true) {
            var length = revisioneResponse.data.length;
            var revisionText = length === 1 ? "è associata " + length + " revisione" : "sono associate " + length + " revisioni";
            $(".revisione .titolo").html("<h3>A questo veicolo " + revisionText + "</h3>");
            revisioneResponse.data.forEach(async (revisione) => {
                var revisioneComponent = await renderRevisioneCard(revisione);
                revisioneComponent.appendTo($(div));
            });
        } else {
            $(".revisione .titolo").html("<h3>A questa targa non sono associate revisioni</h3>");
        }
    } catch (error) {
        console.error("Error", error);
        alert("Error occurred while fetching data.");
    }
}

async function loadRevisioniDivDT(targa) {
    var div = '#revisione';
    $(div).empty();
    try {
        const revisioneResponse = await new Promise((resolve, reject) => {
            handleAjaxRequest('/php/search_revisione.php', 'GET', "targa=" + targa + "&action=read", resolve, reject);
        });
        if (revisioneResponse.success == true) {
            var length = revisioneResponse.data.length;
            var revisionText = length === 1 ? 'è associata ' + length + ' revisione' : 'sono associate ' + length + ' revisioni';
            $('.revisione .titolo').html('<h3>A questa targa ' + revisionText + '</h3>');
            (revisioneResponse.data).forEach(async revisione => {
                var revisioneComponent = await renderRevisioneCard(revisione);
                revisioneComponent.appendTo($(div));
            });
        } else {
            $('.revisione .titolo').html('<h3>A questa targa non sono associate revisioni</h3>')
        }
    } catch (error) {
        console.error('Error', error);
        alert("Error occurred while fetching data.");
    }
}
