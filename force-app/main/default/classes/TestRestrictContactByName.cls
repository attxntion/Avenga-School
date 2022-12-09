@isTest
private class TestRestrictContactByName {
    @isTest
    static void TestRestrictContactByName() {
        List<Contact> conList = new List<Contact>();
        Contact c1 = new Contact(FirstName='Raam', LastName='Leela' , email='ramleela@test.com');
        Contact c2 = new Contact(FirstName='gatsby', LastName = 'INVALIDNAME',email='gatsby@test.com');
        conList.add(c1);
        conList.add(c2);

        Test.startTest();
        try {
            insert conList;
        } catch (Exception e) {
            
        }
        Test.stopTest();
    }
}
