({
    handleSearch: function(component, artistId) {
        let showSpinner = $A.get("e.c:EV_SpinnerShow").fire();
        let actionArtist = component.get("c.getArtistDetails");
        actionArtist.setParams({
            artistId: artistId
        });
        console.log('handleSearch ARTIST');
        actionArtist.setCallback(this, function(response) {
            let event = $A.get("e.c:EV_ArtDetLoaded");
            event.setParams({
                "artist": response.getReturnValue()
            });
            console.log(response.getReturnValue());
            event.fire();
            console.log(response.getReturnValue());
        });
        $A.enqueueAction(actionArtist);

        let actionArtistTrack = component.get("c.getArtistTopTracks");
        actionArtistTrack.setParams({
            artistId: artistId
        });
        console.log('handleSearch ARTIST top tracks');
        actionArtistTrack.setCallback(this, function(response) {
            let event = $A.get("e.c:EV_ArtistTopTracksLoaded");
            event.setParams({
                "topTracks": response.getReturnValue()
            });
            console.log(response.getReturnValue());
            event.fire();
            console.log(response.getReturnValue());
            let hideSpinner = $A.get("e.c:EV_SpinnerHide").fire();
        });
        $A.enqueueAction(actionArtistTrack);
    }
})