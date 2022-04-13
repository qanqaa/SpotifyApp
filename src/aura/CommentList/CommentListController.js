({
    doInit: function(component, event, helper) {
        let objId = component.get("v.objectId");
        console.log('dzieje sie ONVALUECVHANGE');
        helper.getComments(component, event, objId);
    },

    onValueChange: function(component, event, helper) {
        let objId = component.get("v.objectId");
        console.log('dzieje sie ONVALUECVHANGE');
        helper.getComments(component, event, objId);
    }
})