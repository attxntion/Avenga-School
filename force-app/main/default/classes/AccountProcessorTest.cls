@isTest
public class AccountProcessorTest {
    public static testmethod void AccountProcessorTest() {
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;

        Contact c = new Contact();
        c.FirstName = 'Smith';
        c.LastName = 'John';
        c.Email = 'test@gmail.com';
        c.AccountId = a.Id;
        insert c;

        Set<Id> accIds = new Set<Id>();
        accIds.add(a.id);

        Test.startTest();
            AccountProcessor.countContacts(accIds);
        Test.stopTest();

        Account acc = [SELECT Number_Of_Contacts__c
                        FROM Account
                        WHERE Id = :a.Id
                        LIMIT 1];
        System.assertEquals(Integer.valueOf(acc.Number_Of_Contacts__c), 1);
    }
}
