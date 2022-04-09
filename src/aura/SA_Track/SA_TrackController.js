({
    onTrackClick : function(component, event, helper) {
        console.log('onTrackClick');
       // helper.showSpinner(component);
        let trackId = component.get("v.id");
        console.log('onTrackClick: ' + trackId);
        setTimeout($A.getCallback(function() {
            helper.handleSearch(component, trackId);
//            helper.hideSpinner(component);
        }), 1200);
    }
})