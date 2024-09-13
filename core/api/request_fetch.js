const environment = require("../../environment.json");
const method_name ={
    DEL: deleteRequestOptions = {
        method: 'DELETE',
        headers: {
            'Authorization': `Bearer ${environment.prod.apiKey}`,
            'content-type': 'application/json',
        },
    },
    GET: getRequestOptions = {
        method: 'GET',
        headers: {
            'Authorization': `Bearer ${environment.prod.apiKey}`,
            'content-type': 'application/json',
        },
    },
    POST: {
        method: 'POST',
        headers: {
            'Authorization': `Bearer ${environment.prod.apiKey}`,
            'content-type': 'application/json',
        },
        body:{},
    }
}

module.exports = class RequestFetch {
    static async request(uri, method, payload={}) {
        if (method.includes("POST")){
            method_name[method]["body"] = payload;
        }
        let response = undefined;
        try{
            response = await fetch(uri, method_name[method], payload)
        } catch (error) {
            console.log("An error ocurred in request: " + uri);
        }

        return response; 
    }
}