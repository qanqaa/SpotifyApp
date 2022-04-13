({
    getComments: function(component, event, objectId) {
        console.log('hellomdf');
        let actionComment = component.get("c.getObjectSpotifyProperties");
        actionComment.setParams({
            objectId: objectId
        });
        console.log('objectId' + objectId);

        actionComment.setCallback(this, $A.getCallback(function(response) {
            /*let eventSPL = $A.get("e.c:EV_SpotifyPropertiesLoaded");
            eventSPL.setParam({
                "spotProp": response.getReturnValue()
            });
            eventSPL.fire();*/
            var userId = $A.get("$SObjectType.CurrentUser.Id");
            Console.log(userId);
            let str = response.getReturnValue();
            for(let i = 0; i < str.length; i++){
                if(str[i].OwnerId == userId){
                    component.set('v.showInput', false);
                    break;
                }
            }
        }));
        $A.enqueueAction(actionComment);
    },
})