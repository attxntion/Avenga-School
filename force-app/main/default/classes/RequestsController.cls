public with sharing class RequestsController {
    @AuraEnabled(cacheable=true)
    public static List<Request__c> getLatestRequests(){
        List<Request__c> req = [SELECT Name, Price__c, Status__c, Description__c
                                FROM Request__c
                                ORDER BY Name DESC
                                LIMIT 5];
        return req;
    }
}