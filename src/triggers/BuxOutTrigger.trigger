trigger BuxOutTrigger on BuxOut__c (before insert) {
    
    // call handler 
    // BuxOutHandler myHandler = new BuxOutHandler();
    
    for (BuxOut__c bb : trigger.new) {             
        
        validateInput(bb);
        
        if (bb.YOLO__c != 0) {
            BuxHelperClass.subtractFromYOLO (bb.yolo__c);
        }
        
        if (bb.LifeOrDeath__c != 0) {
            BuxHelperClass.subtractFromLifeOrDeath (bb.lifeordeath__c);
        }
    }
    
    
    
    public void validateInput (BuxOut__c bb) {
        
        if (bb.YOLO__c == null) {
            bb.YOLO__c = 0;
        } else if (bb.YOLO__c < 0) {
            bb.YOLO__c = 0;
        }
        
        if (bb.LifeOrDeath__c == null) {
            bb.LifeOrDeath__c = 0;
        } else if (bb.LifeOrDeath__c < 0) {
            bb.LifeOrDeath__c = 0;
        }
        
        if (bb.date__c > date.today()) {
            bb.date__c = date.today();
        }
    }    
}