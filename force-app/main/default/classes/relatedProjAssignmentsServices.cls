public with sharing class relatedProjAssignmentsServices {
    @AuraEnabled(cacheable=true)
    public static List<Project_Assignment__c> getRelated(Id id){
        List<Project_Assignment__c> projAssignList = new List<Project_Assignment__c>();
        projAssignList = [SELECT Name, Project__r.Name FROM Project_Assignment__c WHERE Developer__r.Id =: id];
        if(!projAssignList.isEmpty()){
            return projAssignList;
        }
        return null;
    }
}