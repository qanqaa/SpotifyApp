({
    hideResults: function(component, event) {
        component.set('v.showSearchResults', false);
    },

    showTrackResults: function(component, event) {
        let trackList = event.getParam('tracks');
        component.set('v.foundedTracks', trackList);
        if(trackList){
            if(trackList.length > 0) {
                component.set('v.showTrackResults', true);
                component.set('v.showSearchResults', true);
            }
            else {
                component.set('v.showTrackResults', false);
            }
        }
    },

     showArtistResults: function(component, event) {
        let artistList = event.getParam('artists');
        component.set('v.foundedArtists', artistList);
        if(artistList){
            if(artistList.length > 0) {
                component.set('v.showArtistResults', true);
                component.set('v.showSearchResults', true);
            }
            else {
                component.set('v.showArtistResults', false);
            }
        }
     },

     showTrackDetails: function(component, event) {
         let trackDetails = event.getParam('track');
         component.set('v.selectedTrack', trackDetails);
         if(trackDetails){
             component.set('v.showTrackDetails', true);
             component.set('v.showArtistDetails', false);
             component.set('v.showTrackResults', false);
             component.set('v.showArtistResults', false);
         }
         else {
             component.set('v.showTrackDetails', false);
         }
     },

     showArtistDetails: function(component, event) {
         let artistDetails = event.getParam('artist');
         component.set('v.selectedArtist', artistDetails);
         if(artistDetails){
             component.set('v.showArtistDetails', true);
             component.set('v.showTrackDetails', false);
             component.set('v.showTrackResults', false);
             component.set('v.showArtistResults', false);
         }
         else {
             component.set('v.showArtistDetails', false);
         }
      }
})