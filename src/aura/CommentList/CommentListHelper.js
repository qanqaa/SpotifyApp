({
    getComments: function(component, event, objectId) {
        let actionComment = component.get("c.getObjectSpotifyProperties");
        actionComment.setParams({
            objectId: objectId
        });

        actionComment.setCallback(this, $A.getCallback(function(response) {
            let state = response.getState();
            switch(state){
                case "SUCCESS":
                    let propertiesInfo = response.getReturnValue();
                    component.set("v.propertiesInfo", propertiesInfo);

                    var commentsToDisplay = [];
                    let isUserCommentExist = false;
                    var userId = $A.get("$SObjectType.CurrentUser.Id");
                    console.log(userId);
                    console.log(propertiesInfo.length);


                    for(let i = 0; i < propertiesInfo.length; i++){
                        if(!propertiesInfo[i].Rating__c){
                            propertiesInfo[i].Rating__c = 0;
                        }
                        if(propertiesInfo[i].Comment_c != '' || propertiesInfo[i].Rating__c != ''){
                            commentsToDisplay.push(propertiesInfo[i]);
                        }
                    }
                    component.set("v.propertiesInfo", propertiesInfo);
                    break;

                case "INCOMPLETE":
                    break;

                case "ERROR":
                    break;
            }
        }));
        $A.enqueueAction(actionComment);
    },
})