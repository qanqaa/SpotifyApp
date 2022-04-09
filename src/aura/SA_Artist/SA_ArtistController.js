({
    onArtistClick : function(component, event, helper) {
        console.log('onArtistClick');
       // helper.showSpinner(component);
        let artistId = component.get("v.id");
        console.log('onArtistClick: ' + artistId);
        setTimeout($A.getCallback(function() {
            helper.handleSearch(component, artistId);
//            helper.hideSpinner(component);
        }), 1200);
    }
})