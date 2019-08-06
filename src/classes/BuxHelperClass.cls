public class BuxHelperClass {
    
    public static void checkForNullRecord() {  
        // select most recent record for BuxBalance
        List<BuxBalance__c> tempListMostRecentBuxBalance = [SELECT Id, Balance_Life_Or_Death__c, Balance_YOLO__c, BalanceTotal__c, Balance_Working_Hard__c, Balance_Being_Special__c FROM BuxBalance__c ORDER BY LastModifiedDate LIMIT 1];
        // if no previous records, insert default first record
        if (tempListMostRecentBuxBalance.size() == 0) {
            // make a temp first BuxBalance record
            BuxBalance__c tempFirstBuxBalance = new BuxBalance__c();
            // set default values for fist BuxBalance record
            tempFirstBuxBalance.Balance_Life_Or_Death__c = 0;
            tempFirstBuxBalance.Balance_YOLO__c = 0;
            tempFirstBuxBalance.Balance_Working_Hard__c = 0;
            tempFirstBuxBalance.Balance_Being_Special__c = 0;
            tempFirstBuxBalance.BalanceTotal__c = 0;
            // insert first BuxBalance record
            insert tempFirstBuxBalance;
        }
/*        
        // select most recent record for BuxBox
        List<BuxBox__c> tempListMostRecentBuxBox = [SELECT Id, BudgetLifeOrDeath__c, BudgetYOLO__c FROM BuxBox__c ORDER BY LastModifiedDate LIMIT 1];
        // if no previous records, insert default first record
        if (tempListMostRecentBuxBox.size() == 0) {
            // make a temp first BuxBalance record
            BuxBox__c tempFirstBuxBox = new BuxBox__c();
            // set default values for fist BuxBalance record
            tempFirstBuxBox.BudgetLifeOrDeath__c = 2000;
            tempFirstBuxBox.BudgetYOLO__c = 500;
            // insert first BuxBalance record
            insert tempFirstBuxBox;
        }
*/
    }
    
    
    
    public static void addToBoxWorkingHard(Decimal arg) {
        checkForNullRecord();   
    }
    
    public static void addToBoxImSpecial (Decimal arg) {
        checkForNullRecord();        
    }
    
    public static void subtractFromYOLO(Decimal arg){
        checkForNullRecord();
    }
    
    public static void subtractFromLifeOrDeath (Decimal arg) {
        checkForNullRecord();
    }
    
    public static void useNewYoloLimit(Decimal arg) {
        checkForNullRecord();
    }         
    public static void useNewLifeOrDeathLimit(Decimal arg) {
        checkForNullRecord();
    }
    
    
    
/*    
            // declare variables for balances
        List<BuxBalance__c> tempListMostRecentBuxBalance;
        decimal tempMostRecentBalanceTotal;
        decimal tempMostRecentBalanceLifeOrDeath;
        decimal tempMostRecentBalanceYOLO;
        decimal tempMostRecentBalanceWorkingHard;
        decimal tempMostRecentBalanceGoodToBeMe;

*/
    
    
    
}