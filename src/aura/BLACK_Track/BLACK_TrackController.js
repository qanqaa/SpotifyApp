({
     onTrackClick : function(component, event, helper) {
         let trackId = component.get("v.id");
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