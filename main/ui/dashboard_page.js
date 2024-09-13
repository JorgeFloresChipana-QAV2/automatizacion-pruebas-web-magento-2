const { By, until } = require("selenium-webdriver");

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
}

module.exports = new DashboardPage();