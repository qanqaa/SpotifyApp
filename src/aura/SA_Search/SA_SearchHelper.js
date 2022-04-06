({
     handleSearch: function(component, searchTerm) {
        let action = component.get("c.searchTracks");
        action.setParams({
            searchTerm: searchTerm
        });

        action.setCallback(this, function(response) {
            let event = $A.get("e.c:EV_TracksLoaded");
            event.setParams({
                "internalTracks": response.getReturnValue()
            });
            event.fire();
            console.log(response.getReturnValue());
        });
        $A.enqueueAction(action);
    },

    showSpinner: function(component) {
        component.find('spinner').showSpinner();
     },

    hideSpinner: function(component) {
        component.find('spinner').hideSpinner();
    }
})