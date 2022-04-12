({
    saveComment: function(component, event, commentText, rate, objectId) {
        let showSpinner = $A.get("e.c:EV_SpinnerShow").fire();
        let actionComment = component.get("c.addComment");
        actionComment.setParams({
            commentText: commentText,
            rate: rate,
            objectId: objectId
        });
        actionComment.setCallback(this, $A.getCallback(function(response) {
            let toastType;
            if(response.getState() == 'SUCCESS'){
                toastType = 'success';
                let commentAddedEvent = $A.get("e.c:EV_CommentAdded");
                console.log(commentAddedEvent);
                console.log('ODPALA COMMENT ADDED EVENT?');
                commentAddedEvent.fire();
                console.log('ODPALA COMMENT ADDED EVENT');
            }
            else{
                toastType = 'error';
            }
            this.showToast(component, toastType, response.getState(), response.getReturnValue());
            console.log(response.getReturnValue());
            console.log(response.getState());
            component.set('v.commentText', '');
            component.set('v.rate', 0);
            let hideSpinner = $A.get("e.c:EV_SpinnerHide").fire();
        }));
        $A.enqueueAction(actionComment);
    },

    showToast : function(component, toastType, msgTitle, message) {
        var toastEvent = $A.get("e.force:showToast");
        console.log('wchodzi w toast');
        toastEvent.setParams({
            "title": msgTitle,
            "type": toastType,
            "message": message
        });
        toastEvent.fire();
    }
})