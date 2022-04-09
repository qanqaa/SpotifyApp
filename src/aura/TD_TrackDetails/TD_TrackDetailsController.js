({
    onTrackDetailsLoaded: function(component, event, helper) {
        helper.showTrackDetails(component, event);
    },

    onArtistClick: function(component, event, helper) {
        console.log('onArtistClick');
       // helper.showSpinner(component);
        let artistId =  event.target.id;
        console.log('onArtistClick: ' + artistId);
        setTimeout($A.getCallback(function() {
            helper.handleSearch(component, artistId);
//            helper.hideSpinner(component);
        }), 1200);
    },
})