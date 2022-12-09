public class AnimalLocator {
    public static String getAnimalNameById(Integer Id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String animalName = '';

        if(response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animals = (Map<String, Object>) results.get('animal');
            System.debug('Receiced the following animals: ');
            animalName = string.valueof(animals.get('name'));
            System.debug(animalName);
        }
        return animalName;
    }
}