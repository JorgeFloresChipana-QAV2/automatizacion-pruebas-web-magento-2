module.exports = class Utils{
    static randomNumerics(size) {
        return Math.random().toString().substring(2, size);
    }

    static getRandomValues(keyName) {
        let result = '';
        if (keyName.toString().includes("<") && keyName.toString().includes(">")) {
            if (keyName.toString().replace(/<|>/g, '').split(',')[0].toLowerCase().includes("randomvalue")){
                result = this.getRandomAlphanumerics(keyName);
            }
            if (keyName.toString().replace(/<|>/g, '').split(',')[0].toLowerCase().includes("randomemail")){
                result = this.getRandomEmail(keyName);
            }
            if (keyName.toString().replace(/<|>/g, '').split(',')[0].toLowerCase().includes("randomnumber")){
                result = this.getRandomNumber(parseInt(keyName.toString().replace(/<|>/g, '').split(',')[1]));
            }
        } else {
            result = keyName;
        }
        return result;
    }

    static getRandomAlphanumerics(keyName) {
        let result = '';
        if (keyName.toString().includes("<") && keyName.toString().includes(">")) {
            const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            let counter = 0;
            while (counter < keyName.toString().replace(/<|>/g, '').split(',')[1]) {
            result += characters.charAt(Math.floor(Math.random() * characters.length));
            counter += 1;
            }
        } else {
            result = keyName;
        }
        return result;
    }

    static getRandomEmail(keyName) {
        let result = '';
        if (keyName.toString().includes("<") && keyName.toString().includes(">")) {
            const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            let counter = 0;
            while (counter < keyName.toString().replace(/<|>/g, '').split(',')[1] - 5) {
            result += characters.charAt(Math.floor(Math.random() * characters.length));
            counter += 1;
            }
        } else {
            result = keyName;
        }
        result += "@x.co";
        return result;
    }

    static getRandomNumber(number) {
        var add = 1, max = 12 - add;
        if ( number > max ) {
                return this.getRandomNumber(max) + this.getRandomNumber(number - max);
        }
        max = Math.pow(10, number+add);
        var min = max/10;
        var number = Math.floor( Math.random() * (max - min + 1) ) + min;
        
        return ("" + number).substring(add);  
    }

    static getTodayDate() {
        var add = 1, max = 12 - add;
        const today = new Date();
        const month = today.getMonth() + 1;
        const day = today.getDate() -1;
        const year = today.getFullYear();
        return `${month}/${day}/${year}`;  
    }

    static convertDateToMoreReadableFormat(originalDateStr ) {
        if (originalDateStr.toString().replace(/<|>/g, '').split(',')[0].toLowerCase().includes("today")){
            return this.convertDateToMoreReadableFormat(this.getTodayDate());
        } 
        if (originalDateStr.includes("/")){
            const [month, day, year] = originalDateStr.split('/').map(Number);
            const date = new Date(year, month - 1, day);
            const options = { year: 'numeric', month: 'short', day: 'numeric' };
            return date.toLocaleDateString('en-US', options);
        } else {
            return originalDateStr;
        }
    }
}