@isTest
private class LeadProcessorTest {
@TestSetup
static void setup(){
    List<Lead> leads = new List<Lead>();

        for(Integer i = 0; i<200; i++) {
            leads.add(new Lead(LastName = 'Lead' + i,
            Company = 'Lead', Status='Open - Not Contacted'));
        }
        insert leads;
    }
@isTest static void test(){
    Test.startTest();
    LeadProcessor lp = new LeadProcessor();
    Id batchId = Database.executeBatch(lp, 200);
    Test.stopTest();
    System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}
