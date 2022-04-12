({
    onSearchClick: function(component, event, helper) {
        console.log('onSearchClick');
        let searchTerm = component.get("v.searchTerm");
        console.log('onSearchClick: ' + searchTerm);
        helper.handleSearch(component, searchTerm);
    },
})