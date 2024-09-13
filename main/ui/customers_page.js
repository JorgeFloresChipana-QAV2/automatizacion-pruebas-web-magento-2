const { By, until, Key } = require("selenium-webdriver");
const DriverFactory = require("../../core/ui/driverFactory");
const configuration =require("../../configuration.json");
const RandomValues = require("../../main/utils");
const DashboardPage = require("../../main/ui/dashboard_page");

class CustomersPage{
    addNewCustomerButton = By.css('button[title="Add New Customer"]');
    namePrefixTextField = By.css('input[name="customer[prefix]"]');
    firstNameTextField = By.css('input[name="customer[firstname]"]');
    middleNameTextField = By.css('input[name="customer[middlename]"]');
    lastnameTextField = By.css('input[name="customer[lastname]"]');
    suffixTextField = By.css('input[name="customer[suffix]"]');
    emailTextField = By.css('input[name="customer[email]"');
    dobTextField = By.css('input[name="customer[dob]"]');
    taxvatTextField = By.css('input[name="customer[taxvat]"]');
    saveCustomerButton = By.css('button[title="Save Customer"]');
    successMessage = By.css('div[data-ui-id="messages-message-success"]');
    errorMessage = By.css('.page-main-actions ~ #messages .message.message-error.error div');
    noRowsFound = By.css('.data-grid-tr-no-data');
    errorRequiredValue = By.css('.admin__field-error');
    dataRow = By.css('tbody > .data-row');
    nextPageButton = By.css('.row .action-next');
    searchByKeywordTextField = By.css('div[data-bind="afterRender: $data.setToolbarNode"] #fulltext');
    searchByKeywordButton = By.css('div[data-bind="afterRender: $data.setToolbarNode"] #fulltext ~ button');
    accountInformationTab = By.css('#tab_customer');
    actionDropDown = By.css('div[data-bind="afterRender: $data.setToolbarNode"] .action-select');
    optionsInActionDropDown = By.css('div[data-bind="afterRender: $data.setToolbarNode"] ._active .action-menu-item');
    okButtonToDelete = By.css('.modal-footer .action-accept');
    spinner = By.css('#anchor-content div[class="spinner"]');
    calendarButton = By.css('.ui-datepicker-trigger.v-middle');
    allYearsOfCalendarDropdown = By.css('div[id="ui-datepicker-div"][style*="display: block;"] .ui-datepicker-year option');
    allMonthsOfCalendarDropdown = By.css('div[id="ui-datepicker-div"][style*="display: block;"] .ui-datepicker-month option');
    allSelectableDaysOfCalendarDropdown = By.css('div[id="ui-datepicker-div"][style*="display: block;"] td[data-handler="selectDay"]');
    allUnselectableDaysOfCalendarDropdown = By.css('div[id="ui-datepicker-div"][style*="display: block;"]  .ui-state-disabled span');

