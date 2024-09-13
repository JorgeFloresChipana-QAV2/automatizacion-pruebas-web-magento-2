const { By, until, Key } = require("selenium-webdriver");
const DriverFactory = require("../../core/ui/driverFactory");
const configuration =require("../../configuration.json");
const RandomValues = require("../utils");

class ProductsPage{
    addNewProductButton = By.css('button[id=add_new_product-button]');
    enableProductButtonSwitch = By.css('input[name="product[status]"] ~ .admin__actions-switch-label');
    productNameTextField = By.css('input[name="product[name]"]');
    sKUTextField = By.css('input[name="product[sku]"]');
    priceTextField = By.css('input[name="product[price]"]');
    taxNoneDropdown = By.css('select[name="product[tax_class_id]"] > option[data-title="None"]');
    taxTaxableGoodsDropdown = By.css('select[name="product[tax_class_id]"] > option[data-title="Taxable Goods"]');
    taxRefundAdjustmentsDropdown = By.css('select[name="product[tax_class_id]"] > option[data-title="Refund Adjustments"]');
    taxGiftOptionsDropdown = By.css('select[name="product[tax_class_id]"] > option[data-title="Gift Options"]');
    taxOrderGiftWrappingDropdown = By.css('select[name="product[tax_class_id]"] > option[data-title="Order Gift Wrapping"]');
    taxItemGiftWrappingDropdown = By.css('select[name="product[tax_class_id]"] > option[data-title="Item Gift Wrapping"]');
    taxPrintedGiftCardDropdown = By.css('select[name="product[tax_class_id]"] > option[data-title="Printed Gift Card"]');
    taxRewardPointsDropdown = By.css('select[name="product[tax_class_id]"] > option[data-title="Reward Points"]');
    quantityAndStockStatusTextField = By.css('input[name="product[quantity_and_stock_status][qty]"]');
    inStockDropdown = By.css('select[name="product[quantity_and_stock_status][is_in_stock]"] > option[data-title="In Stock"]');
    outOfStockDropdown = By.css('select[name="product[quantity_and_stock_status][is_in_stock]"] > option[data-title="Out of Stock"]');
    weightTextField = By.css('input[name="product[weight]"]');
    noWeightOptionForWeightDropdown = By.css('select[name="product[product_has_weight]"] option[data-title="This item has no weight"]');
    visibilityNotVisibleIndividuallyDropdown = By.css('select[name="product[visibility]"] > option[data-title="Not Visible Individually"]');
    visibilityCatalogDropdown = By.css('select[name="product[visibility]"] > option[data-title="Catalog"]');
    visibilitySearchDropdown = By.css('select[name="product[visibility]"] > option[data-title="Search"]');
    visibilityCatalogSearchDropdown = By.css('select[name="product[visibility]"] > option[data-title="Catalog, Search"]');
    categoriesDropdown = By.css('div[data-index="category_ids"] .admin__action-multiselect-text');
    optionsOfCategoriesDropdown = By.css('.action-menu._active .action-menu-item._with-checkbox');
    categoriesSelectedInDropdown = By.css('.admin__action-multiselect-crumb');
    doneButtonOfCategoriesDropdown = By.css('.action-menu._active button');
    optionOfCountryOfManufactureDropdown = By.css('select[name="product[country_of_manufacture]"] > option[data-title="{0}"]');
    saveDropdown = By.css('#save-button ~ button');
    saveAndCloseButton = By.css('.actions-split.save.primary.active #save_and_close');
    successMessage = By.css('div[data-ui-id="messages-message-success"]');
    errorMessage = By.css('.page-main-actions ~ #messages .message.message-error.error div');
    noRowsFound = By.css('.data-grid-tr-no-data');
    errorRequiredValue = By.css('.admin__field-error');
    dataRow = By.css('tbody > .data-row');
    nextPageButton = By.css('.row .action-next');
    searchByKeywordTextField = By.css('div[data-bind="afterRender: $data.setToolbarNode"] #fulltext');
    searchByKeywordButton = By.css('div[data-bind="afterRender: $data.setToolbarNode"] #fulltext ~ button');
    actionsDropDown = By.css('div[data-bind="afterRender: $data.setToolbarNode"] .action-select');
    optionsInActionsDropDown = By.css('div[data-bind="afterRender: $data.setToolbarNode"] ._active .action-menu-item');
    okButtonToDelete = By.css('.modal-footer .action-accept');
    spinner = By.css('#anchor-content div[class="spinner"]');

