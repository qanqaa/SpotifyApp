public with sharing class SA_SearchCalloutService {

    public static List<TrackDTO> getTracksFromSpotify(String searchTerm) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SpotifyAPI/v1/search?' + createEndpointQuery(searchTerm) + '&type=track&limit=40');
        request.setMethod('GET');
        Http http = new Http();
        HTTPResponse response = http.send(request);
        SpotifyTracksResponse spotifyTracksResponse = SpotifyTracksResponse.parse(response.getBody());
        System.debug('>>>>>>>>>>>>>>>' + SA_ObjectMapper.getTracksDTOSFromSpotifyResponse(spotifyTracksResponse));
        return SA_ObjectMapper.getTracksDTOSFromSpotifyResponse(spotifyTracksResponse);
    }

    public static List<ArtistDTO> getArtistsFromSpotify(String searchTerm) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SpotifyAPI/v1/search?' + createEndpointQuery(searchTerm) + '&type=artist&limit=40');
        request.setMethod('GET');
        Http http = new Http();
        HTTPResponse response = http.send(request);
        SpotifyArtistsResponse spotifyArtistsResponse = SpotifyArtistsResponse.parse(response.getBody());
        System.debug(spotifyArtistsResponse);
        System.debug('>>>>>>>>>>>>>>>' + SA_ObjectMapper.getArtistsDTOSFromSpotifyResponse(spotifyArtistsResponse));
        return SA_ObjectMapper.getArtistsDTOSFromSpotifyResponse(spotifyArtistsResponse);
    }

    public static TrackDTO getTrackDetailsFromSpotify(String id) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SpotifyAPI/v1/tracks/' + id);
        request.setMethod('GET');
        Http http = new Http();
        HTTPResponse response = http.send(request);
        SpotifyTrackDetails spotifyTrackDetails = SpotifyTrackDetails.parse(response.getBody());
        System.debug(spotifyTrackDetails);
        System.debug('>>>>>>>>>>>>>>>' + SA_ObjectMapper.getTracksDTOSFromSpotifyTrackDetails(spotifyTrackDetails));
        return SA_ObjectMapper.getTracksDTOSFromSpotifyTrackDetails(spotifyTrackDetails);
    }

    public static ArtistDTO getArtistDetailsFromSpotify(String id) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SpotifyAPI/v1/artists/' + id);
        request.setMethod('GET');
        Http http = new Http();
        HTTPResponse response = http.send(request);
        SpotifyArtistDetails spotifyArtistDetails = SpotifyArtistDetails.parse(response.getBody());
        System.debug(spotifyArtistDetails);
        System.debug('>>>>>>>>>>>>>>>' + SA_ObjectMapper.getArtistsDTOSFromSpotifyArtistDetails(spotifyArtistDetails));
        return SA_ObjectMapper.getArtistsDTOSFromSpotifyArtistDetails(spotifyArtistDetails);
    }

    public static List<TrackDTO> getArtistTopTracksFromSpotify(String id) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SpotifyAPI/v1/artists/' + id + '/top-tracks?market=PL');
        request.setMethod('GET');
        Http http = new Http();
        HTTPResponse response = http.send(request);
        SpotifyArtistTopTracks spotifyArtistTopTracks = SpotifyArtistTopTracks.parse(response.getBody());
        System.debug('>>>>>>>>>>>>>>>' + SA_ObjectMapper.getTracksDTOSFromSpotifyArtistTopTracks(spotifyArtistTopTracks));
        return SA_ObjectMapper.getTracksDTOSFromSpotifyArtistTopTracks(spotifyArtistTopTracks);
    }

    public static String createEndpointQuery(String searchTerm) {
        String queryInfo = '';
        if (searchTerm != null) {
            searchTerm = searchTerm.replace(' ', '%20');
            queryInfo += 'query=' + searchTerm;
            System.debug(queryInfo);
        }
        return queryInfo;
    }
}