    async addNewCustomer(dataTable) {
        const addNewCustomerButtonElement = await DriverFactory.myDriver.wait(until.elementLocated(this.addNewCustomerButton));
        await DriverFactory.myDriver.wait(until.elementIsVisible(addNewCustomerButtonElement), configuration.browser.timeout);
        await addNewCustomerButtonElement.click();
        await DriverFactory.myDriver.sleep(1000);
        let spinnerElement = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
        await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinnerElement), configuration.browser.timeout);
        await DriverFactory.myDriver.sleep(1000);
        const namePrefixTextFieldElement = await DriverFactory.myDriver.wait(until.elementLocated(this.namePrefixTextField));
        const firstNameTextFieldElement = await DriverFactory.myDriver.wait(until.elementLocated(this.firstNameTextField));
        const middleNameTextFieldElement = await DriverFactory.myDriver.wait(until.elementLocated(this.middleNameTextField));
        const lastnameTextFieldElement = await DriverFactory.myDriver.wait(until.elementLocated(this.lastnameTextField));
        const suffixTextFieldElement = await DriverFactory.myDriver.wait(until.elementLocated(this.suffixTextField));
        const emailTextFieldElement = await DriverFactory.myDriver.wait(until.elementLocated(this.emailTextField));
        const dobTextFieldElement = await DriverFactory.myDriver.wait(until.elementLocated(this.dobTextField));
        const taxvatTextFieldElement = await DriverFactory.myDriver.wait(until.elementLocated(this.taxvatTextField));
        const calendarButton = await DriverFactory.myDriver.wait(until.elementLocated(this.calendarButton));

        if(typeof dataTable.rowsHash().PrefijoDelNombre !== "undefined")
            await namePrefixTextFieldElement.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().PrefijoDelNombre));
        if(typeof dataTable.rowsHash().Nombre !== "undefined")
            await firstNameTextFieldElement.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().Nombre));
        if(typeof dataTable.rowsHash().SegundoNombre !== "undefined")
            await middleNameTextFieldElement.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().SegundoNombre));
        if(typeof dataTable.rowsHash().Apellido !== "undefined")
            await lastnameTextFieldElement.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().Apellido));
        if(typeof dataTable.rowsHash().SufijoDelNombre !== "undefined")
            await suffixTextFieldElement.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().SufijoDelNombre));
        const uniqueEMailValue = RandomValues.getRandomValues(dataTable.rowsHash().CorreoElectronico)
        if(typeof dataTable.rowsHash().CorreoElectronico !== "undefined")
            await emailTextFieldElement.sendKeys(uniqueEMailValue);
        if(typeof dataTable.rowsHash().FechaDeNacimiento !== "undefined"){
            if (!dataTable.rowsHash().FechaDeNacimiento.includes('<')){
                await dobTextFieldElement.sendKeys(dataTable.rowsHash().FechaDeNacimiento);
            } else {
                await calendarButton.click();
                await DriverFactory.myDriver.sleep(500);
                if (dataTable.rowsHash().FechaDeNacimiento.includes('FirstSelectableDayOfCalendarPopup')){
                    console.log("FirstSelectableDayOfCalendarPopup");
                    const allYearsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allYearsOfCalendarDropdown));
                    await allYearsOfCalendarDropdown[0].click();
                    await DriverFactory.myDriver.sleep(500);
                    const allMonthsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allMonthsOfCalendarDropdown));
                    await allMonthsOfCalendarDropdown[0].click()
                    await DriverFactory.myDriver.sleep(500);
                    const allSelectableDaysOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allSelectableDaysOfCalendarDropdown));
                    await allSelectableDaysOfCalendarDropdown[0].click()
                    await DriverFactory.myDriver.sleep(500);
                }
                if (dataTable.rowsHash().FechaDeNacimiento.includes('FirstUnselectableDayOfCalendarPopup')){
                    console.log("FirstUnselectableDayOfCalendarPopup");
                    const allYearsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allYearsOfCalendarDropdown));
                    await allYearsOfCalendarDropdown[0].click();
                    await DriverFactory.myDriver.sleep(500);
                    const allMonthsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allMonthsOfCalendarDropdown));
                    await allMonthsOfCalendarDropdown[0].click()
                    await DriverFactory.myDriver.sleep(500);
                    const allUnselectableDaysOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allUnselectableDaysOfCalendarDropdown));
                    await allUnselectableDaysOfCalendarDropdown[0].click()
                    await DriverFactory.myDriver.sleep(500);
                }
                if (dataTable.rowsHash().FechaDeNacimiento.includes('LastSelectableDayOfCalendarPopup')){
                    console.log("LastSelectableDayOfCalendarPopup");
                    const allYearsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allYearsOfCalendarDropdown));
                    await allYearsOfCalendarDropdown[allYearsOfCalendarDropdown.length-1].click();
                    await DriverFactory.myDriver.sleep(500);
                    const allMonthsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allMonthsOfCalendarDropdown));
                    await allMonthsOfCalendarDropdown[allMonthsOfCalendarDropdown.length-1].click()
                    await DriverFactory.myDriver.sleep(500);
                    const allSelectableDaysOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allSelectableDaysOfCalendarDropdown));
                    await allSelectableDaysOfCalendarDropdown[allSelectableDaysOfCalendarDropdown.length-1].click()
                    await DriverFactory.myDriver.sleep(500);
                }
                if (dataTable.rowsHash().FechaDeNacimiento.includes('LastUnselectableDayOfCalendarPopup')){
                    console.log("LastUnselectableDayOfCalendarPopup");
                    const allYearsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allYearsOfCalendarDropdown));
                    await allYearsOfCalendarDropdown[allYearsOfCalendarDropdown.length-1].click();
                    await DriverFactory.myDriver.sleep(500);
                    const allMonthsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allMonthsOfCalendarDropdown));
                    await allMonthsOfCalendarDropdown[allMonthsOfCalendarDropdown.length-1].click()
                    await DriverFactory.myDriver.sleep(500);
                    const allUnselectableDaysOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allUnselectableDaysOfCalendarDropdown));
                    await allUnselectableDaysOfCalendarDropdown[allUnselectableDaysOfCalendarDropdown.length-1].click()
                    await DriverFactory.myDriver.sleep(500);
                }
            }
        }
        if (dataTable.rowsHash().Genero !== "undefined"){
            let genderOption = 'select[name="customer[gender]"] > option[value="';
            if (dataTable.rowsHash().Genero == "Masculino") genderOption = genderOption+'1"]';
            if (dataTable.rowsHash().Genero == "Femenino") genderOption = genderOption+'2"]';
            if (dataTable.rowsHash().Genero == "Ninguno") genderOption = genderOption+'3"]';
            const genderDropdown = await DriverFactory.myDriver.wait(until.elementLocated(By.css(genderOption)));
            await genderDropdown.click();
        }
        if(typeof dataTable.rowsHash().NumeroDeImpuesto !== "undefined"){
            await taxvatTextFieldElement.clear();
            await taxvatTextFieldElement.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().NumeroDeImpuesto));
        }
        const saveCustomerButtonElement = await DriverFactory.myDriver.wait(until.elementLocated(this.saveCustomerButton));
        await saveCustomerButtonElement.click();
        await DriverFactory.myDriver.sleep(2000);
        spinnerElement = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
        await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinnerElement), configuration.browser.timeout);
        await DriverFactory.myDriver.sleep(1000);

        return uniqueEMailValue;
    }

    async updateNewCustomer(dataTable) {
        const namePrefixTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.namePrefixTextField));
        const firstNameTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.firstNameTextField));
        const middleNameTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.middleNameTextField));
        const lastnameTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.lastnameTextField));
        const suffixTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.suffixTextField));
        const emailTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.emailTextField));
        const dobTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.dobTextField));
        const taxvatTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.taxvatTextField));
        const calendarButton = await DriverFactory.myDriver.wait(until.elementLocated(this.calendarButton));
        

        let uniqueEMailValue = "";
        if(typeof dataTable.rowsHash().PrefijoDelNombre !== "undefined"){
            await namePrefixTextField.clear();
            await namePrefixTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().PrefijoDelNombre));   
        }
        if(typeof dataTable.rowsHash().Nombre !== "undefined"){
            await firstNameTextField.clear();
            await firstNameTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().Nombre));
        }
        if(typeof dataTable.rowsHash().SegundoNombre !== "undefined"){
            await middleNameTextField.clear();
            await middleNameTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().SegundoNombre));
        }
        if(typeof dataTable.rowsHash().Apellido !== "undefined"){
            await lastnameTextField.clear();
            await lastnameTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().Apellido));
        }
        if(typeof dataTable.rowsHash().SufijoDelNombre !== "undefined"){
            await suffixTextField.clear();
            await suffixTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().SufijoDelNombre));
        }
        if(typeof dataTable.rowsHash().CorreoElectronico !== "undefined"){
            await emailTextField.clear();
            uniqueEMailValue = RandomValues.getRandomValues(dataTable.rowsHash().CorreoElectronico);
            await emailTextField.sendKeys(uniqueEMailValue);
        }
        if(typeof dataTable.rowsHash().FechaDeNacimiento !== "undefined"){
            await dobTextField.clear();
            if (!dataTable.rowsHash().FechaDeNacimiento.includes('<')){
                await dobTextField.sendKeys(dataTable.rowsHash().FechaDeNacimiento);
            } else {
                await calendarButton.click();
                await DriverFactory.myDriver.sleep(1000);
                if (dataTable.rowsHash().FechaDeNacimiento.includes('FirstSelectableDayOfCalendarPopup')){
                    const allYearsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allYearsOfCalendarDropdown));
                    await allYearsOfCalendarDropdown[0].click();
                    await DriverFactory.myDriver.sleep(500);
                    const allMonthsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allMonthsOfCalendarDropdown));
                    await allMonthsOfCalendarDropdown[0].click()
                    await DriverFactory.myDriver.sleep(500);
                    const allSelectableDaysOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allSelectableDaysOfCalendarDropdown));
                    await allSelectableDaysOfCalendarDropdown[0].click()
                    await DriverFactory.myDriver.sleep(500);
                }
                if (dataTable.rowsHash().FechaDeNacimiento.includes('FirstUnselectableDayOfCalendarPopup')){
                    const allYearsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allYearsOfCalendarDropdown));
                    await allYearsOfCalendarDropdown[0].click();
                    await DriverFactory.myDriver.sleep(500);
                    const allMonthsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allMonthsOfCalendarDropdown));
                    await allMonthsOfCalendarDropdown[0].click()
                    await DriverFactory.myDriver.sleep(500);
                    const allUnselectableDaysOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allUnselectableDaysOfCalendarDropdown));
                    await allUnselectableDaysOfCalendarDropdown[0].click()
                    await DriverFactory.myDriver.sleep(500);
                }
                if (dataTable.rowsHash().FechaDeNacimiento.includes('LastSelectableDayOfCalendarPopup')){
                    const allYearsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allYearsOfCalendarDropdown));
                    await allYearsOfCalendarDropdown[allYearsOfCalendarDropdown.length-1].click();
                    await DriverFactory.myDriver.sleep(500);
                    const allMonthsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allMonthsOfCalendarDropdown));
                    await allMonthsOfCalendarDropdown[allMonthsOfCalendarDropdown.length-1].click()
                    await DriverFactory.myDriver.sleep(500);
                    const allSelectableDaysOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allSelectableDaysOfCalendarDropdown));
                    await allSelectableDaysOfCalendarDropdown[allSelectableDaysOfCalendarDropdown.length-1].click()
                    await DriverFactory.myDriver.sleep(500);
                }
                if (dataTable.rowsHash().FechaDeNacimiento.includes('LastUnselectableDayOfCalendarPopup')){
                    const allYearsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allYearsOfCalendarDropdown));
                    await allYearsOfCalendarDropdown[allYearsOfCalendarDropdown.length-1].click();
                    await DriverFactory.myDriver.sleep(500);
                    const allMonthsOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allMonthsOfCalendarDropdown));
                    await allMonthsOfCalendarDropdown[allMonthsOfCalendarDropdown.length-1].click()
                    await DriverFactory.myDriver.sleep(500);
                    const allUnselectableDaysOfCalendarDropdown = await DriverFactory.myDriver.wait(until.elementsLocated(this.allUnselectableDaysOfCalendarDropdown));
                    await allUnselectableDaysOfCalendarDropdown[allUnselectableDaysOfCalendarDropdown.length-1].click()
                    await DriverFactory.myDriver.sleep(500);
                }
            }
        }
        if(typeof dataTable.rowsHash().NumeroDeImpuesto !== "undefined"){
            await taxvatTextField.clear();
            await taxvatTextField.sendKeys(RandomValues.getRandomValues(dataTable.rowsHash().NumeroDeImpuesto));
        }
        if (dataTable.rowsHash().Genero !== "undefined"){
            let genderOption = 'select[name="customer[gender]"] > option[value="';
            if (dataTable.rowsHash().Genero == "Masculino") genderOption = genderOption+'1"]';
            if (dataTable.rowsHash().Genero == "Femenino") genderOption = genderOption+'2"]';
            if (dataTable.rowsHash().Genero == "Ninguno") genderOption = genderOption+'3"]';
            const genderDropdown = await DriverFactory.myDriver.wait(until.elementLocated(By.css(genderOption)));
            await genderDropdown.click();
        }

        const saveCustomerButton = await DriverFactory.myDriver.wait(until.elementLocated(this.saveCustomerButton));
        await DriverFactory.myDriver.sleep(500);
        await saveCustomerButton.sendKeys(Key.SHIFT);
        await saveCustomerButton.click();
        await DriverFactory.myDriver.sleep(2000);
        let spinner = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
        await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinner), configuration.browser.timeout);

        return uniqueEMailValue;
    }

    async clickOnEditLink(uniqueEMailValue){
        const searchByKeywordTextField = await DriverFactory.myDriver.wait(until.elementLocated(this.searchByKeywordTextField));
        console.log(uniqueEMailValue);
        await searchByKeywordTextField.clear();
        await searchByKeywordTextField.sendKeys(uniqueEMailValue);
        const searchByKeywordButton = await DriverFactory.myDriver.wait(until.elementLocated(this.searchByKeywordButton));
        await searchByKeywordButton.click();
        await DriverFactory.myDriver.sleep(2000);
        const dataRows = await DriverFactory.myDriver.wait(until.elementsLocated(this.dataRow));
        for (let i = 0; i < dataRows.length; i++) {
            const element = dataRows.pop();
            if ((await element.getText()).toString().includes(uniqueEMailValue)) {
                console.log((await element.getText()).toString());
                (await element.findElement(By.className('action-menu-item'))).click();
                await DriverFactory.myDriver.sleep(1000);
                break;
            }
        }
        const spinner = await DriverFactory.myDriver.wait(until.elementLocated(this.spinner));
        await DriverFactory.myDriver.wait(until.elementIsNotVisible(spinner), configuration.browser.timeout); 
        const accountInformationTab = await DriverFactory.myDriver.wait(until.elementLocated(this.accountInformationTab));
        await accountInformationTab.click();
        await DriverFactory.myDriver.sleep(1000);
    }

    async searchCustomerByKeyword(uniqueValue, checkRowsFound=true){
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

    async deleteCustomerChecked(){
        console.log("deleteCustomerChecked");
        const actionDropDown = await DriverFactory.myDriver.wait(until.elementLocated(this.actionDropDown));
        await actionDropDown.click();
        const optionsInActionDropDown = await DriverFactory.myDriver.wait(until.elementsLocated(this.optionsInActionDropDown));
        await optionsInActionDropDown[0].click();
        await DriverFactory.myDriver.sleep(1000);
        const okButtonToDelete = await DriverFactory.myDriver.wait(until.elementLocated(this.okButtonToDelete));
        await okButtonToDelete.click();
        await DriverFactory.myDriver.sleep(1000);
        console.log("deleteCustomerChecked");
    }
}

module.exports = new CustomersPage();