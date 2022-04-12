({
    deleteComment: function(component, event, propId) {
        let showSpinner = $A.get("e.c:EV_SpinnerShow").fire();
        let actionComment = component.get("c.delComment");
        console.log('propId' + propId);
        actionComment.setParams({
            propId: propId
        });
        actionComment.setCallback(this, $A.getCallback(function(response) {
            let toastType;
            console.log('jaki getstate przy usuwaniu?' + response.getState())
            if(response.getState() == 'SUCCESS'){
                console.log('wchodzi do success');
                toastType = 'success';
                let commentDeletedEvent = $A.get("e.c:CommentDeletedEVENT");
                console.log(commentDeletedEvent);
                console.log('ODPALA COMMENT ADDED EVENT?');
                commentDeletedEvent.fire();
                console.log('ODPALA COMMENT ADDED EVENT');
            }
            else{
            console.log('wchodzi do false');
                toastType = 'error';
            }
            this.showToast(component, toastType, response.getState(), response.getReturnValue());
            console.log(response.getReturnValue());
            console.log(response.getState());
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