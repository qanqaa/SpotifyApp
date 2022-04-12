({
    onArtistClick : function(component, event, helper) {
        console.log('onArtistClick');
        let artistId = component.get("v.id");
        console.log('onArtistClick: ' + artistId);
        helper.handleSearch(component, artistId);
    }
})