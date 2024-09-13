const { When, Then, Given } = require("@cucumber/cucumber");
const DriverFactory = require("../../core/ui/driverFactory");
const ProductsPage = require("../../main/ui/products_page");
const ProductsPageAPI = require("../../main/api/products_page");
const chai = require('chai');
const expect = chai.expect;
const { until } = require("selenium-webdriver");
const DashboardPage = require("../../main/ui/dashboard_page");

Given('el usuario Administrador navega a la pagina Productos', async function() {
    console.log("el usuario Administrador navega a la pagina Productos");
    await DashboardPage.navigateToProductPage();
});

Given('el usuario Administrador elimina a el producto encontrado en la tabla de Productos', async function() {
    console.log("el usuario Administrador elimina a el producto encontrado en la tabla de Productos");
    await ProductsPage.deleteProductChecked();
});

Given('el usuario Administrador busca a el producto añadido con el buscador por palabra clave', async function() {
    console.log("el usuario Administrador busca a el producto añadido con el buscador por palabra clave");
    await ProductsPage.searchProductByKeyword(this.uniqueProductValue);
});

When('el usuario Administrador busca a el producto añadido usando {string} en el buscador por palabra clave', async function(stringKey) {
    console.log("el usuario Administrador busca a el producto añadido usando {string} en el buscador por palabra clave");
    await ProductsPage.searchProductByKeyword(stringKey, false);
})

Given('el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos', async function() {
    console.log("el usuario Administrador selecciona la opcion Editar para el producto añadido en la pagina productos");
    await ProductsPage.clickOnEditLink(this.uniqueProductValue);
});

When('el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:', async function(dataTable){
    console.log('el usuario Administrador edita la informacion de un existente producto con la siguiente informacion:');
    const newUniqueProductValue = await ProductsPage.updateNewProduct(dataTable);
    this.uniqueProductValue = newUniqueProductValue === "" ? this.uniqueProductValue : newUniqueProductValue;
});

When('el usuario Administrador añade un nuevo producto con la siguiente informacion:', async function(dataTable){
    console.log('el usuario Administrador añade un nuevo producto con la siguiente informacion:');
    this.uniqueProductValue = await ProductsPage.addNewProduct(dataTable);
});

When('el usuario Administrador añade un nuevo producto por con informacion por defecto', async function(){
    console.log('el usuario Administrador añade un nuevo producto por con informacion por defecto');
    this.uniqueProductValue = await ProductsPageAPI.addNewProduct();
});

Then('el nuevo producto es mostrado en la tabla de productos con la siguiente informacion:', async function(dataTable){
    console.log('el nuevo producto es mostrado en la tabla de productos con la siguiente informacion:');
    const dataRows = await DriverFactory.myDriver.wait(until.elementsLocated(ProductsPage.dataRow));
    let textOfRow = "";
    const element = dataRows.pop();
    if ((await element.getText()).toString().includes(this.uniqueProductValue))
        textOfRow = (await element.getText()).toString();
    console.log(textOfRow);
    console.log(this.uniqueProductValue);
    console.log(dataTable.rowsHash().SKU);
    console.log(dataTable.rowsHash().Precio);
    console.log(dataTable.rowsHash().Cantidad);
    if (dataTable.rowsHash().NombreDelProducto !== "undefined")
        expect(textOfRow).to.include(` ${this.uniqueProductValue} `);
    if (dataTable.rowsHash().SKU !== "undefined")
        expect(textOfRow).to.include(`${dataTable.rowsHash().SKU} `);
    if (dataTable.rowsHash().Precio !== "undefined")
        expect(textOfRow).to.include(`$${dataTable.rowsHash().Precio}`);
    if (dataTable.rowsHash().Cantidad !== undefined)
        expect(textOfRow).to.include(`${dataTable.rowsHash().Cantidad}`);
});

Then('el mensage exitoso {string} es mostrado en la parte superior de la pagina Productos', async function(expectedMessage) {
    console.log("el mensage exitoso {string} es mostrado en la parte superior de la pagina Productos");
    let successMessage = await DriverFactory.myDriver.findElement(ProductsPage.successMessage);
    await DriverFactory.myDriver.wait(until.elementTextContains(successMessage, expectedMessage));
    expect(successMessage).to.not.equal(undefined);
});

Then('ningun producto es encontrado en la busqueda realizada anteriormente', async function() {
    console.log("ningun producto es encontrado en la busqueda realizada anteriormente");
    let noRowsFound = await DriverFactory.myDriver.findElement(ProductsPage.noRowsFound);
    expect(noRowsFound).to.not.equal(undefined);
});

Then('el mensage de error {string} es mostrado en la en el formulario de la pagina Nuevo Producto', async function(expectedError) {
    console.log("el mensage de error {string} es mostrado en la en el formulario de la pagina Nuevo Producto");
    let errorRequiredValue = await DriverFactory.myDriver.findElement(ProductsPage.errorRequiredValue);
    await DriverFactory.myDriver.wait(until.elementTextContains(errorRequiredValue, expectedError));
    expect(errorRequiredValue).to.not.equal(undefined);
});