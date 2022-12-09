@isTest
public class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 0 0 15 12 ? 2022';

    static testmethod void testScheduleJob() {
        List<Lead> leads = new List<Lead>();

        for(Integer i = 0; i < 200; i++) {
            Lead lead = new Lead(LastName = 'Test ' + i, LeadSource = '', Company = 'Test Company ' + i, Status = 'Open - Not Contacted');
            leads.add(lead);
        }
        insert leads;

        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
    }
}
