public with sharing class SA_SearchController {

    @AuraEnabled
    public static List<TrackDTO> searchInternalTracks (String searchTerm) {
        return SA_SearchService.getTracks(searchTerm);
    }

    @AuraEnabled
    public static List<TrackDTO> searchExternalTracks (String searchTerm) {
        return SA_SearchCalloutService.getTracksFromSpotify(searchTerm);
    }

    @AuraEnabled
    public static List<TrackDTO> getAllTracks (String searchTerm) {
        List<TrackDTO> internalData = new List<TrackDTO>();
        internalData = searchInternalTracks(searchTerm);
        List<TrackDTO> externalData = new List<TrackDTO>();
        externalData = searchExternalTracks(searchTerm);
        List<TrackDTO> allResults = new List<TrackDTO>();
        allResults.addAll(internalData);
        allResults.addAll(externalData);
        System.debug('WSZYSTKO RAZEM: TRACKS'+ allResults);
        return allResults;
    }

    @AuraEnabled
    public static List<ArtistDTO> searchInternalArtists (String searchTerm) {
        return SA_SearchService.getArtists(searchTerm);
    }

    @AuraEnabled
    public static List<ArtistDTO> searchExternalArtists (String searchTerm) {
        System.debug('searchExternalArtists');
        System.debug(SA_SearchCalloutService.getArtistsFromSpotify(searchTerm));
        return SA_SearchCalloutService.getArtistsFromSpotify(searchTerm);
    }

    @AuraEnabled
    public static List<ArtistDTO> getAllArtists (String searchTerm) {
        List<ArtistDTO> internalData = new List<ArtistDTO>();
        internalData = searchInternalArtists(searchTerm);
        System.debug('internalData' + internalData);
        List<ArtistDTO> externalData = new List<ArtistDTO>();
        externalData = searchExternalArtists(searchTerm);
        System.debug('externalData' + externalData);
        List<ArtistDTO> allResults = new List<ArtistDTO>();
        allResults.addAll(internalData);
        allResults.addAll(externalData);
        System.debug('WSZYSTKO RAZEM: ARTYŚCI '+ allResults);
        return allResults;
    }

}