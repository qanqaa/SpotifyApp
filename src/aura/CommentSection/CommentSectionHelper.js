({
    showTrackDetails: function(component, event) {
        let track = event.getParam('track');
        if(track){
            component.set('v.showDetails', true);
            component.set('v.track', track);
            component.set('v.durationString', this.parseDurationToString(track.duration));
            component.find('')
        }
        else {
             component.set('v.showDetails', false);
        }
    },


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