    async addNewProduct(dataTable) {
        const addNewProductButtonElement = await DriverFactory.myDriver.wait(until.elementLocated(this.addNewProductButton));
        await DriverFactory.myDriver.wait(until.elementIsVisible(addNewProductButtonElement), configuration.browser.timeout);
        await addNewProductButtonElement.click();
        await DriverFactory.myDriver.sleep(1000);
        let spinnerElement = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
        await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinnerElement), configuration.browser.timeout);
        await DriverFactory.myDriver.sleep(1000);
        const enableProductButtonSwitch = await DriverFactory.myDriver.wait(until.elementLocated(this.enableProductButtonSwitch));
        const productNameTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.productNameTextField));
        const sKUTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.sKUTextField));
        const priceTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.priceTextField));
        const taxNoneDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.taxNoneDropdown));
        const quantityAndStockStatusTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.quantityAndStockStatusTextField));
        const weightTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.weightTextField));
        const noWeightOptionForWeightDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.noWeightOptionForWeightDropdown));
        const categoriesDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.categoriesDropdown));
        
        const newUniqueProductValue = RandomValues.getRandomValues(dataTable.rowsHash().NombreDelProducto)
        if (typeof dataTable.rowsHash().HabilitarProducto !== "undefined"){
            await enableProductButtonSwitch.click();
        }
        if (typeof dataTable.rowsHash().NombreDelProducto !== "undefined"){
            await productNameTextField.sendKeys(newUniqueProductValue);
        }
        if (typeof dataTable.rowsHash().SKU !== "undefined"){
            await sKUTextField.clear();
            await sKUTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().SKU));
        }
        if (typeof dataTable.rowsHash().Precio !== "undefined"){
            await priceTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().Precio));
        }
        await taxNoneDropdown.click();
        if (typeof dataTable.rowsHash().Cantidad !== "undefined"){
            await quantityAndStockStatusTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().Cantidad));
        }
        if (typeof dataTable.rowsHash().EstadoDeExistencias !== "undefined"){
            if (dataTable.rowsHash().EstadoDeExistencias.includes("exitencia")){
                const inStockDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.inStockDropdown));
                await inStockDropdown.click();
            }
            if (dataTable.rowsHash().EstadoDeExistencias.includes("agotado")) {
                const outOfStockDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.outOfStockDropdown));
                await outOfStockDropdown.click();
            }
        }
        if (typeof dataTable.rowsHash().Peso !== "undefined"){
            await weightTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().Peso));
        } else {
            await noWeightOptionForWeightDropdown.click();
        }
        if (typeof dataTable.rowsHash().Visibilidad !== "undefined"){
            if (dataTable.rowsHash().Visibilidad.includes("no"))
            await (await DriverFactory.myDriver.wait(until.elementLocated(this.visibilityNotVisibleIndividuallyDropdown))).click();
            if (dataTable.rowsHash().Visibilidad.includes("catalogo"))
                await (await DriverFactory.myDriver.wait(until.elementLocated(this.visibilityCatalogDropdown))).click();
            if (dataTable.rowsHash().Visibilidad.includes("Buscar"))
                await (await DriverFactory.myDriver.wait(until.elementLocated(this.visibilitySearchDropdown))).click();
            if (dataTable.rowsHash().Visibilidad.includes("catalogo y busqueda"))
                await (await DriverFactory.myDriver.wait(until.elementLocated(this.visibilityCatalogSearchDropdown))).click();
        }
        if (typeof dataTable.rowsHash().Categorias !== "undefined"){
            await categoriesDropdown.click();
            const optionsOfCategoriesDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.optionsOfCategoriesDropdown));
            for (let i = 0; i < optionsOfCategoriesDropdown.length; i++) {
                const element = optionsOfCategoriesDropdown[i];
                if ((await element.getText()).toString().includes(dataTable.rowsHash().Categorias)) {
                    await element.click();
                    break;
                }
            }
            const doneButtonOfCategoriesDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.doneButtonOfCategoriesDropdown));
            await doneButtonOfCategoriesDropdown.click();
        }
        if (typeof dataTable.rowsHash().PaisDeFabricacion !== "undefined"){
            const countryOption = By.css('select[name="product[country_of_manufacture]"] > option[data-title="'+dataTable.rowsHash().PaisDeFabricacion+'"]');
            const optionOfCountryOfManufactureDropdown = await DriverFactory.myDriver.wait(until.elementLocated(countryOption));
            optionOfCountryOfManufactureDropdown.click();
        }
        const saveButton = await DriverFactory.myDriver.wait(until.elementLocated(this.saveDropdown));
        await saveButton.click();
        const saveAndCloseButton = await DriverFactory.myDriver.wait(until.elementLocated(this.saveAndCloseButton));
        await saveAndCloseButton.click();
        await DriverFactory.myDriver.sleep(2000);
        spinnerElement = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
        await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinnerElement), configuration.browser.timeout);
        await DriverFactory.myDriver.sleep(1000);
        return newUniqueProductValue;
    }

    async updateNewProduct(dataTable) {
        const enableProductButtonSwitch = await DriverFactory.myDriver.wait(until.elementLocated(this.enableProductButtonSwitch));
        const productNameTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.productNameTextField));
        const sKUTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.sKUTextField));
        const priceTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.priceTextField));
        const taxNoneDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.taxNoneDropdown));
        const quantityAndStockStatusTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.quantityAndStockStatusTextField));
        const weightTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.weightTextField));
        const noWeightOptionForWeightDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.noWeightOptionForWeightDropdown));
        const categoriesDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.categoriesDropdown));
        
        let newUniqueProductValue = "";
        if (typeof dataTable.rowsHash().HabilitarProducto !== "undefined"){
            await enableProductButtonSwitch.click();
        }
        if (typeof dataTable.rowsHash().NombreDelProducto !== "undefined"){
            newUniqueProductValue = RandomValues.getRandomValues(dataTable.rowsHash().NombreDelProducto);
            await productNameTextField.clear();
            await productNameTextField.sendKeys(newUniqueProductValue);
        }
        if (typeof dataTable.rowsHash().SKU !== "undefined"){
            await sKUTextField.clear();
            await sKUTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().SKU));
        }
        if (typeof dataTable.rowsHash().Precio !== "undefined"){
            await priceTextField.clear();
            await priceTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().Precio));
        }
        await taxNoneDropdown.click();
        if (typeof dataTable.rowsHash().Cantidad !== "undefined"){
            await quantityAndStockStatusTextField.clear();
            await quantityAndStockStatusTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().Cantidad));
        }
        if (typeof dataTable.rowsHash().EstadoDeExistencias !== "undefined"){
            if (dataTable.rowsHash().EstadoDeExistencias.includes("exitencia")){
                const inStockDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.inStockDropdown));
                await inStockDropdown.click();
            }
            if (dataTable.rowsHash().EstadoDeExistencias.includes("agotado")) {
                const outOfStockDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.outOfStockDropdown));
                await outOfStockDropdown.click();
            }
        }
        if (typeof dataTable.rowsHash().Peso !== "undefined"){
            await weightTextField.clear();
            await weightTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().Peso));
        } else {
            await noWeightOptionForWeightDropdown.click();
        }
        if (typeof dataTable.rowsHash().Visibilidad !== "undefined"){
            if (dataTable.rowsHash().Visibilidad.includes("no"))
            await (await DriverFactory.myDriver.wait(until.elementLocated(this.visibilityNotVisibleIndividuallyDropdown))).click();
            if (dataTable.rowsHash().Visibilidad.includes("catalogo"))
                await (await DriverFactory.myDriver.wait(until.elementLocated(this.visibilityCatalogDropdown))).click();
            if (dataTable.rowsHash().Visibilidad.includes("Buscar"))
                await (await DriverFactory.myDriver.wait(until.elementLocated(this.visibilitySearchDropdown))).click();
            if (dataTable.rowsHash().Visibilidad.includes("catalogo y busqueda"))
                await (await DriverFactory.myDriver.wait(until.elementLocated(this.visibilityCatalogSearchDropdown))).click();
        }
        if (typeof dataTable.rowsHash().Categorias !== "undefined"){
            const categoriesSelectedInDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.categoriesSelectedInDropdown));
            for (let i = 0; i < categoriesSelectedInDropdown.length; i++) {
                const element = categoriesSelectedInDropdown[i];
                await (await element.findElement(By.className("action-close"))).click();
            }
            await categoriesDropdown.click();
            const optionsOfCategoriesDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.optionsOfCategoriesDropdown));
            for (let i = 0; i < optionsOfCategoriesDropdown.length; i++) {
                const element = optionsOfCategoriesDropdown[i];
                if ((await element.getText()).toString().includes(dataTable.rowsHash().Categorias)) {
                    await element.click();
                    break;
                }
            }
            const doneButtonOfCategoriesDropdown = await DriverFactory.myDriver.wait(until.elementLocated(this.doneButtonOfCategoriesDropdown));
            await doneButtonOfCategoriesDropdown.click();
        }
        if (typeof dataTable.rowsHash().PaisDeFabricacion !== "undefined"){
            const countryOption = By.css('select[name="product[country_of_manufacture]"] > option[data-title="'+dataTable.rowsHash().PaisDeFabricacion+'"]');
            const optionOfCountryOfManufactureDropdown = await DriverFactory.myDriver.wait(until.elementLocated(countryOption));
            optionOfCountryOfManufactureDropdown.click();
        }
        const saveButton = await DriverFactory.myDriver.wait(until.elementLocated(this.saveDropdown));
        await saveButton.click();
        await DriverFactory.myDriver.sleep(500);
        const saveAndCloseButton = await DriverFactory.myDriver.wait(until.elementLocated(this.saveAndCloseButton));
        await saveAndCloseButton.click();
        await DriverFactory.myDriver.sleep(2000);
        try{
            spinnerElement = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
            await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinnerElement), configuration.browser.timeout);
            await DriverFactory.myDriver.sleep(1000);
        }catch{}
        

        return newUniqueProductValue;
    }

    async clickOnEditLink(uniqueValue){
        const searchByKeywordTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.searchByKeywordTextField));
        await searchByKeywordTextField.clear();
        await searchByKeywordTextField.sendKeys(uniqueValue);
        await DriverFactory.myDriver.sleep(1000);
        const searchByKeywordButton = await DriverFactory.myDriver.wait(until.elementLocated(this.searchByKeywordButton));
        await searchByKeywordButton.sendKeys(Key.SHIFT);
        await searchByKeywordButton.click();
        await DriverFactory.myDriver.sleep(2000);
        const dataRows = await DriverFactory.myDriver.wait(until.elementsLocated(this.dataRow));
        for (let i = 0; i < dataRows.length; i++) {
            const element = dataRows.pop();
            if ((await element.getText()).toString().includes(uniqueValue)) {
                console.log((await element.getText()).toString());
                const editLink = await element.findElement(By.className('action-menu-item'));
                await editLink.sendKeys(Key.SHIFT);
                await editLink.click();
                await DriverFactory.myDriver.sleep(2000);
                break;
            }
        }
        const spinner = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
        await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinner), configuration.browser.timeout); 
        await DriverFactory.myDriver.sleep(1000);
    }

    async searchProductByKeyword(uniqueValue, checkRowsFound=true){
        const searchByKeywordTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.searchByKeywordTextField));
        await searchByKeywordTextField.clear();
        await searchByKeywordTextField.sendKeys(uniqueValue);
        const searchByKeywordButton = await DriverFactory.myDriver.wait(until.elementLocated(this.searchByKeywordButton));
        await searchByKeywordButton.click();
        await DriverFactory.myDriver.sleep(2000);
        if (checkRowsFound){
            const dataRows = await DriverFactory.myDriver.wait(until.elementsLocated(this.dataRow));
            for (let i = 0; i < dataRows.length; i++) {
                const element = dataRows.pop();
                if ((await element.getText()).toString().includes(uniqueValue)) {
                    console.log((await element.getText()).toString());
                    const checkbox =  await element.findElement(By.className('admin__control-checkbox'));
                    if (!await checkbox.isSelected())
                        await checkbox.click()
                    break;
                }
            }
        }
    }

    async deleteProductChecked(){
        const actionDropDown = await DriverFactory.myDriver.wait(until.elementLocated(this.actionsDropDown));
        await actionDropDown.click();
        const optionsInActionDropDown = await DriverFactory.myDriver.wait(until.elementsLocated(this.optionsInActionsDropDown));
        await optionsInActionDropDown[0].click();
        await DriverFactory.myDriver.sleep(1000);
        const okButtonToDelete = await DriverFactory.myDriver.wait(until.elementLocated(this.okButtonToDelete));
        await okButtonToDelete.click();
        await DriverFactory.myDriver.sleep(1000);
    }
}

module.exports = new ProductsPage();