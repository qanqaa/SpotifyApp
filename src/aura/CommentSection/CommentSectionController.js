({
    onTrackDetailsLoaded: function(component, event, helper) {
        helper.showTrackDetails(component, event);
    },


    onValueChange: function(component, event, helper) {
        let objId = component.get("v.objectId");
        helper.getComments(component, event, objId);
    }
})