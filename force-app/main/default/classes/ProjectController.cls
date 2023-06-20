public with sharing class ProjectController {
    @AuraEnabled(cacheable=true)
    public static List<Project__c> getLatestProjects() {
        List<Project__c> projectsList = [SELECT Name, Status__c, Start_Date__c, Project_Budget__c
            FROM Project__c
            ORDER BY Start_Date__c DESC
            LIMIT 5];
        
            return projectsList;
    }
}