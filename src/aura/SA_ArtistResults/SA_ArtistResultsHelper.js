({
    showResults: function(component, event) {
        let artistList = event.getParam('artists');
        if(artistList){
            component.set('v.allArtists', artistList);
            if(artistList.length > 0) {
                component.set('v.showResults', true);
            }
            else {
                component.set('v.showResults', false);
            }
        }
    }
})