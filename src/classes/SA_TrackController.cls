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
}