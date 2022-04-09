({
    handleSearch: function(component, trackId) {
        let actionTrack = component.get("c.getTrackDetails");
        actionTrack.setParams({
            trackId: trackId
        });

        actionTrack.setCallback(this, function(response) {
            let event = $A.get("e.c:EV_TrackDetailsLoaded");
            event.setParams({
                "track": response.getReturnValue()
            });
            event.fire();
            console.log(response.getReturnValue());
        });
        $A.enqueueAction(actionTrack);
    },

    showSpinner: function(component) {
        component.find('spinner').showSpinner();
     },

    hideSpinner: function(component) {
        component.find('spinner').hideSpinner();
    }
})