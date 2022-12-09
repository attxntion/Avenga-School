@isTest
private class AnimalLocatorTest {
    @isTest
    static void testGetCallout() {
        Test.setMock(HttpCallOutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(1);
        String expectedResult = 'chicken';
        System.assertEquals(result, expectedResult);
    }
}