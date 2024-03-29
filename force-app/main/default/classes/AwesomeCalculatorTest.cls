@isTest
public with sharing class AwesomeCalculatorTest {
    @isTest
    static void testCallout() {
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock());
        // Call the method that invokes a callout
        Double x = 1.0;
        Double y = 2.0;
        Double result = AwesomeCalculator.add(x, y);
        // Verify that a fake result is returned
        System.assertEquals(3.0, result); 
    }
}