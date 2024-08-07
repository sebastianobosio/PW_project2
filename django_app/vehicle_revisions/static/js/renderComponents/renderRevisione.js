import {checkRevision} from "../modules/checkRevisionFields.js";
import {handlePageReloadOnDelete, handlePageReloadOnEdit} from "../modules/revisionHandlers.js";
import {handleAjaxError, handleResponse} from "../modules/handleAjax.js";

/* getCookie and $.ajaxSetup are needed for a POST request in a Django app in this case
    In the template revision-search.html i have added a dummy form with a csrf. This token is needed
    for security reason. The problem is that when i modify a revision i don't have a real form,
    but i fethc data from the component and then assembly an ajax request. So i have to manually
    include the csrf in the header of the request. The two function below does this.
*/
function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
const csrftoken = getCookie('csrftoken');

// Set up jQuery to include the CSRF token in the headers of all AJAX requests
$.ajaxSetup({
    beforeSend: function (xhr, settings) {
        if (!(/^http:.*|^https:.*/.test(settings.url))) { // Only send the token to relative URLs i.e., same-origin requests
            xhr.setRequestHeader("X-CSRFToken", csrftoken);
        }
    }
});


export async function renderRevisioneCard(revisione) {
    const revisioneComponent = await createRevisioneCardComponent(revisione);
    // attach handler to edit button
    return revisioneComponent;
}

export async function renderRevisioneDetail(revisione) {
    const revisioneComponent = await createRevisioneDetailComponent(revisione);
    // attach handler to edit button
    return revisioneComponent;
}

/*  there are some complication with how i handled this component
    The motivation field is toggled on and off based on the status of esito. But I
    also had to take in consideration the original esito (and all the original fields values)
    to revert back in case of errors.
    The edit button have two stages. The first when clicked the edit button let you
    make changes to certain fields. The edit button become the save-changes button.
    The detail button and delete button disappear appear a discard-button.
    If the discard-button is pressed the values are reverted back, if the save button is
    pressed it calls the function saveChanges.
    The hard part was handle all the cases.
*/

async function createRevisioneCardComponent(revisione) {
    const revisioneDiv = $("<div>").addClass("card mb-3");
    const infoDiv = $("<div>").addClass("card-body text-dark mt-2");
    const revisioneNumberDiv = $("<div>").addClass("card-title fw-bold mt-2").html('Revisione:   <span class="numero">' + revisione.id + "</span>").appendTo(infoDiv);
    const dataRevDiv = $("<div>").addClass("card-text mt-2").html('Data della revisione: <span class="dataRev">' + '<input type="date" value="' + revisione.revision_date + '" disabled></input>' + "</span>").appendTo(infoDiv);
    const targaNumberDiv = $("<div>").addClass("card-text mt-2").html('Targa associata: <span class="targa p-1">' + revisione.plate_number_id + "</span>").appendTo(infoDiv);
    const esitoSelect = $("<select>").addClass("esito").prop("disabled", true); // Disable select element initially
    $("<option>").val("positive").text("Positivo").appendTo(esitoSelect);
    $("<option>").val("negative").text("Negativo").appendTo(esitoSelect);
    if (revisione.esito === "positive") {
        esitoSelect.val("positive");
    } else if (revisione.outcome === "negative") {
        esitoSelect.val("negative");
    }
    const esitoDiv = $("<div>").addClass("card-text mt-2").html("Esito: ").append(esitoSelect).appendTo(infoDiv);
    const motivazioneDiv = $("<div>").addClass("motivazioneDiv card-text mt-2").css("display", "none").html('Motivazione: <span class="motivazione"><textarea class="motivazione" oninput="autoResize()" type="text" required disabled></textarea></span>').appendTo(infoDiv);
    if (revisione.outcome == "negative") {
        motivazioneDiv.toggle(revisione.outcome === "negative");
        motivazioneDiv.find(".motivazione textarea").val(revisione.motivation);
    }
    infoDiv.appendTo(revisioneDiv);
    // info buttons
    const btnsDiv = $("<div>").addClass("px-2 mb-3 mt-auto d-flex justify-content-between gap-2");
    var discardChangeBtn = $("<button>").addClass("discard-changes btn").html('<i class="fa-solid fa-arrow-left"></i>').hide().appendTo(btnsDiv);
    const detailsButton = $("<button>").html(`<a class="link-light link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover" href="/vehicle-revisions/revision-details/${revisione.id}/">Scopri di più<i class="fa-solid fa-circle-info ms-2"></i></a>`).addClass("btn me-auto");

    detailsButton.appendTo(btnsDiv);
    /*detailsButton.on("click", function () {
        revisioneDetailsBtnClicked(revisione);
    });*/

    // Edit and remove buttons
    const removeButton = $("<button>").addClass("btn remove-button");
    removeButton.on("click", function () {
        deleteBtnClicked(revisione.id);
    });
    const editButton = await createEditButton(revisioneDiv, removeButton, discardChangeBtn, detailsButton);
    removeButton.html('<i class="fas fa-trash-alt"></i>'); // This adds a trash icon
    editButton.appendTo(btnsDiv);
    removeButton.appendTo(btnsDiv);
    btnsDiv.appendTo(revisioneDiv);

    return revisioneDiv;
}

