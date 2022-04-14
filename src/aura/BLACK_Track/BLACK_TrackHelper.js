({
    handleSearch: function(component, trackId) {
        let showSpinner = $A.get("e.c:EV_SpinnerShow").fire();
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
            let hideSpinner = $A.get("e.c:EV_SpinnerHide").fire();
        });
        $A.enqueueAction(actionTrack);
    }
})