public class AccountProcessor {
    @future
    public static void countContacts(Set<Id> accIds) {
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Number_Of_Contacts__c,
                    (SELECT Id FROM Contacts)
                    FROM Account
                    WHERE Id IN :accIds];

        for(Account a : accList) {
            a.Number_Of_Contacts__c = a.Contacts.size();
        }

        update accList;
    }
}
