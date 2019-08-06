trigger BuxBoxTrigger on BuxBox__c (before insert) {
    
    // call handler 
    // BuxBoxHandler myHandler = new BuxBoxHandler();
    
    for (BuxBox__c bb : trigger.new) {        
        validateInput(bb);
        BuxHelperClass.useNewYoloLimit(bb.BudgetYOLO__c);         
        BuxHelperClass.useNewLifeOrDeathLimit(bb.BudgetLifeOrDeath__c);     
    }   
    
    
    
    public void validateInput(BuxBox__c bb) {        
        if (bb.BudgetYOLO__c == null) {
            bb.BudgetYOLO__c = 0;
        } else if (bb.BudgetYOLO__c < 0) {
            bb.BudgetYOLO__c = 0;
        }
        
        if (bb.BudgetLifeOrDeath__c == null) {
            bb.BudgetLifeOrDeath__c = 0;
        } else if (bb.budgetLifeOrDeath__c < 0) {
            bb.BudgetLifeOrDeath__c = 0;
        }        
    }    
}