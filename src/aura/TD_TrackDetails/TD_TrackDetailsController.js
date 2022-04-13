({
    /*onTrackDetailsLoaded: function(component, event, helper) {
        helper.showTrackDetails(component, event);
    },*/

    onSpotifyPropertiesLoaded: function(component, event, helper) {
        console.log('czy on tu W OGÓLE WCHODZI?!!?!??!');
        helper.showPropertiesSection(component, event);
    },

    onArtistClick: function(component, event, helper) {
        console.log('onArtistClick');
        let artistId =  event.target.id;
        console.log('onArtistClick: ' + artistId);
            helper.handleSearch(component, artistId);
    },
})