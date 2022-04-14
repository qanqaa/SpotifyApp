({
    onTrackDetailsLoaded: function(component, event, helper) {
        helper.showTrackDetails(component, event);
    },

    onSpotifyPropertiesLoaded: function(component, event, helper) {
    console.log('nareszcie????????????????');
        helper.showPropertiesSection(component, event);
    },

    onArtistClick: function(component, event, helper) {
        let artistId =  event.target.id;
        helper.handleSearch(component, artistId);
    },
})