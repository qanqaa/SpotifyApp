public with sharing class SA_SearchCalloutService {

    private static final String endpoint = 'callout:SpotifyAPI';

    public static void getRequest (){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SpotifyAPI/v1/search?' + createEndpointQuery('king'));
        request.setMethod('GET');
        Http http = new Http();
        HTTPResponse response = http.send(request);
        System.debug(response.getBody());
    }

    public static String createEndpointQuery(String searchTerm) {
        String queryInfo = '';
        if (searchTerm != null) {
            searchTerm = searchTerm.replace(' ', '%20');
            queryInfo += 'q=' + searchTerm;
            queryInfo += '&type=track&limit=2';
        }
        return queryInfo;
    }
}