({
     handleSearch: function(component, searchTerm) {
        let showSpinner = $A.get("e.c:EV_SpinnerShow").fire();

        let actionTrack = component.get("c.getAllTracks");
        actionTrack.setParams({
            searchTerm: searchTerm
        });

        actionTrack.setCallback(this, $A.getCallback(function(response) {
            let event = $A.get("e.c:EV_TracksLoaded");
            event.setParams({
                "tracks": response.getReturnValue()
            });
            event.fire();
        }));
        $A.enqueueAction(actionTrack);

        let actionArtist = component.get("c.getAllArtists");
        actionArtist.setParams({
            searchTerm: searchTerm
        });

        actionArtist.setCallback(this, $A.getCallback(function(response) {
            let event2 = $A.get("e.c:EV_ArtLoaded");
            event2.setParams({
                "artists": response.getReturnValue()
            });
            event2.fire();
            let hideSpinner = $A.get("e.c:EV_SpinnerHide").fire();
        }));
        $A.enqueueAction(actionArtist);
    }
})