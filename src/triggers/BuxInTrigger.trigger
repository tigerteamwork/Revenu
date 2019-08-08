trigger BuxInTrigger on BuxIn__c (before insert, before update, before delete) {
    // if isInsert
    if (trigger.isInsert) {
        for (BuxIn__c bb : trigger.new) {        
            validateInput(bb); 
            BuxHelperClass.addBuxIn(bb.Working_Hard__c, bb.Im_Special__c, userInfo.getUserId(), bb.Date__c);     
        }
    }
    
    // if isUpdate
    if (trigger.isUpdate) {
        for (BuxIn__c bb : trigger.new) {        
            validateInput(bb);
            // add in the new incomce numbers
            BuxHelperClass.addBuxIn(bb.Working_Hard__c, bb.Im_Special__c, userInfo.getUserId(), bb.Date__c);     
        }   
        for (BuxIn__c bb : trigger.old) {
            // add back the negative of the old income numbers
            BuxHelperClass.addBuxIn(-bb.Working_Hard__c, -bb.Im_Special__c, userInfo.getUserId(), bb.Date__c);  
        }
    }
    
    // if isDelete
    if (trigger.isDelete) {
        for (BuxIn__c bb : trigger.old) {
            // add back the negative of the old income numbers
            BuxHelperClass.addBuxIn(-bb.Working_Hard__c, -bb.Im_Special__c, userInfo.getUserId(), bb.Date__c);     
        }   
    }
    
    
    
    public void validateInput (BuxIn__c bb) {        
        if (bb.Im_Special__c == null) {
            bb.Im_Special__c = 0;
        } else if (bb.Im_Special__c < 0) {
            bb.addError ('Amount cannot be less than 0.');
        }
        
        if (bb.Working_Hard__c == null) {
            bb.Working_Hard__c = 0;
        } else if (bb.Working_Hard__c < 0) {
            bb.addError ('Amount cannot be less than 0.');
        }
        
        if (bb.date__c > date.today()) {
            bb.addError ('Date cannot be future date.');
        }
    }
}