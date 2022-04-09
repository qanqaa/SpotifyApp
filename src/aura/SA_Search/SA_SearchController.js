({
    onSearchClick: function(component, event, helper) {
        console.log('onSearchClick');
        helper.showSpinner(component);
        let searchTerm = component.get("v.searchTerm");
        console.log('onSearchClick: ' + searchTerm);
        setTimeout($A.getCallback(function() {
            helper.handleSearchTracks(component, searchTerm);
            helper.handleSearchArtists(component, searchTerm);
            helper.hideSpinner(component);
        }), 1200);
    },
})