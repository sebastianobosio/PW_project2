import {performDefaultSearch} from "./performRevisionSearch.js";
import {loadRevisioniDiv} from "./loadRevisions.js";
import {getTarghe} from "../dettagli/dettagliVeicolo.js";
import {getTarga} from "../dettagli/dettagliTarga.js";
import {returnToMotherPage as returnToMotherPageRevisione} from "../dettagli/dettagliRevisione.js";
import { checkIfChildPage } from "./loadRevisions.js";

// this module is used to handle the edit or delete function that are possible from the revision Card
// based on the modification and on the page the are different scenario.
export async function handlePageReloadOnDelete() {
    var currentPage = window.location.pathname;
    if (currentPage.endsWith("revision-search/")) {
        performDefaultSearch(); // se sono in revisioni chiamo la funzione presente nel file searchRevisione.js
    } else if (checkIfChildPage('revision-details/', currentPage)) {
        returnToMotherPageRevisione();
    } else if (checkIfChildPage('vehicle-details/', currentPage)) {
        loadRevisioniDiv(getTarghe());
    } else if (checkIfChildPage('plate-details/', currentPage)) {
        loadRevisioniDiv(getTarga());
    } else {
        console.error("page not supported");
    }
}

export async function handlePageReloadOnEdit() {
    var currentPage = window.location.pathname;
    if (checkIfChildPage('revision-details/', currentPage)) { // se sono in una pagina dettagli
        window.location.reload(); // se cambia la targa cambia anche i dettagli della targa e il veicolo
    } else if (currentPage.endsWith("revision-search/")) {
        return;
    } else if (checkIfChildPage('vehicle-details/', currentPage)) {
        loadRevisioniDiv(getTarghe());
    } else if (checkIfChildPage('plate-details/', currentPage)) {
        loadRevisioniDiv(getTarga());
    } else {
        console.error("page not supported");
    }
}
