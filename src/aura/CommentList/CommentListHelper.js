({
    getComments: function(component, event, objectId) {
        console.log('hellomdf');
        console.log('objectId' + objectId);

        let actionComment = component.get("c.getObjectSpotifyProperties");
        actionComment.setParams({
            objectId: objectId
        });
        console.log('objectId' + objectId);
        actionComment.setCallback(this, $A.getCallback(function(response) {
            let state = response.getState();
            switch(state){
                case "SUCCESS":
                    let propertiesInfo = response.getReturnValue();
                    component.set("v.propertiesInfo", propertiesInfo);

                    var commentsToDisplay = [];
                    let isUserCommentExist = false;
                    console.log('PRZED');
                    var userId = $A.get("$SObjectType.CurrentUser.Id");
                    console.log(userId);
                    console.log(propertiesInfo.length);


                    for(let i = 0; i < propertiesInfo.length; i++){
                        if(propertiesInfo[i].Comment_c != '' || propertiesInfo[i].Rating__c != ''){
                                                console.log('WCHODZI W PĘTLE');

                            commentsToDisplay.push(propertiesInfo[i]);
                            /*console.log('propertiesInfo[i] ' + propertiesInfo[i]);
                            console.log('userId ' + userId);
                            if(propertiesInfo[i].OwnerId == userId){
                                let showCommentInput = $A.get("e.c:EV_ShowCommentInput");
                                showCommentInput.setParams({
                                    "showInputComment": response.getReturnValue()
                                });
                                showCommentInput.fire();
                                console.log(response.getReturnValue());
                            }
                            console.log('dodaje');*/
                        }
                    }
                    component.set("v.propertiesInfo", commentsToDisplay);
                    console.log('UDALO SIEEEEEE' + response.getReturnValue());
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