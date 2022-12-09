@isTest
public class AnimalsCalloutsTest {
    @isTest
    static void testGetCallout() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');

        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse result = AnimalsCallouts.makeGetCallout();

        System.assertNotEquals(null, result, 'The callout returned a null response');
        System.assertEquals(200, result.getStatusCode(), 'The status code is not 200');
        System.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'), 'The content type value is not expected.');

        Map<String,Object> results = (Map<String, Object>) JSON.deserializeUntyped(result.getBody());
        List<Object> animals = (List<Object>) results.get('animals');
        System.assertEquals(3, animals.size(), 'The aaray should only contain 3 items');
    }
}