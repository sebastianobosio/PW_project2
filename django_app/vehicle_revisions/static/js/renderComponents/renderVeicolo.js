export function renderVeicoloCard(veicolo) {
    const veicoloComponent = createVeicoloCardComponent(veicolo);
    return veicoloComponent;
}

export function renderVeicoloDetail(veicolo) {
    const veicoloComponent = createVeicoloDetailComponent(veicolo);
    return veicoloComponent;
}

function createVeicoloCardComponent(veicolo) {
    const vehicleDiv = $('<div>').addClass('card mb-3');
    const infoDiv = $('<div>').addClass('card-body text-dark');
    
    const veicoloNumberDiv = $('<p>').addClass('card-title fw-bold').text('Telaio: ' + veicolo.number).appendTo(infoDiv);
    const veicoloModelDiv = $('<p>').addClass('card-text').text('Modello: ' + veicolo.model).appendTo(infoDiv);
    const veicoloBrandDiv = $('<p>').addClass('card-text').text('Marca: ' + veicolo.brand).appendTo(infoDiv);
    const veicoloProdDateDiv = $('<p>').addClass('card-text').text('Data di produzione: ' + veicolo.prod_date).appendTo(infoDiv);
    
    const detailsBtnDiv = $('<div>').addClass('ps-2 mb-3 action-button mt-auto');
    const detailsButton = $('<button>').html('Scopri di più' + '<i class="fa-solid fa-circle-info ms-2"></i>').addClass('btn detail-button');
    
    detailsButton.on('click', function() {
        veicoloDetailsBtnClicked(veicolo);
    });

    infoDiv.appendTo(vehicleDiv);
    detailsButton.appendTo(detailsBtnDiv);
    detailsBtnDiv.appendTo(vehicleDiv);

    return vehicleDiv;
}

function createVeicoloDetailComponent(veicolo) {
    const vehicleDiv = $('<div>').addClass('card mb-3');
    const infoDiv = $('<div>').addClass('card-body text-dark');
    
    const veicoloNumberDiv = $('<p>').addClass('card-title fw-bold').text('Telaio: ' + veicolo.number).appendTo(infoDiv);
    const veicoloModelDiv = $('<p>').addClass('card-text').text('Modello: ' + veicolo.model).appendTo(infoDiv);
    const veicoloBrandDiv = $('<p>').addClass('card-text').text('Marca: ' + veicolo.brand).appendTo(infoDiv);
    const veicoloProdDateDiv = $('<p>').addClass('card-text').text('Data di produzione: ' + veicolo.prod_date).appendTo(infoDiv);
    infoDiv.appendTo(vehicleDiv);
    /*const detailsBtnDiv = $('<div>').addClass('action-btn');
    const detailsButton = $('<button>').html('Scopri di più' + '<i class="fa-solid fa-circle-info"></i>').addClass('detail-button');
    detailsButton.appendTo(detailsBtnDiv)

    detailsButton.on('click', function() {veicoloDetailsBtnClicked(veicolo)});
    detailsBtnDiv.appendTo(vehicleDiv);*/

    return vehicleDiv;
}

function veicoloDetailsBtnClicked(veicolo) {
    viewVeicoloDetails(veicolo);
};

function viewVeicoloDetails(veicolo) {
    window.location.href = `/vehicle-revisions/vehicle-details/${veicolo.number}/`;
}
