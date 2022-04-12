({
    saveComment: function(component, event, helper) {
        let commentText = component.get("v.commentText");
        console.log('commentText' + commentText);
        let rate = component.find("starRate").get("v.value");
        let objectId = component.get("v.objectId");
        console.log('objectId' + objectId);
        helper.saveComment(component, event, commentText, rate, objectId);
        console.log('CO SIE DZIEJE?');
    }
});