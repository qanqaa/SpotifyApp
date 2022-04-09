public with sharing class SA_ObjectMapper {

    public static TrackDTO mapToDetailedTrackDTO(Track__c track) {
        TrackDTO trackDTO = new TrackDTO();
        try {
            trackDTO.id = track.Id;
            trackDTO.name = track.Name;
            trackDTO.imageURL = track.ImageURL__c;
            trackDTO.duration = Integer.valueOf(track.Duration__c);
            trackDTO.artistName = track.Artist_Name__c;
        }
        catch(Exception e){
            System.debug(e.getMessage());
            return null;
        }
        return trackDTO;
    }

    public static ArtistDTO mapToDetailedArtistDTO(Artist__c artist) {
        ArtistDTO artistDTO = new ArtistDTO();
        try {
            artistDTO.id = artist.Id;
            artistDTO.name = artist.Name;
            artistDTO.imageURL = artist.ImageURL__c;
            artistDTO.genre = artist.Genre__c;
        }
        catch(Exception e){
            System.debug(e.getMessage());
            return null;
        }
        return artistDTO;
    }

    public static List<TrackDTO> getTracksDTOSFromSpotifyResponse(SpotifyTracksResponse spotifyTracksResponse) {
        List<TrackDTO> trackDTOS = new List<TrackDTO>();
        try {
            for (SpotifyTracksResponse.Items item : spotifyTracksResponse.tracks.items) {
                TrackDTO trackDTO = new TrackDTO();
                trackDTO.id = item.id;
                trackDTO.name = item.name;
                if(item.album.images.size() > 0){
                    trackDTO.imageURL = item.album.images[0].url;
                }
                trackDTO.duration = item.duration_ms;
                trackDTO.artistName = item.artists[0].name;
                trackDTOS.add(trackDTO);
            }
        } catch (Exception e) {
            return null;
        }
        return trackDTOS;
    }

    public static List<TrackDTO> getTracksDTOSFromSpotifyArtistTopTracks(SpotifyArtistTopTracks spotifyArtistTopTracks) {
        List<TrackDTO> trackDTOS = new List<TrackDTO>();
        try {
            for (SpotifyArtistTopTracks.Tracks item : spotifyArtistTopTracks.tracks) {
                TrackDTO trackDTO = new TrackDTO();
                trackDTO.id = item.id;
                trackDTO.name = item.name;
                if(item.album.images.size() > 0){
                    trackDTO.imageURL = item.album.images[0].url;
                }
                trackDTO.duration = item.duration_ms;
                trackDTO.artistName = item.artists[0].name;
                trackDTOS.add(trackDTO);
            }
        } catch (Exception e) {
            System.debug(e.getMessage());
            return null;
        }
        return trackDTOS;
    }

    public static List<ArtistDTO> getArtistsDTOSFromSpotifyResponse(SpotifyArtistsResponse spotifyArtistsResponse) {
        List<ArtistDTO> artistDTOS = new List<ArtistDTO>();

        for (SpotifyArtistsResponse.Items item : spotifyArtistsResponse.artists.items) {
            try {
                ArtistDTO artistDTO = new ArtistDTO();
                artistDTO.id = item.id;
                artistDTO.name = item.name;
                if(item.images.size() > 0){
                    System.debug('IMAGES WCHODZI');
                    artistDTO.imageURL = item.images[0].url;
                }
                if(item.genres.size() > 0){
                    System.debug('GENRES WCHODZI');
                    artistDTO.genre = item.genres[0];
                }
                artistDTOS.add(artistDTO);
            } catch (Exception e) {
                System.debug(e.getMessage() + e.getCause());

            }
        }

        return artistDTOS;
    }

    public static List<TrackDTO> mapToTrackDTOS(List<Track__c> tracks) {
        List<TrackDTO> trackDTOS = new List<TrackDTO>();
        try {
            for (Track__c track : tracks) {
                TrackDTO trackDTO = new TrackDTO();
                trackDTO.id = track.Id;
                trackDTO.name = track.Name;
                trackDTO.imageURL = track.ImageURL__c;
                trackDTO.duration = Integer.valueOf(track.Duration__c);
                trackDTO.artistName = track.Artist_Name__c;
                trackDTOS.add(trackDTO);
            }
        } catch (Exception e) {
            return null;
        }
        return trackDTOS;
    }

    public static List<ArtistDTO> mapToArtistDTOS(List<Artist__c> artists) {
        List<ArtistDTO> artistDTOS = new List<ArtistDTO>();
        try {
            for (Artist__c artist : artists) {
                ArtistDTO artistDTO = new ArtistDTO();
                artistDTO.id = artist.Id;
                artistDTO.name = artist.Name;
                artistDTO.imageURL = artist.ImageURL__c;
                artistDTOS.add(artistDTO);
            }
        } catch (Exception e) {
            return null;
        }
        return artistDTOS;
    }

    public static TrackDTO getTracksDTOSFromSpotifyTrackDetails(SpotifyTrackDetails spotifyTrackDetails) {
        TrackDTO trackDTO = new TrackDTO();
        trackDTO.spotifyId = spotifyTrackDetails.id;
        trackDTO.name = spotifyTrackDetails.name;
        if(spotifyTrackDetails.album.images.size() > 0){
            trackDTO.imageURL = spotifyTrackDetails.album.images[0].url;
        }
        trackDTO.duration = spotifyTrackDetails.duration_ms;
        trackDTO.artistName = spotifyTrackDetails.artists[0].name;
        if(spotifyTrackDetails.album.name != null){
            trackDTO.albumName = spotifyTrackDetails.album.name;
        }
        if(spotifyTrackDetails.album.release_date != null){
            trackDTO.albumReleaseDate = spotifyTrackDetails.album.release_date;
        }
        List<ArtistDTO> featArtistsDTOS = new List<ArtistDTO>();
        for(Integer i = 0; i < spotifyTrackDetails.Artists.size(); i++){
            ArtistDTO artistDTO = new ArtistDTO();
            artistDTO.spotifyId = spotifyTrackDetails.Artists[i].id;
            artistDTO.name = spotifyTrackDetails.Artists[i].name;
            featArtistsDTOS.add(artistDTO);
        }
        trackDTO.featArtists = featArtistsDTOS;

        return trackDTO;
    }

    public static ArtistDTO getArtistsDTOSFromSpotifyArtistDetails(spotifyArtistDetails spotifyArtistDetails) {
        ArtistDTO artistDTO = new ArtistDTO();
        artistDTO.spotifyId = spotifyArtistDetails.id;
        artistDTO.name = spotifyArtistDetails.name;
        if(spotifyArtistDetails.images.size() > 0){
            artistDTO.imageURL = spotifyArtistDetails.images[0].url;
        }
        if(spotifyArtistDetails.followers.total != null){
            artistDTO.followers = spotifyArtistDetails.followers.total;
        }
        if(spotifyArtistDetails.genres.size() > 0){
            artistDTO.genre = spotifyArtistDetails.genres[0];
        }
        if(spotifyArtistDetails.popularity != null){
            artistDTO.popularity = spotifyArtistDetails.popularity;
        }
        List<String> genres = new List<String>();
        for(Integer i = 0; i < spotifyArtistDetails.genres.size(); i++){
            genres.add(spotifyArtistDetails.genres[i]);
        }
        artistDTO.genres = genres;

        return artistDTO;
    }
}