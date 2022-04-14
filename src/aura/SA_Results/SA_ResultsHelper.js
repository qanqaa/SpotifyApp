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
      },

    showPropertiesSection: function(component, event) {
        let objectProperties = event.getParam('spotProp');
        var userId = $A.get("$SObjectType.CurrentUser.Id");

        console.log('userId' + userId);
        console.log('objectProperties' + objectProperties);
        console.log('objectProperties0 ' + objectProperties[0].OwnerId);
        if(objectProperties){
            component.set('v.objectProperties', objectProperties);
            for(let i = 0; i < objectProperties.length; i++){
                if(objectProperties[i].OwnerId == userId){
                    component.set('v.objectOwnerProp', objectProperties[i]);
                    console.log('objectProperties[i]' + objectProperties[i]);
                    break;
                }
            }
        }
    },
})