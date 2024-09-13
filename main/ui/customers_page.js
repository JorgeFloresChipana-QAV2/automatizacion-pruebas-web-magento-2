const { By, until } = require("selenium-webdriver");

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
}

module.exports = new CustomersPage();