({
    hideResults: function(component, event) {
        component.set('v.showSearchResults', false);
    },

    showTrackResults: function(component, event) {
        let trackList = event.getParam('tracks');
        if(trackList){
            if(trackList.length > 0) {
                component.set('v.showTrackResults', true);
            }
            else {
                component.set('v.showTrackResults', false);
            }
        }
    },

     showArtistResults: function(component, event) {
        let artistList = event.getParam('artists');
        if(artistList){
            if(artistList.length > 0) {
                component.set('v.showArtistResults', true);
            }
            else {
                component.set('v.showArtistResults', false);
            }
        }
     },

     showTrackDetails: function(component, event) {
         let trackDetails = event.getParam('track');
         if(trackDetails){
             component.set('v.showTrackDetails', true);
             component.set('v.showArtistDetails', false);
         }
         else {
             component.set('v.showTrackDetails', false);
         }
     },

     showArtistDetails: function(component, event) {
         let artistDetails = event.getParam('artist');
         if(artistDetails){
             component.set('v.showArtistDetails', true);
             component.set('v.showTrackDetails', false);
         }
         else {
             component.set('v.showArtistDetails', false);
         }
      }
})