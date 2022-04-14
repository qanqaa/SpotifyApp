({
    onTracksLoaded: function(component, event, helper) {
        helper.showResults(component, event);
    },

    onTrackClick : function(component, event, helper) {
        console.log('onTrackClick');
        let trackId = component.get("v.id");
        console.log('onTrackClick: ' + trackId);
        helper.handleSearch(component, trackId);
    },
})