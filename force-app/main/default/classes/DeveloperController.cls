public with sharing class DeveloperController {
    @AuraEnabled(cacheable=true)
    public static List<Developer__c> getDevelopersWithMostProjects() {
        List<Developer__c> developers = [SELECT Name, Total_Billable_Projects__c
                                         FROM Developer__c
                                         ORDER BY Total_Billable_Projects__c DESC
                                         LIMIT 5];
        
        return developers;
    }
}