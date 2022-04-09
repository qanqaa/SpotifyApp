public with sharing class SA_ArtistController {

    @AuraEnabled
    public static ArtistDTO getArtistDetails (String artistId) {
        if(SA_SearchService.getArtistDetails(artistId) != null) {
            System.debug('nie null');
            return SA_SearchService.getArtistDetails(artistId);
        }
        else {
            System.debug('spotify');
            return SA_SearchCalloutService.getArtistDetailsFromSpotify(artistId);
        }
    }

    @AuraEnabled
    public static List<TrackDTO> getArtistTopTracks (String artistId) {
        if(SA_SearchService.getArtistDetails(artistId) != null) {
            System.debug('nie null');
            //return SA_SearchService.getArtistDetails(artistId);
            return null;
        }
        else {
            System.debug('spotify top tracks');
            return SA_SearchCalloutService.getArtistTopTracksFromSpotify(artistId);
        }
    }


}