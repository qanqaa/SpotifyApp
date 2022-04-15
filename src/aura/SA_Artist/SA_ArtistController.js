({
    onArtistClick : function(component, event, helper) {
        console.log('onArtistClick');
        let artistId = component.get("v.id");
        console.log('onArtistClick: ' + artistId);
        helper.handleSearch(component, artistId);
    },

    onMouseOver : function(component, event, helper){
        var itemImage = component.find('itemImage');
        $A.util.addClass(itemImage,'imageHover');
    },

    onMouseOut : function(component, event, helper){
        var itemImage = component.find('itemImage');
        $A.util.removeClass(itemImage,'imageHover');
    },

    doInit : function(component, event, helper){
        var img = component.find('itemImage');
        $A.util.addClass(img,'itemImage');
    },
})