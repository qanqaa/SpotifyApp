({
    onTrackClick : function(component, event, helper) {
        console.log('onTrackClick');
        let trackId = component.get("v.id");
        console.log('onTrackClick: ' + trackId);
        helper.handleSearch(component, trackId);
    },

    UpdateColor : function(component, event, helper){
        var track = component.find('trackOver');
        $A.util.addClass(track,'greyColor');
    },
})