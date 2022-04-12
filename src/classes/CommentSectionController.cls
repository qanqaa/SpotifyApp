public with sharing class CommentSectionController {

    @AuraEnabled
    public static void addComment(String commentText, Integer rate, String objectId) {
        Spotify_Property__c newComment = new Spotify_Property__c();
        newComment.Comment__c = commentText;
        newComment.Rating__c = rate;
        newComment.ObjectId__c = objectId;

        Database.SaveResult saveResult = Database.insert(newComment);
        System.debug(string.valueOf(saveResult));
//        return string.valueOf(saveResult);
    }

    @AuraEnabled
    public static List<Spotify_Property__c> getObjectSpotifyProperties(String objectId) {
        List<Spotify_Property__c> objectSpotifyProperties =
                Database.query(
                        'SELECT Id, ObjectId__c, Owner.Name, LastModifiedDate, ' +
                                'Rating__c, Comment__c, isBlack__c, isFavorite__c  ' +
                                'FROM Spotify_Property__c ' +
                                'WHERE ObjectId__c = :objectId ');
        System.debug(objectSpotifyProperties);
        return objectSpotifyProperties;
    }
}