({
    showArtistDetails: function(component, event) {
        let artist = event.getParam('artist');
        if(artist){
            component.set('v.showDetails', true);
            component.set('v.artist', artist);
        }
        else {
             component.set('v.showDetails', false);
        }
    },

    showArtistTopTracks: function(component, event) {
    console.log('TOP TRACKS WCHODZI: ');
        let topTracks = event.getParam('topTracks');
        console.log('TOP TRACKS LALALA: ' + topTracks);
        if(topTracks){
            component.set('v.showTopTracks', true);
            component.set('v.topTracks', topTracks);
            console.log('pokaz top tracks');
        }
        else {
             component.set('v.showTopTracks', false);
        }
    }
})