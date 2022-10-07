trigger primaryContact on AccountContactRelation (after insert, after update) {
	List<AccountContactRelation> recordsToProcess = New List<AccountContactRelation>();
    List<Id> accountIds = New List<Id>();
    List<Id> contactIds = New List<Id>();
    
     if(Trigger.isAfter && (Trigger.IsInsert || Trigger.IsUpdate)) {
        for(AccountContactRelation EveryRelationshipRecord : Trigger.New) {
            if(EveryRelationshipRecord.is_Primary__c == true) {
                recordsToProcess.add(EveryRelationshipRecord);
                accountIds.add(EveryRelationshipRecord.AccountId);
                contactIds.add(EveryRelationshipRecord.ContactId);
            }
        }
    }
    
    List<AccountContactRelation> existingRecords = [SELECT id, ContactId, AccountId, is_Primary__c
                                                                  FROM AccountContactRelation
                                                                  WHERE is_Primary__c = TRUE
                                                                  AND Id !=: recordsToProcess
                                                                  AND AccountId =: accountIds];
    
    if(recordsToProcess.isEmpty())
        return;
    
    for(AccountContactRelation junctionObj :recordsToProcess ) {
            for(AccountContactRelation EveryExistingRecord : existingRecords) {
                if(junctionObj.AccountId == EveryExistingRecord.AccountId) {
                        junctionObj.addError('There is already one Primary Contact exists for this Account');
                   }
            }
        }
    
        List <AccountContactRelation> accountContactsChangedToFalse = new List <AccountContactRelation>();
        List <AccountContactRelation> accountContactsToUpdate = new List <AccountContactRelation>();
        Set <Id> ContactsChangedToFalse = new Set <Id>();
    	Map<Id,AccountContactRelation> acOldMap = new Map<Id,AccountContactRelation>();
    
    for(AccountContactRelation ac:recordsToProcess) {
        AccountContactRelation oldAccountContact = acOldMap.get(ac.Id);
        if((ac.is_Primary__c == false) && (oldAccountContact.is_Primary__c == true)) {
            accountContactsChangedToFalse.add(ac);
            ContactsChangedToFalse.add(ac.ContactId);
        }
    }
    if(accountContactsChangedToFalse.isEmpty())
        return;
     List <AccountContactRelation> accountContactsSortedByDate = new List<AccountContactRelation>();
    for(AccountContactRelation ac:accountContactsChangedToFalse) {
        for(AccountContactRelation bc:accountContactsSortedByDate) {
            if((ac.ContactId == bc.ContactId) && (ac.AccountId == bc.AccountId)) {
                bc.is_Primary__c = true;
                accountContactsToUpdate.add(bc);
                break;
            }
        }
    }
    update accountContactsToUpdate;
}