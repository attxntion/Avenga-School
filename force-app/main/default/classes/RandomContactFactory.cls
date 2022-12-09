public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numOfNames, String lastName) {
        List<Contact> cons = new List<Contact>();
        for (Integer i = 0; i < numOfNames; i++) {
            Contact c = new Contact(LastName=lastName + ' ' + i, FirstName = 'Contact '+i);
            cons.add(c);
        }
        //insert cons;
        return cons;
    }
}
