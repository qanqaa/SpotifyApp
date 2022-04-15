public with sharing class SA_TrackController {

    @AuraEnabled
    public static TrackDTO getTrackDetails (String trackId) {
        if(SA_SearchService.getTrackDetails(trackId) != null) {
            System.debug('nie null');
            return SA_SearchService.getTrackDetails(trackId);
        }
        else {
            System.debug('spotify');
            return SA_SearchCalloutService.getTrackDetailsFromSpotify(trackId);
        }
    }

    @AuraEnabled
    public static List<Spotify_Property__c> getObjectSpotifyProperties(String objectId) {
        List<Spotify_Property__c> objectSpotifyProperties =
                Database.query(
                        'SELECT Id, ObjectId__c, OwnerId, Owner.Name, CreatedDate, ' +
                                'Rating__c, Comment__c, isBlack__c, isFavourite__c  ' +
                                'FROM Spotify_Property__c ' +
                                'WHERE (ObjectId__c = :objectId) ' +
                                'ORDER BY CreatedDate ASC');
        System.debug(objectSpotifyProperties);
        return objectSpotifyProperties;
    }
}