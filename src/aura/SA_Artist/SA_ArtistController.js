({
    onArtistClick : function(component, event, helper) {
        console.log('onArtistClick');
        let artistId = component.get("v.id");
        console.log('onArtistClick: ' + artistId);
        helper.handleSearch(component, artistId);
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