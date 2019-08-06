public class BuxInHandler {
    
    // declare list of most recent budget amounts
    public decimal tempMostRecentBudgetLifeOrDeath;
    public decimal tempMostRecentBudgetYOLO;
    
    // declare list of most recent balances
    public List<BuxBalance__c> tempListMostRecentBuxBalance;
    public decimal tempMostRecentBalanceTotal;
    public decimal tempMostRecentBalanceLifeOrDeath;
    public decimal tempMostRecentBalanceYOLO;
    public decimal tempMostRecentBalanceWorkingHard;
    public decimal tempMostRecentBalanceGoodToBeMe;
    
    
    
    // constructor
    public BuxInHandler() { 
        // select most recent record for balances
        tempListMostRecentBuxBalance = [SELECT Id FROM BuxBalance__c ORDER BY LastModifiedDate LIMIT 1];
        system.debug('From BuxHandler contructor: ' + tempListMostRecentBuxBalance);
        // if no previous records, insert default first record
        if (tempListMostRecentBuxBalance.size() == 0) {
            insertFirstBuxBalanceRecord();
            }
        // go to body of handler
        performCalculations();
    }


    // method to insert first record with default values
    public void insertFirstBuxBalanceRecord() {
        // make a temp first BuxBalance record
        BuxBalance__c tempFirstBuxBalance = new BuxBalance__c();
        // set default values for fist BuxBalance record
        tempFirstBuxBalance.Balance_Life_Or_Death__c = 1500;
        tempFirstBuxBalance.Balance_YOLO__c = 500;
        tempFirstBuxBalance.Balance_Working_Hard__c = 0;
        tempFirstBuxBalance.Balance_Being_Special__c = 0;
        tempFirstBuxBalance.BalanceTotal__c = 0;
        // insert first BuxBalance record
        insert tempFirstBuxBalance;
    }
    
        
        // body of handler
    public void performCalculations() {
        // insert new record 
    }
        
        


}