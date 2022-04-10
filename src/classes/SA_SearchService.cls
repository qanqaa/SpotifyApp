public with sharing class SA_SearchService {

    public static List<TrackDTO> getTracks(String searchTerm) {
        return SA_ObjectMapper.mapToTrackDTOS(Database.query(createTrackQuery(searchTerm)));
    }

    public static List<TrackDTO> getArtistTopTracks(String searchTerm) {
        return SA_ObjectMapper.mapToTrackDTOS(Database.query(createTrackQuery(searchTerm)));
    }

    public static List<ArtistDTO> getArtists(String searchTerm) {
        return SA_ObjectMapper.mapToArtistDTOS(Database.query(createArtistQuery(searchTerm)));
    }

    public static TrackDTO getTrackDetails(String id) {
        Track__c track = new Track__c();
        List<Artist__c> trackArtist = new List<Artist__c>();
        try{
            track = Database.query(createTrackDetailsQuery(id));
            trackArtist = Database.query(createTrackArtistsQuery(id));

            System.debug(track);
            System.debug(trackArtist);
        }
        catch(Exception e){
            System.debug(e.getMessage());
            return null;
        }
        return SA_ObjectMapper.mapToDetailedTrackDTO(track, trackArtist);
    }

    public static ArtistDTO getArtistDetails(String id) {
        Artist__c artist = new Artist__c();
        try{
            artist = Database.query(createArtistDetailsQuery(id));
            System.debug('query artist' + artist);
        }
        catch(Exception e){
            System.debug(e.getMessage());
            return null;
        }
        return SA_ObjectMapper.mapToDetailedArtistDTO(artist);
    }

    public static String createTrackDetailsQuery(String id) {
        String searchQuery = 'SELECT Id, SpotifyId__c, AlbumReleaseDate__c, AlbumName__c, Name, Duration__c, ImageURL__c, ArtistName__c  ' +
                'FROM Track__c WHERE Id = :id';
        System.debug(searchQuery);
        return searchQuery;
    }

    public static String createTrackArtistsQuery(String id) {
        String searchQuery = 'SELECT Id, Name FROM Artist__c WHERE Id IN (SELECT Artist__c FROM TrackArtist__c WHERE Track__c = :id)';
        System.debug(searchQuery);
        return searchQuery;
    }

    public static String createArtistDetailsQuery(String id) {
        String searchQuery = 'SELECT Id, Name, ImageURL__c, Genre__c, Popularity__c, Followers__c, SpotifyId__c ' +
                'FROM Artist__c WHERE Id = :id';
        System.debug(searchQuery);
        return searchQuery;
    }

    public static String createTrackQuery(String searchTerm) {
        String searchQuery = 'SELECT Id, Name, Duration__c, ImageURL__c, ArtistName__c ' +
                'FROM Track__c';
        if (string.isNotEmpty(searchTerm)) {
            searchQuery += ' WHERE Name LIKE \'%' + string.escapeSingleQuotes(searchTerm) + '%\'';
        }
        searchQuery += ' ORDER BY Name LIMIT 20';
        System.debug(searchQuery);
        return searchQuery;
    }

    public static String createArtistQuery(String searchTerm) {
        String searchQuery = 'SELECT Id, Name, ImageURL__c, Genre__c ' +
                'FROM Artist__c';
        if (string.isNotEmpty(searchTerm)) {
            searchQuery += ' WHERE Name LIKE \'%' + string.escapeSingleQuotes(searchTerm) + '%\'';
        }
        searchQuery += ' ORDER BY Name LIMIT 20';
        System.debug(searchQuery);
        return searchQuery;
    }

}