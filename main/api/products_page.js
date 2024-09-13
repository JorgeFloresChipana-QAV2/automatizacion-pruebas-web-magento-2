
const configuration =require("../../configuration.json");
const environment =require("../../environment.json");
const RandomValues = require("../utils");
const RequestFetch = require("../../core/api/request_fetch");
const ProductData = require('./payload/product.json');

class ProductsPage{

    async addNewProduct() {
        const uniqueValue = RandomValues.getRandomValues("<RandomValue,10>")
        ProductData["product"]["name"] = uniqueValue;
        let payload = JSON.stringify(ProductData)
        await RequestFetch.request(`${environment.prod.apiUrl}default/V1/products`, "POST", payload.replaceAll('<skuValue>',uniqueValue));
        return uniqueValue;
    }
}

module.exports = new ProductsPage();