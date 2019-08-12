trigger BuxBoxTrigger on BuxBox__c (before insert, before update, before delete) {
    
    // if isInsert
    if (trigger.isInsert) {
        for (BuxBox__c bb : trigger.new) {        
            validateInput(bb);
            BuxHelperClass.setNewBoxSize(bb.BudgetLifeOrDeath__c, bb.BudgetYOLO__c, userInfo.getUserId());          
        }   
    }
    
    // if isUpdate
    if (trigger.isUpdate) {
        for (BuxBox__c bb : trigger.new) {        
            bb.addError('Make a new BuxBox and the old one will be deleted.');
        }   
    }
    
    // if isDelete
    if (trigger.isDelete) {
        for (BuxBox__c bb : trigger.new) {      
            bb.addError('Make a new BuxBox and the old one will be deleted.');
        }   
    }
    
    
    
    public void validateInput(BuxBox__c bb) {        
        if (bb.BudgetYOLO__c == null) {
            bb.BudgetYOLO__c = 0;
        } else if (bb.BudgetYOLO__c < 0) {
            bb.addError ('Amount cannot be less than 0.');
        }
        
        if (bb.BudgetLifeOrDeath__c == null) {
            bb.BudgetLifeOrDeath__c = 0;
        } else if (bb.budgetLifeOrDeath__c < 0) {
            bb.addError ('Amount cannot be less than 0.');
        }        
    }    
}