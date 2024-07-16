export function renderTargaCard(targa) {
    const targaComponent = createTargaCardComponent(targa);
    return targaComponent;
}

export function renderTargaDetail(targa) {
    const targaComponent = createTargaDetailComponent(targa);
    return targaComponent;
}

/*function createTargaCardComponent(targa) {
    const targaDiv = $('<div>').addClass('targa card');
    const infoDiv = $('<div>').addClass('info');
    const targaNumberDiv = $('<div>').addClass('targaDiv').text('Targa: ' + targa.numero).appendTo(infoDiv);
    const dataEmDiv = $('<div>').text('Data di Emissione: ' + targa.dataEm).appendTo(infoDiv);
    if (targa.status == 'non-active') {
        const vehicle = $('<div>').text('Ultimo veicolo: ' + targa.veicolo).appendTo(infoDiv);
        const dataRes = $('<div>').text('Data di restituzione: ' + targa.dataRes).appendTo(infoDiv);
        targaDiv.addClass('non-active');
        $('<div>').addClass('dot non-active-dot').text('non attiva').appendTo(targaNumberDiv);
    } else if (targa.status == 'active') {
        const vehicle = $('<div>').text('Veicolo associato: ' + targa.veicolo).appendTo(infoDiv);
        targaDiv.addClass('active');
        $('<div>').addClass('dot active-dot').text('attiva').appendTo(targaNumberDiv);
    }
    infoDiv.appendTo(targaDiv);
    const detailsBtnDiv = $('<div>').addClass('action-btn');
    const detailsButton = $('<button>').html('Scopri di più' + '<i class="fa-solid fa-circle-info"></i>').addClass('detail-button');
    detailsButton.appendTo(detailsBtnDiv);
    detailsButton.on('click', function () {
        targaDetailsBtnClicked(targa)
    });
    detailsBtnDiv.appendTo(targaDiv);

    return targaDiv;
}*/

function createTargaCardComponent(targa) {
    const targaDiv = $('<div>').addClass('card mb-3');
    const infoDiv = $('<div>').addClass('card-body text-dark');
    const targaNumberDiv = $('<div>').addClass('card-title fw-bold d-flex justify-content-between align-items-center').text('Targa: ' + targa.number).appendTo(infoDiv);
    const dataEmDiv = $('<div>').addClass('card-text').text('Data di Emissione: ' + targa.emission_date).appendTo(infoDiv);
    if (targa.status == 'returned') {
        const vehicle = $('<div>').addClass('card-text').text('Ultimo veicolo: ' + targa.vehicle_number_id).appendTo(infoDiv);
        const dataRes = $('<div>').addClass('card-text').text('Data di restituzione: ' + targa.res_date).appendTo(infoDiv);
        targaDiv.addClass('non-active');
        $('<div>').addClass('dot non-active-dot').text('non attiva').appendTo(targaNumberDiv);
    } else if (targa.status == 'active') {
        const vehicle = $('<div>').addClass('card-text').text('Veicolo associato: ' + targa.vehicle_number_id).appendTo(infoDiv);
        targaDiv.addClass('active');
        $('<div>').addClass('dot active-dot').text('attiva').appendTo(targaNumberDiv);
    }

    const detailsBtnDiv = $('<div>').addClass('ps-2 mb-3 action-button mt-auto');
    const detailsButton = $('<button>').html('Scopri di più' + '<i class="fa-solid fa-circle-info ms-2"></i>').addClass('btn detail-button');

    detailsButton.on('click', function () {
        targaDetailsBtnClicked(targa)
    });

    infoDiv.appendTo(targaDiv);
    detailsButton.appendTo(detailsBtnDiv);
    detailsBtnDiv.appendTo(targaDiv);

    return targaDiv;
}

function createTargaDetailComponent(targa) {
    const targaDiv = $('<div>').addClass('targa card');
    const infoDiv = $('<div>').addClass('info');
    const targaNumberDiv = $('<div>').addClass('targaDiv').text('Targa: ' + targa.numero).appendTo(infoDiv);
    const dataEmDiv = $('<div>').text('Data di Emissione: ' + targa.dataEm).appendTo(infoDiv);
    if (targa.status == 'non-active') {
        const vehicle = $('<div>').text('Ultimo veicolo: ' + targa.veicolo).appendTo(infoDiv);
        const dataRes = $('<div>').text('Data di restituzione: ' + targa.dataRes).appendTo(infoDiv);
        targaDiv.addClass('non-active');
        $('<div>').addClass('dot non-active-dot').text('non attiva').appendTo(targaNumberDiv);
    } else if (targa.status == 'active') {
        const vehicle = $('<div>').text('Veicolo associato: ' + targa.veicolo).appendTo(infoDiv);
        targaDiv.addClass('active');
        $('<div>').addClass('dot active-dot').text('attiva').appendTo(targaNumberDiv);
    }
    infoDiv.appendTo(targaDiv);
    /*const detailsBtnDiv = $('<div>').addClass('action-btn');
    const detailsButton = $('<button>').html('Scopri di più' + '<i class="fa-solid fa-circle-info"></i>').addClass('detail-button');
    detailsButton.appendTo(detailsBtnDiv);
    detailsButton.on('click', function() {targaDetailsBtnClicked(targa)});
    detailsBtnDiv.appendTo(targaDiv);*/

    return targaDiv;
}

function targaDetailsBtnClicked(targa) {
    viewTargaDetails(targa);
};

function viewTargaDetails(targa) {
    window.location.href = `/vehicle-revisions/plate-details/${targa.number}/`;
}
