import { renderVeicoloCard } from "../renderComponents/renderVeicolo.js";

$(document).ready(function () {
    $("#searchForm").submit(searchFormSubmitted);

    // when loaded it calls for a default search (all fields are empty)
    performDefaultSearch();

    function searchFormSubmitted(event) {
        event.preventDefault();

        var formData = $(this).serialize();
        performSearch(formData);
    }

    // fetch data from backend and render them in the searchResults div
    function performSearch(formData) {
        $.ajax({
            url: "",
            type: "GET",
            data: formData,
            dataType: "json",
            success: function(response) {
                if (response.success === true) {
                    $("#searchForm")[0].reset();
                    var data = response.data;
                    $("#searchResults").empty();
                    data.forEach((veicolo) => {
                        var veicoloComponent = renderVeicoloCard(veicolo);
                        veicoloComponent.appendTo($("#searchResults"));
                    });
                } else {
                    alert("Non sono state trovate corrispondenze");
                }
            },
            error: function(xhr, status, error) {
                console.error("Error", xhr.responseText);
                alert("Error occurred while fetching data.");
            }
        });
    }

    function performDefaultSearch() {
        performSearch(null);
    }
});
