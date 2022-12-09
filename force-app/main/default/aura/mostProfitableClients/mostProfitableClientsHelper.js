({
    doInitHelper : function(cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Client name', fieldName: 'Name', type: 'text'},
            {label: 'Email', fieldName: 'Email__c', type: 'email'},
            {label: 'Total Active Projects', fieldName: 'Total_Active_Projects__c', type: 'number'},
            {label: 'Budget', fieldName: 'Budget__c', type: 'currency', typeAttributes: { currencyCode: 'EUR', maximumSignificantDigits: 5}},
        ]);
        
        var action = cmp.get("c.fetchClients");

        action.setParams({
        });

        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS") {
                cmp.set("v.clientList", response.getReturnValue())
            }
        });

        $A.enqueueAction(action);
    }
})
