@isTest
private class ParkLocatorTest {
    @isTest
    static void testParkLocatorTest() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] arrayOfParks = ParkLocator.country('India');
        
        System.assertEquals('Park1', arrayOfParks[0]);
    }
}
