trigger BuxInTrigger on BuxIn__c (before insert) {
    
    // call handler
    // BuxInHandler myHandler = new BuxInHandler();
    
    for (BuxIn__c bb : trigger.new) {        
        
        validateInput(bb);      
        
        if (bb.Working_Hard__c != 0) {
            BuxHelperClass.addToBoxWorkingHard(bb.Working_Hard__c);
        }
        
        if (bb.Im_Special__c != 0) {
            BuxHelperClass.addToBoxImSpecial (bb.Im_Special__c);
        }        
    }
    
    
    
    public void validateInput (BuxIn__c bb) {        
        if (bb.Im_Special__c == null) {
            bb.Im_Special__c = 0;
        } else if (bb.Im_Special__c < 0) {
            bb.Im_Special__c = 0;
        }
        
        if (bb.Working_Hard__c == null) {
            bb.Working_Hard__c = 0;
        } else if (bb.Working_Hard__c < 0) {
            bb.Working_Hard__c = 0;
        }
        
        if (bb.date__c > date.today()) {
            bb.date__c = date.today();
        }
    }
}