trigger BuxBalanceTrigger on BuxBalance__c (before insert) {
    
    // call handler 
    // BuxBalanceHandler myHandler = new BuxBalanceHandler();
    
    for (BuxBalance__c bb : trigger.new) {       
        validateInput(bb);
    }    
    
    public void validateInput(BuxBalance__c bb) {
        if (bb.balanceTotal__c == null) {
            bb.balanceTotal__c = 0;
        }
        
        if (bb.balance_YOLO__c == null) {
            bb.balance_YOLO__c = 0;
        }
        
        if (bb.balance_Life_Or_Death__c == null) {
            bb.balance_Life_Or_Death__c = 0;
        }        
        
        if (bb.Balance_Working_Hard__c == null) {
            bb.Balance_Working_Hard__c = 0;
        }
        
        if (bb.Balance_Being_Special__c == null) {
            bb.Balance_Being_Special__c = 0;
        }
        
    }
    
    
    
    
}