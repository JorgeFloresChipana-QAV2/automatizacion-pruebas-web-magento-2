const environment = require("../../environment.json");
const DriverFactory = require("../../core/ui/driverFactory");
const RandomValues = require("../../main/utils");
const LoginPage = require("../../main/ui/login_page");
const { until } = require("selenium-webdriver");
const RequestFetch = require("../../core/api/request_fetch");

module.exports = class CommonFlows{

    static async login(scenario) {
        console.log("Hook: Starting Login");
        const usernameInput = await DriverFactory.myDriver.wait(until.elementLocated(LoginPage.usernameInput));
        await usernameInput.sendKeys(environment.prod.userAdmin.username);

        const passwordInput = await DriverFactory.myDriver.wait(until.elementLocated(LoginPage.passwordInput));
        await passwordInput.sendKeys(environment.prod.userAdmin.password);

        const loginButton = await DriverFactory.myDriver.wait(until.elementLocated(LoginPage.loginButton));
        await loginButton.click();
        await DriverFactory.myDriver.sleep(1000);
        return true;
    }

    static async createCustomer() {
        console.log("Hook: Starting to create new Customer via API");
        try {
            const response = await RequestFetch.request(`${environment.prod.apiUrl}default/V1/customers/search?searchCriteria[filterGroups][0][filters][0][conditionType]=eq&searchCriteria[filterGroups][0][filters][0][field]=email&searchCriteria[filterGroups][0][filters][0][value]=${uniqueValue}`, "GET")
            const data = await response.json();
            await RequestFetch.request(`${environment.prod.apiUrl}default/V1/customers/${data["items"][0]["id"]}`, "DEL");
            return undefined
        } catch{}
    }

    static async deleteCustomer(uniqueValue) {
        console.log("Hook: Starting to delete the Customer with unique value: "+uniqueValue);
        try {
            if (uniqueValue !== undefined) {
                const response = await RequestFetch.request(`${environment.prod.apiUrl}default/V1/customers/search?searchCriteria[filterGroups][0][filters][0][conditionType]=eq&searchCriteria[filterGroups][0][filters][0][field]=email&searchCriteria[filterGroups][0][filters][0][value]=${uniqueValue}`, "GET")
                const data = await response.json();
                await RequestFetch.request(`${environment.prod.apiUrl}default/V1/customers/${data["items"][0]["id"]}`, "DEL");
                return undefined
            } else {
                console.log("No Customer to delete.");
            }
        } catch{}
    }

    static async deleteProduct(uniqueValue) {
        console.log("Hook: Starting to delete product with unique value: "+uniqueValue);
        try{
            if (uniqueValue !== undefined) {
                const response = await RequestFetch.request(`${environment.prod.apiUrl}default/V1/products?searchCriteria[filterGroups][0][filters][0][conditionType]=eq&searchCriteria[filterGroups][0][filters][0][field]=name&searchCriteria[filterGroups][0][filters][0][value]=${uniqueValue}`, "GET")
                const data = await response.json();
                await RequestFetch.request(`${environment.prod.apiUrl}default/V1/products/${data["items"][0]["sku"]}`, "DEL");
                console.log("Product deleted");
                return undefined
            } else {
                console.log("No Product to delete.");
            }
        } catch {}
    }
}
