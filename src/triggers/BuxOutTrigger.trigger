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
            // subtract out the new expense numbers
            BuxHelperClass.subtractBoxOut (bb.LifeOrDeath__c, bb.YOLO__c, userInfo.getUserId(), bb.Date__c);
        }   
        for (BuxOut__c bb : trigger.old) { 
            // subtract out the negative of the old expense numbers 
            BuxHelperClass.subtractBoxOut (-bb.LifeOrDeath__c, -bb.YOLO__c, userInfo.getUserId(), bb.Date__c);
        }  
    }
    
    // if isDelete
    if (trigger.isDelete) {
        for (BuxOut__c bb : trigger.old) { 
            // subtract out the negative of the old expense numbers 
            BuxHelperClass.subtractBoxOut (-bb.LifeOrDeath__c, -bb.YOLO__c, userInfo.getUserId(), bb.Date__c);
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