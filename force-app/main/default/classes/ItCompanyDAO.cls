public class ItCompanyDAO {
    public static void getAvailableDeveloperIds() {
        Set<Id> avDevsIds = new Map<Id, Developer__c>([SELECT Id
                                    FROM Developer__c
                                    WHERE Total_Billable_Projects__c < 5]).keyset();
        
            System.debug('Available developers: ' + avDevsIds);
          

    }

    public static void getUnassignedDeveloperIds() {
        Set<Id> unassignDevsIds = new Map<Id, Developer__c>([SELECT Id
                                          FROM Developer__c
                                          WHERE Total_Billable_Projects__c = 0]).keyset();

            System.debug('Unnasigned developers: ' + unassignDevsIds);
         

    }

    public static void getClients(Integer limitNumber, Integer offsetNumber) {
        limitNumber = 4;
        offsetNumber = 3;

        List<Client__c> clientsList = [SELECT Name
                                        FROM Client__c
                                        LIMIT :limitNumber
                                        OFFSET :offsetNumber];

            System.debug('Clients: ' + clientsList);
    
    }

    public static void getDevelopers(Set<Id> developerId, Integer limitNumber, Integer offsetNumber) {
        limitNumber = 4;
        offsetNumber = 3;
        List<Developer__c> devsList = Database.query(
            'SELECT Id '
            + 'FROM Developer__c '
            + 'WHERE Name = :Name '
            + 'AND LIMIT :limitNumber != NULL '
            + 'AND OFFSET :offsetNumber != NULL'
        );
    }

}