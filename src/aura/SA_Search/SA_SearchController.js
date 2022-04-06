({
    onSearchClick: function(component, event, helper) {
        console.log('onSearchClick');
        helper.showSpinner(component);
        let searchTerm = component.get("v.searchTerm");
        console.log('onSearchClick: ' + searchTerm);
        setTimeout($A.getCallback(function() {
            helper.handleSearch(component, searchTerm);
            helper.hideSpinner(component);
        }), 1200);
    },
})