({
    showResults: function(component, event) {
        let trackList = event.getParam('tracks');
        if(trackList){
            component.set('v.allTracks', trackList);
            if(trackList.length > 0) {
                component.set('v.showResults', true);
            }
            else {
                component.set('v.showResults', false);
            }
        }
    },
})