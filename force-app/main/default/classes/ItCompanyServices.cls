public class ItCompanyServices {
    public static void createProject() {
        List<Client__c> clientsList = new List<Client__c>();
        clientsList.add(new Client__c(Client_Name__c = 'Jamie'));
        clientsList.add(new Client__c(Client_Name__c = 'Jeofrey'));

        Database.SaveResult[] clList = Database.insert(clientsList, false);

        for (Database.SaveResult cl : clList) {
            if (sr.isSuccess()) {
            System.debug('Successfully inserted client. Client ID: ' +
            cl.getId());
            } 
            else {
                for(Database.Error err : cl.getErrors()) {
                    System.debug('The following error has occurred.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Client fields that affected this error: ' +
                    err.getFields());
                    }
                }
            }
    }

    public static void createProjectAssignment(Id projectId, Id developerId) {
        List<Project_Assignment__c> projAssignList = new List<Project_Assignment__c>();
        
        
    }
}
