public class ProjectAssignmentServices {

    public void groupUniqueProjectAssigments (List<Project_Assignment__c> projects) {

        Map<String, List<Project_Assignment__c>> projAssignmentsValues = new Map<String, List<Project_Assignment__c>>();

        projects = [SELECT Project__r.Name, Developer__r.Name FROM Project_Assignment__c];

        for(Project_Assignment__c pa: projects) {
            System.debug(projects);
        }
        
    }
}