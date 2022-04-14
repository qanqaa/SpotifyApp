public with sharing class SA_SearchService {

    public static List<TrackDTO> getTracks(String searchTerm) {
        List<Track__c> tracks = new List<Track__c>();
        List<TrackDTO> trackDTOS = new List<TrackDTO>();
        List<TrackArtist__c> trackArtists = new List<TrackArtist__c>();
        try{
            tracks = Database.query(createTrackQuery(searchTerm));
            System.debug('11tracks: ' + tracks);
            trackDTOS = SA_ObjectMapper.mapToTrackDTOS(Database.query(createTrackQuery(searchTerm)));

            Set<Id> trackIds = new Set<Id>();
            for(TrackDTO trackDTO : trackDTOS){
                trackIds.add(trackDTO.id);
            }

            trackArtists = Database.query('SELECT Artist__c, Artist__r.Name, Artist__r.Id, Track__c FROM TrackArtist__c WHERE Track__c IN :trackIds');
            System.debug('11trackArtist: ' + trackArtists);


            for(TrackDTO trackDTO : trackDTOS){
                List<ArtistDTO> artistDTOS = new List<ArtistDTO>();

                System.debug('1');
                for(TrackArtist__c trackArtist : trackArtists){
                    System.debug('2');
                    if(trackDTO.id == trackArtist.Track__c){
                        System.debug('3');

                        ArtistDTO artistDTO = new ArtistDTO();
                        artistDTO.id = trackArtist.Artist__c;
                        System.debug('trackArtist.Artist__r.Name' + trackArtist.Artist__r.Name);
                        artistDTO.name = trackArtist.Artist__r.Name;
                        System.debug('UDALO SIE');
                        artistDTOS.add(artistDTO);
                    }
                }
                trackDTO.featArtists = artistDTOS;
            }
        }
        catch(Exception e){
            System.debug('66666666666666666666666666' + e.getMessage());
            return trackDTOS;
        }
        System.debug('88888888888888888888888888888888' + trackDTOS);
        return trackDTOS;
    }

    public static List<TrackDTO> getArtistTopTracks(String id) {
        List<Track__c> tracks = new List<Track__c>();
        List<TrackDTO> trackDTOS = new List<TrackDTO>();
        List<TrackArtist__c> trackArtists = new List<TrackArtist__c>();
        try{
            tracks = Database.query(createArtistTopTracksQuery(id));
            System.debug('11tracks: ' + tracks);
            trackDTOS = SA_ObjectMapper.mapToTrackDTOS(Database.query(createArtistTopTracksQuery(id)));
            System.debug('trackDTOS: ' + trackDTOS);

            Set<Id> trackIds = new Set<Id>();
            for(TrackDTO trackDTO : trackDTOS){
                trackIds.add(trackDTO.id);
            }

            trackArtists = Database.query('SELECT Artist__c, Artist__r.Name, Artist__r.Id, Track__c FROM TrackArtist__c WHERE Track__c IN :trackIds');
            System.debug('11trackArtist: ' + trackArtists);


            for(TrackDTO trackDTO : trackDTOS){
                List<ArtistDTO> artistDTOS = new List<ArtistDTO>();

                System.debug('1');
                for(TrackArtist__c trackArtist : trackArtists){
                    System.debug('2');
                    if(trackDTO.id == trackArtist.Track__c){
                        System.debug('3');

                        ArtistDTO artistDTO = new ArtistDTO();
                        artistDTO.id = trackArtist.Artist__c;
                        System.debug('trackArtist.Artist__r.Name' + trackArtist.Artist__r.Name);
                        artistDTO.name = trackArtist.Artist__r.Name;
                        System.debug('UDALO SIE');
                        artistDTOS.add(artistDTO);
                    }
                }
                trackDTO.featArtists = artistDTOS;
            }
        }
        catch(Exception e){
            System.debug('66666666666666666666666666' + e.getMessage());
            return trackDTOS;
        }

        System.debug('88888888888888888888888888888888' + trackDTOS);
        return trackDTOS;
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
        String searchQuery = 'SELECT Id, AlbumReleaseDate__c, AlbumName__c, Name, Duration__c, ImageURL__c ' +
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
        String searchQuery = 'SELECT Id, Name, ImageURL__c, Genre__c, Popularity__c, Followers__c ' +
                'FROM Artist__c WHERE Id = :id';
        System.debug(searchQuery);
        return searchQuery;
    }

    public static String createTrackQuery(String searchTerm) {
        String searchQuery = 'SELECT Id, Name, Duration__c, ImageURL__c ' +
                'FROM Track__c';
        if (string.isNotEmpty(searchTerm)) {
            searchQuery += ' WHERE Name LIKE \'%' + string.escapeSingleQuotes(searchTerm) + '%\'';
        }
        searchQuery += ' ORDER BY Name LIMIT 20';
        System.debug(searchQuery);
        return searchQuery;
    }

    public static String createArtistTopTracksQuery(String id) {
        String searchQuery = ' SELECT Id, Name, Duration__c, ImageURL__c FROM Track__c ' +
                'WHERE Id IN (SELECT Track__c FROM TrackArtist__c WHERE Artist__c = :id) LIMIT 10' ;
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