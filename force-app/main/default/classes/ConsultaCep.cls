@RestResource(urlMapping='/Account/*')
global with sharing class ConsultaCep {
    
    @HttpGet
    global static Acccount doGet() {
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/') + '|');        
        Account result = [SELECT Id, Name FROM ACCOUNT WHERE ID = :AccountId];
        return result;
    }

    @HttpPost
    global static String doPost(String name) {
        Account account = new Account(Name=name);
        insert account;
        return account.Id;
    }
}