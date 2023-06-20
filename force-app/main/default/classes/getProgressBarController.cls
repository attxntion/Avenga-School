public with sharing class getProgressBarController {
    @AuraEnabled
    public static List<Project__c> getProjectStatus() {
        List<Project__c> projectStatus = [SELECT Status__c
                                            FROM Project__c
                                            ORDER BY Status__c];
        return projectStatus;
    }
}