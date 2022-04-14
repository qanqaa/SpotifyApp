({
    /*getComments: function(component, event, objectId) {
        let actionComment = component.get("c.getObjectSpotifyProperties");
        actionComment.setParams({
            objectId: objectId
        });
        console.log('objectId' + objectId);

        actionComment.setCallback(this, $A.getCallback(function(response) {
            var userId = $A.get("$SObjectType.CurrentUser.Id");
            Console.log(userId);
            let str = response.getReturnValue();
            for(let i = 0; i < str.length; i++){
                if(str[i].OwnerId == userId){
                    component.set('v.showInput', false);
                    break;
                }
            }
        }));
        $A.enqueueAction(actionComment);
    },*/

    /*getComments: function(component, event, objectId) {
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
                        var userId = $A.get("$SObjectType.CurrentUser.Id");
                        component.set('v.userId', userId);
                        for(let i = 0; i < propertiesInfo.length; i++){
                            if(isEmpty(propertiesInfo[i].Rating__c)){
                                propertiesInfo[i].Rating__c = 0;
                            }
                            if(!isEmpty(propertiesInfo[i].Comment_c) || !isEmpty(propertiesInfo[i].Rating__c) || propertiesInfo[i].Rating__c>0){
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
        }*/

        getComments: function(component, event, objectId) {
                let actionComment = component.get("c.getObjectSpotifyProperties");
                actionComment.setParams({
                    objectId: objectId
                });
                console.log('siemankoooooo');
                actionComment.setCallback(this, $A.getCallback(function(response) {
                    let state = response.getState();
                    switch(state){
                        case "SUCCESS":
                            console.log(response.getReturnValue());

                            let propertiesInfo = response.getReturnValue();
                            console.log(propertiesInfo);

                            component.set("v.objectProperties", propertiesInfo);

                            var commentsToDisplay = [];
                            var userId = $A.get("$SObjectType.CurrentUser.Id");
                            component.set("v.userId", userId);

                            console.log('CO JEST NOOOOOOOOOOOOOOOOOOOOOOOOOOO');
                            console.log(propertiesInfo.length);
                            for(let i = 0; i < propertiesInfo.length; i++){
                                /*if(isEmpty(propertiesInfo[i].Rating__c) || propertiesInfo[i].Rating__c == ''){
                                    propertiesInfo[i].Rating__c = 0;
                                    console.log('ZERUJE');

                                }
                                    console.log('A MOZE TUTAJ');

                                if(!isEmpty(propertiesInfo[i].Comment_c) || !isEmpty(propertiesInfo[i].Rating__c) || propertiesInfo[i].Rating__c>0){
                                    commentsToDisplay.push(propertiesInfo[i]);
                                    console.log('PRZEPYCHA');

                                }*/
                                console.log(propertiesInfo[i].OwnerId);
                                console.log(userId);
                                if(propertiesInfo[i].OwnerId === userId){
                                console.log('SA TE SAME ID');
                                    component.set('v.objectOwnerProperty', propertiesInfo[i]);
                                }
                            }
                            //component.set("v.objectProperties", commentsToDisplay);
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