async function createRevisioneDetailComponent(revisione) {
    const revisioneDiv = $("<div>").addClass("card mb-3");
    const infoDiv = $("<div>").addClass("card-body text-dark mt-2");
    const revisioneNumberDiv = $("<div>").addClass("card-title fw-bold mt-2").html('Revisione:   <span class="numero">' + revisione.id + "</span>").appendTo(infoDiv);
    const dataRevDiv = $("<div>").addClass("card-text mt-2").html('Data della revisione: <span class="dataRev">' + '<input type="date" value="' + revisione.revision_date + '" disabled></input>' + "</span>").appendTo(infoDiv);
    const targaNumberDiv = $("<div>").addClass("card-text mt-2").html('Targa associata: <span class="targa p-1">' + revisione.plate_number_id + "</span>").appendTo(infoDiv);
    const esitoSelect = $("<select>").addClass("esito").prop("disabled", true); // Disable select element initially
    $("<option>").val("positive").text("Positivo").appendTo(esitoSelect);
    $("<option>").val("negative").text("Negativo").appendTo(esitoSelect);
    if (revisione.esito === "positive") {
        esitoSelect.val("positive");
    } else if (revisione.outcome === "negative") {
        esitoSelect.val("negative");
    }
    const esitoDiv = $("<div>").addClass("card-text mt-2").html("Esito: ").append(esitoSelect).appendTo(infoDiv);
    const motivazioneDiv = $("<div>").addClass("motivazioneDiv card-text mt-2").css("display", "none").html('Motivazione: <span class="motivazione"><textarea class="motivazione" oninput="autoResize()" type="text" required disabled></textarea></span>').appendTo(infoDiv);
    if (revisione.outcome == "negative") {
        motivazioneDiv.toggle(revisione.outcome === "negative");
        motivazioneDiv.find(".motivazione textarea").val(revisione.motivation);
    }
    infoDiv.appendTo(revisioneDiv);
    // info buttons
    const btnsDiv = $("<div>").addClass("px-2 mb-3 mt-auto d-flex justify-content-between gap-2");
    var discardChangeBtn = $("<button>").addClass("discard-changes btn").html('<i class="fa-solid fa-arrow-left"></i>').hide().appendTo(btnsDiv);

    // Edit and remove buttons
    const removeButton = $("<button>").addClass("btn remove-button");
    removeButton.on("click", function () {
        deleteBtnClicked(revisione.id);
    });
    const editButton = await createEditButton(revisioneDiv, removeButton, discardChangeBtn);
    removeButton.html('<i class="fas fa-trash-alt"></i>'); // This adds a trash icon
    editButton.appendTo(btnsDiv);
    removeButton.appendTo(btnsDiv);
    btnsDiv.appendTo(revisioneDiv);

    return revisioneDiv;
}

function revisioneDetailsBtnClicked(revisione) {
    viewRevisioneDetails(revisione);
}

/*function viewRevisioneDetails(revisione) {
    window.location.href = `/vehicle-revisions/revision-details/${revisione.id}/`;
}*/

function deleteBtnClicked(numeroRev) {
    const id = numeroRev;
    console.log(id)
    var confirmed = confirm("Are you sure you want to delete this entry");
    if (confirmed) {
        handleAjaxRequest(`/vehicle-revisions/delete-revision/${id}/`, "POST", null, function (response) {
            handleResponse(response, "Elemento rimosso", null);
            handlePageReloadOnDelete();
        }, function (xhr, status, error) {
            handleAjaxError(xhr.responseText);
        });
    }
}

function editEsitoChanged(revisioneDiv) {
    const esitoValue = revisioneDiv.find("select.esito").val();
    const isNegative = esitoValue === "negative";
    const isPositive = esitoValue === "positive";

    revisioneDiv.find(".motivazioneDiv").toggle(isNegative);
    revisioneDiv.find(".motivazione textarea").prop("required", isNegative).prop("disabled", isPositive);
}

