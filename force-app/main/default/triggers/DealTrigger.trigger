trigger DealTrigger on Deal__c (after update) {
    List<Client__c> newClients = new List<Client__c>();

    Set<Id> customerIds = new Set<Id>();
    for (Deal__c deal : Trigger.new) {
        if (deal.Status__c == 'Signed' && deal.Customer__c != null) {
            customerIds.add(deal.Customer__c);
        }

        if (!customerIds.isEmpty()) {
            Map<Id, Customer> customers = new Map<Id, Customer>([
                SELECT Id, Name
                FROM Customer
                WHERE Id IN :customerIds
            ]);
    
            for (Deal__c d : Trigger.new) {
                if (d.Status__c == 'Signed' && d.Customer__c != null && customers.containsKey(d.Customer__c)) {
                    Client__c client = new Client__c();
                    client.Name = customers.get(d.Customer__c).Name;
                    newClients.add(client);
                    System.debug(client.Name);
                }
            }
        }
    
        if (!newClients.isEmpty()) {
            insert newClients;
        }
    }
}