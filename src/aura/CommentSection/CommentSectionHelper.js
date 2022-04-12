({
    getComments: function(component, event, objectId) {
        console.log('hellomdf');
        let actionComment = component.get("c.getObjectSpotifyProperties");
        actionComment.setParams({
            objectId: objectId
        });
        console.log('objectId' + objectId);
        actionComment.setCallback(this, $A.getCallback(function(response) {
            let eventSPL = $A.get("e.c:EV_SpotifyPropertiesLoaded");
            eventSPL.setParam({
                "spotProp": response.getReturnValue()
            });
            eventSPL.fire();
            console.log(response.getReturnValue());
            component.set('v.spotPropInfo', response.getReturnValue());
            console.log(component.get('v.spotPropInfo'));
        }));
        $A.enqueueAction(actionComment);
    },
})