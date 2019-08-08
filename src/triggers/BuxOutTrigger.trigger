trigger BuxOutTrigger on BuxOut__c (before insert, before update, before delete) {
    
    // if isInsert
    if (trigger.isInsert) {
        for (BuxOut__c bb : trigger.new) {         
            validateInput(bb);           
            BuxHelperClass.subtractBoxOut (bb.LifeOrDeath__c, bb.YOLO__c, userInfo.getUserId(), bb.Date__c);
        }
    }
    
    // if isUpdate
    if (trigger.isUpdate) {
        for (BuxOut__c bb : trigger.new) {        
            validateInput(bb);
            // check if BuxOut is for current month
            // if (bb.Date__c.month() == Date.today().month() ) {}
            // todo    
            // currently user cannot update
        }   
    }
    
    // if isDelete
    if (trigger.isDelete) {
        for (BuxOut__c bb : trigger.old) {        
            // validateInput(bb);
            // check if BuxOut is for current month
            // if (bb.Date__c.month() == Date.today().month() ) {}
            // todo    
            // currently user cannot delete  
        }   
    }
    
    
    
    public void validateInput (BuxOut__c bb) {        
        if (bb.YOLO__c == null) {
            bb.YOLO__c = 0;
        } else if (bb.YOLO__c < 0) {
            bb.addError ('Amount cannot be less than 0.');
        }
        
        if (bb.LifeOrDeath__c == null) {
            bb.LifeOrDeath__c = 0;
        } else if (bb.LifeOrDeath__c < 0) {
            bb.addError ('Amount cannot be less than 0.');
        }
        
        if (bb.date__c > date.today()) {
            bb.addError ('Date cannot be a future date.');
        }
    }    
}