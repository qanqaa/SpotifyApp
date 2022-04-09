public class RatingController{

    // Used to get Opportunity's current rating.
    // Params: recordId - Opportunity record id.
    @AuraEnabled
    public static Integer getObjectCurrentRating( Id recordId ){
        Rating__c record = [SELECT ObjectId__c, StarNumber__c from Rating__c WHERE ObjectId__c = :recordId];
        return record.StarNumber__c != null ? Integer.valueOf( record.StarNumber__c )  : 0;
    }

    // Used to update Opportunity record with new rating.
    // Params: { recordId: Opportunity record id, rating: new rating for this opportunity }
    @AuraEnabled
    public static String updateObjectRating(Id recordId, Decimal rating ){
        Rating__c recordIdToUpdate = [SELECT Id FROM Rating__c WHERE ObjectId__c =:recordId LIMIT 1];
        update new Rating__c( id=recordIdToUpdate.Id, StarNumber__c= rating);
        return 'SUCCESS';
    }
}