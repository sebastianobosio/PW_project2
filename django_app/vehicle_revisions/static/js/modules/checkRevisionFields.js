// this function check if the revions fields are correct, it responds back to the addForm and when in edit mode
export async function checkRevision(targa, dataRev) {
    return new Promise((resolve, reject) => {
        handleAjaxRequest(
            "/vehicle-revisions/plate-search/",
            "GET",
            "targa=" + targa,
            function (response) {
            if (response.success === true && response.data[0]) {
                const dataEm = response.data[0]["emission_date"];
                const dataRes = response.data[0]["res_date"];
                const dataEmObj = new Date(dataEm);
                const dataResObj = new Date(dataRes);
                const dataRevObj = new Date(dataRev);
                console.log(dataEm)
                console.log(dataRes)
                
                if (dataRevObj < dataEmObj) {
                    alert("Data di revisione antecedente alla data di emissione della targa associata");
                    resolve(false);
                } else if (dataRevObj > dataResObj) {
                    alert("Data di revisione posteriore alla data di restituzione della targa associata");
                    resolve(false);
                } else {
                    resolve(true);
                }     
            } else if(response.data[0] == null) {
                alert("Targa non presente nel database");
                resolve(false);
            }
        }, function (xhr, status, error) {
            console.error("Error", xhr.responseText);
            alert("Error occurred while fetching data.");
            reject(new Error("Error occurred while fetching data: " + error));
        });
    });
}
