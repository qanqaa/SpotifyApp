({
    deleteComment: function(component, event, propId) {
        let showSpinner = $A.get("e.c:EV_SpinnerShow").fire();
        let actionComment = component.get("c.delComment");
        actionComment.setParams({
            propId: propId
        });
        actionComment.setCallback(this, $A.getCallback(function(response) {
            let toastType;
            if(response.getState() == 'SUCCESS'){
                toastType = 'success';
                let commentDeletedEvent = $A.get("e.c:CommentDeletedEVENT");
                commentDeletedEvent.fire();
            }
            else{
                toastType = 'error';
            }
            this.showToast(component, toastType, response.getState(), response.getReturnValue());
            let hideSpinner = $A.get("e.c:EV_SpinnerHide").fire();
        }));
        $A.enqueueAction(actionComment);
    },

    showToast : function(component, toastType, msgTitle, message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": msgTitle,
            "type": toastType,
            "message": message
        });
        toastEvent.fire();
    }
})