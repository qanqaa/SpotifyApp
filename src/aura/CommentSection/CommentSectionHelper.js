({
    getComments: function(component, event, objectId) {
        let actionComment = component.get("c.getObjectSpotifyProperties");
        actionComment.setParams({
            objectId: objectId
        });
        console.log('objectId' + objectId);

        actionComment.setCallback(this, $A.getCallback(function(response) {
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