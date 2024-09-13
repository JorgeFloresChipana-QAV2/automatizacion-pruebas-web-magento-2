const { Builder, Browser } = require("selenium-webdriver");
const { Options } = require("selenium-webdriver/chrome");
require("chromedriver");
module.exports = class ChromeDriver {
    constructor() {
            return (async () => {
                return await new Builder().forBrowser(Browser.CHROME).build();
            })();
        }
};