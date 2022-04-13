({
    onTrackDetailsLoaded: function(component, event, helper) {
        helper.hideResults(component, event);
    },

    onTracksLoaded: function(component, event, helper) {
        helper.showTrackResults(component, event);
    },

    onArtistsLoaded: function(component, event, helper) {
        helper.showArtistResults(component, event);
    },

    onTrackDetailsLoaded: function(component, event, helper) {
        helper.showTrackDetails(component, event);
    },

    onArtistDetailsLoaded: function(component, event, helper) {
        helper.showArtistDetails(component, event);
    },

})