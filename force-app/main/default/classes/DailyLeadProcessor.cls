public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id FROM Lead WHERE LeadSource = NULL LIMIT 200];

        if(leads.size() > 0) {
            List<Lead> newLeads = new List<Lead>();

            for(Lead lead : leads) {
                lead.LeadSource = 'Dreamforce';
                newLeads.add(lead);
            }
            update leads;
        }
    }
}
