const { By, until, Key } = require("selenium-webdriver");

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
}

module.exports = new ProductsPage();