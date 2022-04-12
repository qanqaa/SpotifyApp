public with sharing class CommentSectionController {

    @AuraEnabled
    public static String addComment(String commentText, Integer rate, String objectId) {
        Spotify_Property__c newComment = new Spotify_Property__c();
        newComment.Comment__c = commentText;
        newComment.Rating__c = rate;
        newComment.ObjectId__c = objectId;

        Database.SaveResult saveResult = Database.insert(newComment);
        System.debug(string.valueOf(saveResult));
        if (saveResult.isSuccess()) {
            return 'Successfully added comment.';
        } else {
            String errorMsg = '';
            for (Database.Error err : saveResult.getErrors()) {
                errorMsg += err.getStatusCode() + ': ' + err.getMessage();
            }
            return 'The following error has occurred while adding comment. Error message: ' + errorMsg;
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
            return 'Successfully deleted comment.';
        } else {
            String errorMsg = '';
            for (Database.Error err : saveResult.getErrors()) {
                errorMsg += err.getStatusCode() + ': ' + err.getMessage();
            }
            return 'The following error has occurred while deleting comment. Error message: ' + errorMsg;
        }
    }

    @AuraEnabled
    public static List<Spotify_Property__c> getObjectSpotifyProperties(String objectId) {
        List<Spotify_Property__c> objectSpotifyProperties =
                Database.query(
                        'SELECT Id, ObjectId__c, OwnerId, Owner.Name, CreatedDate, ' +
                                'Rating__c, Comment__c, isBlack__c, isFavorite__c  ' +
                                'FROM Spotify_Property__c ' +
                                'WHERE ObjectId__c = :objectId ' +
                                'ORDER BY CreatedDate ASC');
        System.debug(objectSpotifyProperties);
        return objectSpotifyProperties;
    }
}