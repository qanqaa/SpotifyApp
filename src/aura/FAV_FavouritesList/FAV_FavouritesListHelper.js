({
    getComments: function(component, event, objectId) {
        let actionComment = component.get("c.getAllObjectSpotifyPropertiesFavourites");

        actionComment.setCallback(this, $A.getCallback(function(response) {
            let state = response.getState();
            switch(state){
                case "SUCCESS":
                    let propertiesInfo = response.getReturnValue();

                    component.set("v.objectProperties", propertiesInfo);
                    component.set("v.foundedTracks", propertiesInfo);
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