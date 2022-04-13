({
    deleteComment: function(component, event, helper) {
        let propId = component.get("v.propId");
        helper.deleteComment(component, event, propId);
    }
})