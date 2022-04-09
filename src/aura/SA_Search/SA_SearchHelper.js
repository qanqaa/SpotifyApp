({
     handleSearchTracks: function(component, searchTerm) {
        let actionTrack = component.get("c.getAllTracks");
        actionTrack.setParams({
            searchTerm: searchTerm
        });

        actionTrack.setCallback(this, function(response) {
            let event = $A.get("e.c:EV_TracksLoaded");
            event.setParams({
                "tracks": response.getReturnValue()
            });
            event.fire();
            console.log(response.getReturnValue());
        });
        $A.enqueueAction(actionTrack);
    },

     handleSearchArtists: function(component, searchTerm) {
        let actionArtist = component.get("c.getAllArtists");
        actionArtist.setParams({
            searchTerm: searchTerm
        });

        actionArtist.setCallback(this, function(response) {
            let event2 = $A.get("e.c:EV_ArtLoaded");
            event2.setParams({
                "artists": response.getReturnValue()
            });
            console.log(event2.getParam("artists"));
            console.log(response.getReturnValue());
            event2.fire();
            console.log(response.getReturnValue());
        });
        $A.enqueueAction(actionArtist);
    },


    showSpinner: function(component) {
        component.find('spinner').showSpinner();
     },

    hideSpinner: function(component) {
        component.find('spinner').hideSpinner();
    }
})