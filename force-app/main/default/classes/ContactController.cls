public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public Contact getContactList(){
        return [Select Id, Name, FirstName, LastName, Title, Phone, Email, Picture__c FROM Contact WHERE Picture__c != NULL WITH USER_MODE LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey){
        String key = '%' + searchKey + '%';
        return [SELECT Id, Name, Title, Phone, Email, Picture__c FROM Contact WHERE Name LIKE :key AND Picture__c != NULL WITH USER_MODE LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact(){
        return [SELECT Id, Name, Title, Phone, Email, Picture__c FROM Contact WITH USER_MODE LIMIT 1];
    }

    @AuraEnabled
    public static void updateContacts(List<Contact> contactsforUpdate){
        if(!Schema.SObjectType.Contact.isUpdateable()){
            throw new SecurityException('Insufficient permissions to update contacts');
        }
        update contactsforUpdate;
    }

    @AuraEnabled
    public static void updateContact(Id recordId, String firstName, String lastName){
        Contact contact = new Contact(Id = recordId, FirstName = firstName, LastName = lastName);
        update contact;
    }
}