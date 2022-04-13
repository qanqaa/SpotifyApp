({
    /*showArtistDetails: function(component, event) {
        let artist = event.getParam('artist');
        if(artist){
            component.set('v.showDetails', true);
            component.set('v.artist', artist);
        }
        else {
             component.set('v.showDetails', false);
        }
    },*/

    showArtistTopTracks: function(component, event) {
        let topTracks = event.getParam('topTracks');
        if(topTracks){
            component.set('v.showTopTracks', true);
            component.set('v.topTracks', topTracks);
        }
        else {
             component.set('v.showTopTracks', false);
        }
    }
})