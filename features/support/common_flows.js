const environment = require("../../environment.json");
const DriverFactory = require("../../core/ui/driverFactory");
const LoginPage = require("../../main/ui/login_page");
const { until } = require("selenium-webdriver");

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
}
