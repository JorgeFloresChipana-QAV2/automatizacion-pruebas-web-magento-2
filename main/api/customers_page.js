
const configuration =require("../../configuration.json");
const environment =require("../../environment.json");
const RandomValues = require("../../main/utils");
const RequestFetch = require("../../core/api/request_fetch");
const CustomerData = require('../../main/api/payload/customer.json');

class CustomersPage{

    async addNewCustomer() {
        const uniqueEMailValue = RandomValues.getRandomValues("<RandomEmail,15>")
        CustomerData["customer"]["email"] = uniqueEMailValue;
        let payload = JSON.stringify(CustomerData)
        await RequestFetch.request(`${environment.prod.apiUrl}default/V1/customers`, "POST", payload);
        return uniqueEMailValue;
    }
}

module.exports = new CustomersPage();