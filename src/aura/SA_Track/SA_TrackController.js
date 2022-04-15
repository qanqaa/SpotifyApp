({
    onTrackClick : function(component, event, helper) {
        let trackId = component.get("v.id");
        helper.handleSearch(component, trackId);
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