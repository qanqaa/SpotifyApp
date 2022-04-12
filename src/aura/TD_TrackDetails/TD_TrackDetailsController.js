({
    onTrackDetailsLoaded: function(component, event, helper) {
        helper.showTrackDetails(component, event);
    },

    onArtistClick: function(component, event, helper) {
        console.log('onArtistClick');
        let artistId =  event.target.id;
        console.log('onArtistClick: ' + artistId);
            helper.handleSearch(component, artistId);
    },
})