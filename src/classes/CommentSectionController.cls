public with sharing class CommentSectionController {

    @AuraEnabled
    public static String addComment(String commentText, Integer rate, String objectId) {
        String currentUserId = UserInfo.getUserId();
//
//            Spotify_Property__c existingObjectProperty =
//                    Database.query(
//                            'SELECT Id, Rating__c, Comment__c, OwnerId ' +
//                                    'FROM Spotify_Property__c ' +
//                                    'WHERE OwnerId = :currentUserId LIMIT 1'
//                    );
//            if(rate>0){
//                existingObjectProperty.Rating__c = rate;
//            }
//            if(String.isNotBlank(commentText)){
//                existingObjectProperty.Comment__c = commentText;
//            }
//
//            System.debug(existingObjectProperty);
//
//            Database.SaveResult saveResult = Database.update(existingObjectProperty);
//            System.debug(string.valueOf(saveResult));
//
//            if (saveResult.isSuccess()) {
//                return 'Successfully updated review.';
//            } else {
//                String errorMsg = '';
//                for (Database.Error err : saveResult.getErrors()) {
//                    errorMsg += err.getStatusCode() + ': ' + err.getMessage();
//                }
//                return 'The following error has occurred while updating review. Error message: ' + errorMsg;
//            }

        try{
            Spotify_Property__c record = [
                    SELECT Id, ObjectId__c, OwnerId, isFavourite__c, isBlack__c, Title__c, ImageURL__c, Comment__c,
                            Rating__c
                    FROM Spotify_Property__c
                    WHERE ObjectId__c = :objectId
                    AND OwnerId = :currentUserId
                    LIMIT 1
            ];

            System.debug('NIE Tworze nowego spotify recordu bo był');

            record.Comment__c = commentText;
            record.Rating__c = rate;
            record.ObjectId__c = objectId;

            Database.SaveResult saveResult = Database.update(record);
            System.debug(string.valueOf(saveResult));

            if (saveResult.isSuccess()) {
                return 'Successfully added review.';
            }
            else {
                String errorMsg = '';
                for (Database.Error err : saveResult.getErrors()) {
                    errorMsg += err.getStatusCode() + ': ' + err.getMessage();
                }
                return 'The following error has occurred while adding review. Error message: ' + errorMsg;
            }
        }
        catch(Exception e){

            Spotify_Property__c record = new Spotify_Property__c();
            record.Comment__c = commentText;
            record.Rating__c = rate;
            record.ObjectId__c = objectId;

            Database.SaveResult saveResult = Database.insert(record);
            System.debug(string.valueOf(saveResult));
            if (saveResult.isSuccess()) {
                return 'Successfully added review.';
            } else {
                String errorMsg = '';
                for (Database.Error err : saveResult.getErrors()) {
                    errorMsg += err.getStatusCode() + ': ' + err.getMessage();
                }
                return 'The following error has occurred while adding review. Error message: ' + errorMsg;
            }
        }




    }

    @AuraEnabled
    public static String delComment(String propId) {
        System.debug(propId);
        Spotify_Property__c objectSpotifyProperty =
                Database.query(
                                'SELECT Id, Rating__c, Comment__c ' +
                                'FROM Spotify_Property__c ' +
                                'WHERE Id = :propId LIMIT 1'
                );
        objectSpotifyProperty.Rating__c = 0;
        objectSpotifyProperty.Comment__c = '';
        System.debug(objectSpotifyProperty);

        Database.SaveResult saveResult = Database.update(objectSpotifyProperty);
        System.debug(string.valueOf(saveResult));

        if (saveResult.isSuccess()) {
            return 'Successfully deleted review.';
        } else {
            String errorMsg = '';
            for (Database.Error err : saveResult.getErrors()) {
                errorMsg += err.getStatusCode() + ': ' + err.getMessage();
            }
            return 'The following error has occurred while deleting review. Error message: ' + errorMsg;
        }
    }

    @AuraEnabled
    public static List<Spotify_Property__c> getObjectSpotifyProperties(String objectId) {
        List<Spotify_Property__c> objectSpotifyProperties =
                Database.query(
                        'SELECT Id, ObjectId__c, OwnerId, Owner.Name, CreatedDate, ' +
                                'Rating__c, Comment__c, isBlack__c, isFavourite__c,  ' +
                                'ImageURL__c, Title__c ' +
                                'FROM Spotify_Property__c ' +
                                'WHERE ObjectId__c = :objectId ' +
                                'ORDER BY CreatedDate ASC'
                );
        System.debug(objectSpotifyProperties);
        return objectSpotifyProperties;
    }

    @AuraEnabled
    public static List<TrackDTO> getAllObjectSpotifyPropertiesFavourites() {
        String currentUserId = UserInfo.getUserId();
        List<Spotify_Property__c> objectSpotifyProperties =
                Database.query(
                        'SELECT Id, ObjectId__c, OwnerId, Owner.Name, CreatedDate, ' +
                                'Rating__c, Comment__c, isBlack__c, isFavourite__c,  ' +
                                'ImageURL__c, Title__c, Artist_Name__c ' +
                                'FROM Spotify_Property__c ' +
                                'WHERE OwnerId = :currentUserId ' +
                                'AND isFavourite__c = TRUE ' +
                                'ORDER BY Title__c ASC'
                );

        List<TrackDTO> trackDTOS = new List<TrackDTO>();
        for(Spotify_Property__c spotifyProperty : objectSpotifyProperties){

            if(spotifyProperty.isFavourite__c == true){
                TrackDTO trackDTO = new TrackDTO();
                trackDTO.id = spotifyProperty.ObjectId__c;
                trackDTO.name = spotifyProperty.Title__c;
                trackDTO.imageURL = spotifyProperty.ImageURL__c;
                trackDTO.artistName = spotifyProperty.Artist_Name__c;
                trackDTOS.add(trackDTO);
            }

        }
        System.debug('FAVOURITESSSSSSSSS' + objectSpotifyProperties);
        System.debug('FAVOURITESSSSSSSSS' + trackDTOS);
        return trackDTOS;
    }

    @AuraEnabled
    public static List<TrackDTO> getAllObjectSpotifyPropertiesDisliked() {
        String currentUserId = UserInfo.getUserId();
        System.debug(currentUserId);
        List<Spotify_Property__c> objectSpotifyProperties =
                Database.query(
                        'SELECT Id, ObjectId__c, OwnerId, Owner.Name, CreatedDate, ' +
                                'Rating__c, Comment__c, isBlack__c, isFavourite__c,  ' +
                                'ImageURL__c, Title__c, Artist_Name__c ' +
                                'FROM Spotify_Property__c ' +
                                'WHERE OwnerId = :currentUserId ' +
                                'AND isBlack__c = TRUE ' +
                                'ORDER BY Title__c ASC'
                );

        List<TrackDTO> trackDTOS = new List<TrackDTO>();
        for(Spotify_Property__c spotifyProperty : objectSpotifyProperties){

            if(spotifyProperty.isFavourite__c == false){
                TrackDTO trackDTO = new TrackDTO();
                trackDTO.id = spotifyProperty.ObjectId__c;
                trackDTO.name = spotifyProperty.Title__c;
                trackDTO.imageURL = spotifyProperty.ImageURL__c;
                trackDTO.artistName = spotifyProperty.Artist_Name__c;
                trackDTOS.add(trackDTO);
            }

        }
        System.debug('FAVOURITESSSSSSSSS' + objectSpotifyProperties);
        System.debug('FAVOURITESSSSSSSSS' + trackDTOS);
        return trackDTOS;
    }
}