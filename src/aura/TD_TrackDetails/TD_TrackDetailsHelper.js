({
    showTrackDetails: function(component, event) {
        let track = event.getParam('track');
        if(track){
            component.set('v.showDetails', true);
            component.set('v.track', track);
            component.set('v.durationString', this.parseDurationToString(track.duration));
        }
        else {
             component.set('v.showDetails', false);
        }
    },

    handleSearch: function(component, artistId) {
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
        });
        $A.enqueueAction(actionArtistTrack);
    },

    parseDurationToString: function(s) {
        function pad(n, z) {
            z = z || 2;
        return ('00' + n).slice(-z);
        }

        let ms = s % 1000;
        s = (s - ms) / 1000;
        let secs = s % 60;
        s = (s - secs) / 60;
        let mins = s % 60;
        let hrs = (s - mins) / 60;

        if(pad(hrs) != '00'){
            return pad(hrs) + ':' + pad(mins) + ':' + pad(secs);
        }
        else{
            return pad(mins) + ':' + pad(secs);
        }
    }
})