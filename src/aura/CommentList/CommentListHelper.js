({
    getComments: function(component, event, objectId) {
        console.log('hellomdf');
        console.log('objectId' + objectId);

        let actionComment = component.get("c.getObjectSpotifyProperties");
        actionComment.setParams({
            objectId: objectId
        });
        console.log('objectId' + objectId);
        actionComment.setCallback(this, $A.getCallback(function(response) {
           /* let eventSPL = $A.get("e.c:EV_SpotifyPropertiesLoaded");
            eventSPL.setParam({
                "spotProp": response.getReturnValue()
            });
            eventSPL.fire();
            console.log(response.getReturnValue());*/

            let state = response.getState();
            switch(state){
                case "SUCCESS":
                    let propertiesInfo = response.getReturnValue();
                    component.set("v.propertiesInfo", propertiesInfo);
                    console.log('UDALO SIEEEEEE' + response.getReturnValue());
                    break;

                case "INCOMPLETE":
                    break;

                case "ERROR":
                    break;
            }
        }));
        $A.enqueueAction(actionComment);
    },
})