({
    deleteComment: function(component, event, helper) {
        /*let commentText = component.get("v.commentText");
        let rate = component.find("starRate").get("v.value");*/
        let propId = component.get("v.propId");
        console.log('propId' + propId);
        helper.deleteComment(component, event, propId);
        console.log('CO SIE DZIEJE?');
    }
})