const { By } = require("selenium-webdriver");

class LoginPage{
    usernameInput = By.css('form #username');
    passwordInput = By.css('form #login');
    loginButton = By.css('.action-login');
}

module.exports = new LoginPage();