public class mostProfitableClientsServices {
    @AuraEnabled
    public static List<Client__c> fetchClients(){
        List<Client__c> clientsList = [SELECT Id, OwnerId, Name, Total_Active_Projects__c, Email__c, Budget__c
                        FROM Client__c
                        ORDER BY Total_Active_Projects__c
                        DESC
                        LIMIT 10];

        return clientsList;
    }

}