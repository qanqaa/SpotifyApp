({
    showSpinner: function(component, event, helper) {
        component.set('v.spinnerVisible', true);
        console.log('spinner visible true');
    },

    hideSpinner: function(component, event, helper) {
        component.set('v.spinnerVisible', false);
        console.log('spinner visible false');
    }
})