({
    onSearchClick: function(component, event, helper) {
        let searchTerm = component.get("v.searchTerm");
        helper.handleSearch(component, searchTerm);
    },
})