public with sharing class SA_SearchController {

    @AuraEnabled
    public static List<Track__c> searchTracks (String searchTerm) {
        return SA_SearchService.getTracks(searchTerm);
    }
}