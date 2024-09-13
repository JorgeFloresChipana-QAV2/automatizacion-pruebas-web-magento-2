const { Before, After, AfterAll, BeforeAll } = require("@cucumber/cucumber");
const environment = require("../../environment.json");
const configuration = require("../../configuration.json");
const DriverFactory = require("../../core/ui/driverFactory");
const LoginPage = require("../../main/ui/login_page");
var {setDefaultTimeout} = require('@cucumber/cucumber');
const CommonFlows = require("./common_flows");

setDefaultTimeout(60 * 1000);
let loginHook = false;

BeforeAll( { tags: "@ui" }, async function(){
    console.log("Starting Framework");
    this.driver = await new DriverFactory();
    console.log("Starting Browser");
    await this.driver.get(environment.prod.uiUrl);
    await this.driver.manage().window().setRect(configuration.browser.resolution);
});

Before( { tags: "@iniciarSesion" }, async function(scenario){
    console.log("TEST SCENARIO: " + scenario.pickle.name.toLocaleUpperCase());
    if ((loginHook === undefined) || (loginHook === false)){
        loginHook = await CommonFlows.login(scenario);
    }
});

After({ tags: "@eliminarCliente" }, async function(){
    this.uniqueEMailValue = await CommonFlows.deleteCustomer(this.uniqueEMailValue);
});

After({ tags: "@eliminarProducto" }, async function(){
    this.uniqueProductValue = await CommonFlows.deleteProduct(this.uniqueProductValue);
});

AfterAll({ tags: "@ui" },async function(){
    await DriverFactory.closeDriver();
});