async function createEditButton(revisioneDiv, removeButton, discardButton, detailsButton = null) {
    const editButton = $("<button>").addClass("btn").html('<i class="fa-solid fa-pen-to-square"></i>');

    function getOriginalValues() {
        return {
            dataRev: revisioneDiv.find(".dataRev input").prop("disabled", true).val(),
            targa: revisioneDiv.find(".targa").attr("contenteditable", false).text(),
            esito: revisioneDiv.find("select.esito").prop("disabled", true).val(),
            motivazione: revisioneDiv.find(".motivazione textarea").prop("disabled", true).val()
        };
    }

    function setEditable(isEditable) {
        revisioneDiv.find(".dataRev input").prop("disabled", ! isEditable);
        revisioneDiv.find(".targa").attr("contenteditable", isEditable);
        revisioneDiv.find("select.esito").prop("disabled", ! isEditable);
        if (isEditable) {
            revisioneDiv.find("select.esito").change(function () {
                editEsitoChanged(revisioneDiv);
            });
        }
    }

    function resetToOriginalValues(originalValues) {
        revisioneDiv.find(".dataRev input").val(originalValues.dataRev);
        revisioneDiv.find(".targa").text(originalValues.targa);
        revisioneDiv.find("select.esito").val(originalValues.esito);
        revisioneDiv.find(".motivazione textarea").val(originalValues.motivazione).prop("disabled", originalValues.esito === "positive");
        revisioneDiv.find(".motivazioneDiv").toggle(originalValues.esito === "negative");
    }

    async function saveChangesHandler(id, originalValues) {
        const dataRev = revisioneDiv.find(".dataRev input").val();
        const targa = revisioneDiv.find(".targa").text();
        const esito = revisioneDiv.find("select.esito").val();
        const motivazione = revisioneDiv.find(".motivazione textarea").val();

        if (esito === "negative" && ! motivazione) {
            alert("La motivazione non può essere nulla in caso di esito negativo");
            resetToOriginalValues(originalValues);
            setEditable(true);
            return;
        }

        const dataUpdateRequest = {
            editId: `${id}`,
            editDataRev: `${dataRev}`,
            editTarga: `${targa}`,
            editEsito: `${esito}`,
            editMotivazione: `${motivazione}`
        };

        if (await checkRevision(targa, dataRev)) {
            try {
                await saveChanges(dataUpdateRequest);
                if (targa !== originalValues.targa) {
                    handlePageReloadOnEdit();
                }
                if (detailsButton) 
                    detailsButton.show();
                


                removeButton.show();
                discardButton.hide();
                editButton.removeClass("save-change").html('<i class="fa-solid fa-pen-to-square"></i>');
                attachEditHandler();
            } catch (error) {
                console.error("Errore nel salvataggio");
            }
        } else {
            resetToOriginalValues(originalValues);
            setEditable(true);
        }
    }

    function discardChangesHandler(originalValues) {
        resetToOriginalValues(originalValues);
        setEditable(false);
        if (detailsButton) 
            detailsButton.show();
        


        removeButton.show();
        discardButton.hide();
        editButton.removeClass("save-change").html('<i class="fa-solid fa-pen-to-square"></i>');
        attachEditHandler();
    }

    async function attachEditHandler() {
        const originalValues = getOriginalValues();
        const id = revisioneDiv.find(".numero").text();

        editButton.off("click").on("click", function () {
            setEditable(true);
            if (detailsButton) 
                detailsButton.hide();
            


            removeButton.hide();
            discardButton.show();
            editButton.addClass("save-change").html('<i class="fa-solid fa-floppy-disk"></i>');

            editButton.off("click").on("click", () => saveChangesHandler(id, originalValues));
            discardButton.off("click").on("click", () => discardChangesHandler(originalValues));
        });
    }

    await attachEditHandler();
    return editButton;
}

async function saveChanges(dataUpdateRequest) {
    return new Promise((resolve, reject) => {
        handleAjaxRequest(`/vehicle-revisions/edit-revision/${
            dataUpdateRequest.editId
        }/`, "POST", dataUpdateRequest, function (response) {
            handleResponse(response, "Istanza modificata correttamente", null);
            resolve(response);
        }, function (xhr, status, error) {
            handleAjaxError(xhr.responseText);
            resolve(error);
        });
    });
}
