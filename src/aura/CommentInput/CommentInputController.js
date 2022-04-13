({
    showCommentInput: function(component, event, helper) {
        let showInputComment = event.getParam('showInputComment');
        if(showInputComment){
            if(showInputComment) {
                component.set('v.showInputComment', true);
                console.log('powinno pokazac');
            }
            else {
                component.set('v.showInputComment', false);
                console.log('powinno NIEpokazac');
            }
        }
    },

    saveComment: function(component, event, helper) {
        let commentText = component.get("v.commentText");
        console.log('commentText' + commentText);
        let rate = component.find("starRate").get("v.value");
        let objectId = component.get("v.objectId");
        console.log('objectId' + objectId);
        helper.saveComment(component, event, commentText, rate, objectId);
        console.log('CO SIE DZIEJE?');
        component.set('v.rate', 0);
    }
});