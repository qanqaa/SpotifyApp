({
    /*onValueChange: function(component, event, helper) {
        let objId = component.get("v.objectId");
        helper.getComments(component, event, objId);
    }*/

        onValueChange: function(component, event, helper) {
            let objId = component.get("v.objectId");
            helper.getComments(component, event, objId);
        }
})