({
    /*getComments: function(component, event, objectId) {
        let actionComment = component.get("c.getObjectSpotifyProperties");
        actionComment.setParams({
            objectId: objectId
        });
        console.log('siemankoooooo');
        actionComment.setCallback(this, $A.getCallback(function(response) {
            let state = response.getState();
            switch(state){
                case "SUCCESS":
                    let propertiesInfo = response.getReturnValue();
                    component.set("v.propertiesInfo", propertiesInfo);

                    var commentsToDisplay = [];
                    var userId = $A.get("$SObjectType.CurrentUser.Id");

                    for(let i = 0; i < propertiesInfo.length; i++){
                        if(isEmpty(propertiesInfo[i].Rating__c)){
                            propertiesInfo[i].Rating__c = 0;
                        }
                        if(!isEmpty(propertiesInfo[i].Comment_c) || !isEmpty(propertiesInfo[i].Rating__c) || propertiesInfo[i].Rating__c>0){
                            commentsToDisplay.push(propertiesInfo[i]);
                        }
                    }
                    component.set("v.propertiesInfo", commentsToDisplay);
                    break;

                case "INCOMPLETE":
                    break;

                case "ERROR":
                    break;
            }
        }));
        $A.enqueueAction(actionComment);
    },*/
})