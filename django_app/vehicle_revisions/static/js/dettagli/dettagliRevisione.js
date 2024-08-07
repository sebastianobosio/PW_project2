import {renderRevisioneDetail} from "../renderComponents/renderRevisione.js";
import {renderTargaCard} from "../renderComponents/renderTarga.js";
import {renderVeicoloCard} from "../renderComponents/renderVeicolo.js";

// this function is called from the initDettagliRevisione.js once the dettagli-revisione.php page is laoded
export function initializePage() {
    $(document).ready(function () {
        // Function to fetch revision details based on ID (number of revision), once that get the revision
        // use the plate to get the targa details. From the plate it use the plate.veicolo to get the telaio number
        // and so the veicolo details.
        // In the dettagli-pages the are the section #Revisione, #Targa and #Veicolo
        // where this components are added.
        async function fetchRevisioneDetails(id) {
            try {
                const revisioneResponse = await new Promise((resolve, reject) => {
                    handleAjaxRequest("/vehicle-revisions/revision-search/", // URL to fetch car details from the server
                            "GET", "numero=" + id,
                    resolve, reject);
                });
                if (revisioneResponse.success == true) {
                    const revisione = revisioneResponse.data[0];
                    $("#titolo").html("<h1>Dettagli sulla revisione " + revisione.id + "</h1>");
                    const revisioneComponent = await renderRevisioneDetail(revisione); // here i shoul render it with a different style component
                    revisioneComponent.appendTo($("#revisione"));
                    console.log(revisione)
                    const targaResponse = await new Promise((resolve, reject) => {
                        handleAjaxRequest("/vehicle-revisions/plate-search/", "GET", "targa=" + revisione.plate_number_id, resolve, reject);
                    });
                    if (targaResponse.success == true) {
                        var targa = targaResponse.data[0];
                        var targaComponent = renderTargaCard(targa);
                        $(".targa .titolo").html("<h3>Targa associata</h3>");
                        targaComponent.appendTo($("#targa"));
                    } else {
                        $(".targa .titolo").html("<h3>Nessuna targa associata a questa revisione. Strano!</h3>");
                        // render niente veicolo per questa targa
                        // non dovrebbe mai accadere. Ogni revisione ha la sua targa per costruzione del db
                    }

                    const veicoloResponse = await new Promise((resolve, reject) => {
                        handleAjaxRequest("/vehicle-revisions/vehicle-search/", "GET", "telaio=" + targa.vehicle_number_id, resolve, reject);
                    });
                    if (veicoloResponse.success == true) {
                        var veicolo = veicoloResponse.data[0];
                        var veicoloComponent = renderVeicoloCard(veicolo);
                        $(".veicolo .titolo").html("<h3>Veicolo associato</h3>");

                        veicoloComponent.appendTo($("#veicolo"));
                    } else {
                        $(".veicolo .titolo").html("<h3>Nessun veicolo associato. Strano!</h3>");

                        // render niente veic   olo per questa targa
                        // non dovrebbe mai accadere. Ogni targa ha il suo veicolo per costruzione del db
                    }
                } else {
                    alert("Non sono state trovate corrispondenze");
                    returnToMotherPage();
                }
            } catch (error) {
                console.error("Error", error);
                alert("Error occurred while fetching data.");
            }
        }

        // Get car ID from URL query parameter
        const url = window.location.pathname 
        const segments = url.split('/');
        const revisioneNumber = segments.filter(segment => segment !== '').pop();

        // Fetch car details based on the ID
        fetchRevisioneDetails(revisioneNumber);
    });
}

export function returnToMotherPage() {
    var motherURL = "/vehicle-revisions/revision-search/";
    window.location.href = motherURL;
}
