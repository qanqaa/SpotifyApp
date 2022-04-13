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

    showPropertiesSection: function(component, event) {
        let objectProperties = event.getParam('spotProp');
        var userId = $A.get("$SObjectType.CurrentUser.Id");

        console.log('userId' + userId);
        console.log('objectProperties' + objectProperties);
        console.log('objectProperties0 ' + objectProperties[0].OwnerId);
        if(objectProperties){
            for(let i = 0; i < objectProperties.length; i++){
                if(objectProperties[i].OwnerId == userId){
                    component.set('v.objectOwnerProp', objectProperties[i]);
                    console.log('objectProperties[i]' + objectProperties[i]);
                    break;
                }
            }
        }
        else {
             component.set('v.showComments', false);
        }
    },

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