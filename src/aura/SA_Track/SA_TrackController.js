({
    onTrackClick : function(component, event, helper) {
        console.log('onTrackClick');
        let trackId = component.get("v.id");
        console.log('onTrackClick: ' + trackId);
        helper.handleSearch(component, trackId);
    },

    onMouseOver : function(component, event, helper){
        var track = component.find('trackOver');
        $A.util.addClass(track,'focused');
    },

    onMouseOut : function(component, event, helper){
        var track = component.find('trackOver');
        $A.util.removeClass(track,'focused');
    },
})