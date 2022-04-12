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
            console.log(response.getReturnValue());
            let hideSpinner = $A.get("e.c:EV_SpinnerHide").fire();
        }));
        $A.enqueueAction(actionComment);
    },
})