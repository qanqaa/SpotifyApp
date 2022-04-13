public with sharing class LikeDislikeController {

//    @AuraEnabled
//    public static Integer removeFromFavourite( String id, String title, String imageURL ){
//        Spotify_Property__c record = [
//                SELECT isFavorite__c
//                FROM Spotify_Property__c
//                WHERE Id = :id];
//
//
//        record.isFavorite__c = false;
//        objectSpotifyProperty.Comment__c = '';
//        System.debug(objectSpotifyProperty);
//
//        Database.SaveResult saveResult = Database.update(objectSpotifyProperty);
//        System.debug(string.valueOf(saveResult));
//
//        if (saveResult.isSuccess()) {
//            return 'Successfully deleted review.';
//        } else {
//            String errorMsg = '';
//            for (Database.Error err : saveResult.getErrors()) {
//                errorMsg += err.getStatusCode() + ': ' + err.getMessage();
//            }
//            return 'The following error has occurred while deleting review. Error message: ' + errorMsg;
//        }
//        return record.StarNumber__c != null ? Integer.valueOf( record.StarNumber__c )  : 0;
//    }

    @AuraEnabled
    public static void addToFavourite( String id, String title, String imageURL ){
        System.debug('dostaje id' + id);
        String currentUserId = UserInfo.getUserId();
        try{
            Spotify_Property__c record = [
                    SELECT Id, ObjectId__c, OwnerId, isFavourite__c, isBlack__c, Title__c, ImageURL__c
                    FROM Spotify_Property__c
                    WHERE ObjectId__c = :id
                    AND OwnerId = :currentUserId
                    LIMIT 1
            ];
            System.debug('NIE Tworze nowego spotify recordu bo był');

            record.isFavourite__c = true;
            record.isBlack__c = false;
            record.Title__c = title;
            record.ImageURL__c = imageURL;

            Database.SaveResult saveResult = Database.update(record);
            System.debug(string.valueOf(saveResult));

        }
        catch(Exception e){

            System.debug('Tworze nowy spotify record bo nie było');
            Spotify_Property__c record = new Spotify_Property__c();
            record.ObjectId__c = id;
            record.isFavourite__c = true;
            record.isBlack__c = false;
            record.Title__c = title;
            record.ImageURL__c = imageURL;

            Database.SaveResult saveResult = Database.insert(record);
            System.debug(string.valueOf(saveResult));
        }
    }
}