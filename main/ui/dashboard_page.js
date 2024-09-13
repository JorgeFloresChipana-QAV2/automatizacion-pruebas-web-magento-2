const { By, until } = require("selenium-webdriver");
const DriverFactory = require("../../core/ui/driverFactory");
const configuration =require("../../configuration.json");

class DashboardPage{
    customerPageURL = By.css('.item-catalog-products a');
    productsPageURL = By.css('.item-customer-manage a');
    customerMenu = By.css('#menu-magento-customer-customer > a > span');
    productMenu = By.css('#menu-magento-catalog-catalog > a > span');
    subMenuArea = By.css('div[class="submenu"][aria-expanded="true"]');
    allCustomersMenuOption = By.css('.item-customer-manage > a > span');
    productsMenuOption = By.css('.item-catalog-products > a > span');
    closeModalPopup = By.css('.modal-popup button');
    spinner = By.css('#anchor-content div[class="spinner"]');

    async navigateToCustomerPage(){
        const currentURL = (await DriverFactory.myDriver.getCurrentUrl()).toString();
        if (!currentURL.includes("customer") || 
        (currentURL.includes("customer") && (currentURL.includes("new")||currentURL.includes("edit")))){
            const customerMenu = await DriverFactory.myDriver.wait(until.elementLocated(this.customerMenu));
            await customerMenu.click();
            await DriverFactory.myDriver.sleep(1000);
            await DriverFactory.myDriver.wait(until.elementLocated(this.subMenuArea));
            const allCustomersMenuOption = await DriverFactory.myDriver.wait(until.elementLocated(this.allCustomersMenuOption));
            await allCustomersMenuOption.click();
            await DriverFactory.myDriver.sleep(2000);
            const spinner = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
            await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinner), configuration.browser.timeout);
        }else{
            console.log("Not neccesary navigate to Customer page, refreshing");
            await DriverFactory.myDriver.navigate().refresh();
            const spinner = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
            await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinner), configuration.browser.timeout);
        }
    }

    async navigateToProductPage(){
        const currentURL = (await DriverFactory.myDriver.getCurrentUrl()).toString();
        if (!currentURL.includes("product") || 
        (currentURL.includes("product") && (currentURL.includes("new")||currentURL.includes("edit")))){
            const productoMenu = await DriverFactory.myDriver.wait(until.elementLocated(this.productMenu));
            await productoMenu.click();
            await DriverFactory.myDriver.sleep(1000);
            await DriverFactory.myDriver.wait(until.elementLocated(this.subMenuArea));
            const allProductosMenuOption = await DriverFactory.myDriver.wait(until.elementLocated(this.productsMenuOption));
            await allProductosMenuOption.click();
            await DriverFactory.myDriver.sleep(2000);
            const spinner = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
            await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinner), configuration.browser.timeout);
        }else{
            console.log("Not neccesary navigate to Product page, refreshing");
            await DriverFactory.myDriver.navigate().refresh();
            const spinner = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
            await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinner), configuration.browser.timeout);
        }
    }

    async goToCustomerPageURL(){
        const customerMenu = await DriverFactory.myDriver.wait(until.elementLocated(this.customerPageURL));
        const customerPageURL = await customerMenu.getAttribute("href");
        await DriverFactory.myDriver.get(customerPageURL);
        await DriverFactory.myDriver.sleep(1000);

        const spinner = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
        await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinner), configuration.browser.timeout);
    }

    async goToProductPageURL(){
        const customerMenu = await DriverFactory.myDriver.wait(until.elementLocated(this.productsPageURL));
        const customerPageURL = await customerMenu.getAttribute("href");
        await DriverFactory.myDriver.get(customerPageURL);
        await DriverFactory.myDriver.sleep(1000);
        
        const spinner = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
        await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinner), configuration.browser.timeout);
    }
}

module.exports = new DashboardPage();