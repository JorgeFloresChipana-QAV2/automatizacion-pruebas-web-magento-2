const { When, Then, Given } = require("@cucumber/cucumber");
const DriverFactory = require("../../core/ui/driverFactory");
const CustomersPage = require("../../main/ui/customers_page");
const CustomersPageAPI = require("../../main/api/customers_page");
const chai = require('chai');
const expect = chai.expect;
const { until } = require("selenium-webdriver");
const DashboardPage = require("../../main/ui/dashboard_page");
const RandomValues = require("../../main/utils");

Given('el usuario Administrador navega a la pagina Clientes', async function() {
    console.log("el usuario Administrador navega a la pagina Clientes");
    await DashboardPage.navigateToCustomerPage();
});

Given('el usuario Administrador elimina a el cliente encontrado en la tabla de clientes', async function() {
    console.log("el usuario Administrador elimina a el cliente encontrado en la tabla de clientes");
    await CustomersPage.deleteCustomerChecked();
});

Given('el usuario Administrador busca a el cliente añadido con el buscador por palabra clave', async function() {
    console.log("el usuario Administrador busca a el cliente añadido con el buscador por palabra clave");
    await CustomersPage.searchCustomerByKeyword(this.uniqueEMailValue);
});

When('el usuario Administrador busca a el cliente añadido usando {string} en el buscador por palabra clave', async function(stringKey) {
    console.log("el usuario Administrador busca a el cliente añadido usando {string} en el buscador por palabra clave");
    await CustomersPage.searchCustomerByKeyword(stringKey, false);
})

Given('el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes', async function() {
    console.log("el usuario Administrador selecciona la opcion Editar para el cliente añadido en la pagina Clientes");
    await CustomersPage.clickOnEditLink(this.uniqueEMailValue);
});

When('el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:', async function(dataTable){
    console.log('el usuario Administrador edita la informacion de un existente cliente con la siguiente informacion:');
    const newEmailValue = (await CustomersPage.updateNewCustomer(dataTable));
    this.uniqueEMailValue = newEmailValue === "" ? this.uniqueEMailValue : newEmailValue;
});

When('el usuario Administrador añade un nuevo cliente con la siguiente informacion:', async function(dataTable){
    console.log('el usuario Administrador añade un nuevo cliente con la siguiente informacion:');
    this.uniqueEMailValue = await CustomersPage.addNewCustomer(dataTable);
});

When('el usuario Administrador añade un nuevo cliente por con informacion por defecto', async function(){
    console.log('el usuario Administrador añade un nuevo cliente por con informacion por defecto');
    this.uniqueEMailValue = await CustomersPageAPI.addNewCustomer();
});

Then('el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:', async function(dataTable){
    console.log('el nuevo cliente es mostrado en la tabla de clientes con la siguiente informacion:');
    const dataRows = await DriverFactory.myDriver.wait(until.elementsLocated(CustomersPage.dataRow));
    let textOfRow = "";
    const element = dataRows.pop();
    if ((await element.getText()).toString().includes(this.uniqueEMailValue))
        textOfRow = (await element.getText()).toString();

    if(typeof dataTable.rowsHash().PrefijoDelNombre !== "undefined")
        expect(textOfRow).to.include(` ${dataTable.rowsHash().PrefijoDelNombre} `);
    if(typeof dataTable.rowsHash().Nombre !== "undefined")
        expect(textOfRow).to.include(` ${dataTable.rowsHash().Nombre} `);
    if(typeof dataTable.rowsHash().SegundoNombre !== "undefined")
        expect(textOfRow).to.include(` ${dataTable.rowsHash().SegundoNombre} `);
    if(typeof dataTable.rowsHash().Apellido !== "undefined")
        expect(textOfRow).to.include(` ${dataTable.rowsHash().Apellido} `);
    if(typeof dataTable.rowsHash().SufijoDelNombre !== "undefined")
        expect(textOfRow).to.include(` ${dataTable.rowsHash().SufijoDelNombre} `);
    if(typeof dataTable.rowsHash().FechaDeNacimiento !== "undefined"){
        const date = `${RandomValues.convertDateToMoreReadableFormat(dataTable.rowsHash().FechaDeNacimiento)}`;
        console.log(textOfRow);
        console.log(date);
        expect(textOfRow).to.include(date);
    }
        
    expect(textOfRow).to.include(` ${this.uniqueEMailValue} `);
});

Then('el mensage exitoso {string} es mostrado en la parte superior de la pagina Clientes', async function(expectedMessage) {
    console.log("el mensage exitoso {string} es mostrado en la parte superior de la pagina Clientes");
    let successMessage = await DriverFactory.myDriver.findElement(CustomersPage.successMessage);
    await DriverFactory.myDriver.wait(until.elementTextContains(successMessage, expectedMessage));
    expect(successMessage).to.not.equal(undefined);
});

Then('el mensage de error {string} es mostrado en la parte superior de la pagina Clientes', async function(expectedMessage) {
    console.log("el mensage de error {string} es mostrado en la parte superior de la pagina Clientes");
    let errorMessage = await DriverFactory.myDriver.findElement(CustomersPage.errorMessage);
    await DriverFactory.myDriver.wait(until.elementTextContains(errorMessage, expectedMessage.replaceAll('\'','"')));
    expect(errorMessage).to.not.equal(undefined);
});

Then('ningun cliente es encontrado en la busqueda realizada anteriormente', async function() {
    console.log("ningun cliente es encontrado en la busqueda realizada anteriormente");
    let noRowsFound = await DriverFactory.myDriver.findElement(CustomersPage.noRowsFound);
    expect(noRowsFound).to.not.equal(undefined);
});

Then('el mensage de error {string} es mostrado en la en el formulario de la pagina Nuevo Cliente', async function(expectedError) {
    console.log("el mensage de error {string} es mostrado en la en el formulario de la pagina Nuevo Cliente");
    let errorRequiredValue = await DriverFactory.myDriver.findElement(CustomersPage.errorRequiredValue);
    await DriverFactory.myDriver.wait(until.elementTextContains(errorRequiredValue, expectedError));
    expect(errorRequiredValue).to.not.equal(undefined);
});
