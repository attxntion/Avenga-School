public with sharing class profitableCustomersController {
    @AuraEnabled(cacheable=true)
    public static List<Customer> getProfitableCustomers(){
        List<Customer> customersList = [SELECT Id, Name, Revenue__c
                                         FROM Customer
                                         ORDER BY Revenue__c DESC
                                         LIMIT 5];

        return customersList;
    }
}