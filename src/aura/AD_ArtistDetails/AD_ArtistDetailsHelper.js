({
    /*showArtistDetails: function(component, event) {
        let artist = event.getParam('artist');
        if(artist){
            component.set('v.showDetails', true);
            component.set('v.artist', artist);
        }
        else {
             component.set('v.showDetails', false);
        }
    },*/

    showPropertiesSection: function(component, event) {
        let objectProperties = event.getParam('spotProp');
        var userId = $A.get("$SObjectType.CurrentUser.Id");

        console.log('userId' + userId);
        console.log('objectProperties' + objectProperties);
        console.log('objectProperties0 ' + objectProperties[0].OwnerId);
        if(objectProperties){
            for(let i = 0; i < objectProperties.length; i++){
                if(objectProperties[i].OwnerId == userId){
                    component.set('v.objectOwnerProp', objectProperties[i]);
                    console.log('objectProperties[i]' + objectProperties[i]);
                    break;
                }
            }
        }
    },

    showArtistTopTracks: function(component, event) {
        let topTracks = event.getParam('topTracks');
        if(topTracks){
            component.set('v.showTopTracks', true);
            component.set('v.topTracks', topTracks);
        }
        else {
             component.set('v.showTopTracks', false);
        }
    }
})