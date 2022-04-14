({
    doInit: function(component, event, helper) {
    console.log(component.get("v.propertyItem.isFavourite__c"));
    console.log(component.get("v.propertyItem.isBlack__c"));

       if(component.get("v.propertyItem.isFavourite__c") !== undefined) {
            component.set("v.liked", component.get("v.propertyItem.isFavourite__c"));
       }

       if(component.get("v.propertyItem.isBlack__c") !== undefined) {
            component.set("v.disliked", component.get("v.propertyItem.isBlack__c"));
       }
    },

    handleLikeButtonClick : function (component) {
        let action;
        if(component.get('v.liked')) {
            action = component.get("c.removeFromFavourite");
        } else {
            action = component.get("c.addToFavourite");
        }
        action.setParams(
            {
                propertyId: component.get('v.propertyItem.id'),
                id: component.get("v.item.id"),
                title: component.get("v.item.name"),
                imageURL: component.get("v.item.imageURL")
            }
        );

        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set('v.liked', !component.get('v.liked'));
            }
        });

        $A.enqueueAction(action);
    },

    handleDislikeButtonClick : function (component) {
        let action;
        if(component.get('v.disliked')) {
            action = component.get("c.removeFromDisliked");
        } else {
            action = component.get("c.addToDisliked");
        }

        action.setParams(
            {
                propertyId: component.get('v.propertyItem.id'),
                id: component.get("v.item.id"),
                title: component.get("v.item.name"),
                imageURL: component.get("v.item.imageURL")
            }
        );

        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set('v.disliked', !component.get('v.disliked'));
            }
        });

        $A.enqueueAction(action);
    },
})