public class BuxHelperClass {
    
    public static void checkForNullRecord(Id argId) {  
        // select most recent record for BuxBalance
        List<BuxBalance__c> tempListMostRecentBuxBalance = [SELECT BoxYOLO__c, BoxLiveOrDie__c, Balance_Life_Or_Death__c, Balance_YOLO__c, BalanceTotal__c, Balance_Working_Hard__c, Balance_Being_Special__c, OwnerId FROM BuxBalance__c WHERE OwnerId = :argId ORDER BY LastModifiedDate LIMIT 1];
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
            tempFirstBuxBalance.BoxYOLO__c = 0;
            tempFirstBuxBalance.BoxLiveOrDie__c = 0;
            tempFirstBuxBalance.OwnerId = argId;
            
            // insert first BuxBalance record
            insert tempFirstBuxBalance;
        }
    }
    
    
    
    public static void checkForNewMonth(Id argId) {
        // select most recent record for BuxBalance (returns 1 record)
        List<BuxBalance__c> tempListMostRecentBuxBalance = [SELECT Id, BoxYolo__c, BoxLiveOrDie__c, Balance_Life_Or_Death__c, Balance_YOLO__c, BalanceTotal__c, Balance_Working_Hard__c, Balance_Being_Special__c, OwnerId, LastModifiedDate FROM BuxBalance__c WHERE OwnerId = :argId ORDER BY LastModifiedDate LIMIT 1];
        for (BuxBalance__c bb : tempListMostRecentBuxBalance) {
            if (bb.LastModifiedDate.month() != date.today().month()) {
                // reset budget balances
                // bb.id = null;
                bb.Balance_Life_Or_Death__c = bb.boxLiveOrDie__c;
                bb.Balance_YOLO__c = bb.boxYOLO__c;
                bb.Balance_Working_Hard__c = 0;
                bb.Balance_Being_Special__c = 0;
                bb.Balance_Working_Hard__c = 0;
                bb.Balance_Being_Special__c = 0;
            }
            update tempListMostRecentBuxBalance;
        }
    }
    
    
    
    public static void addBuxIn(Decimal argWorkingHard, Decimal argImSpecial, Id argId, Date argDate) {
        checkForNullRecord(argId);  
        checkForNewMonth(argId);
        // select most recent record for BuxBalance (returns 1 record)
        List<BuxBalance__c> tempListMostRecentBuxBalance = [SELECT Id, BoxYolo__c, BoxLiveOrDie__c, Balance_Life_Or_Death__c, Balance_YOLO__c, BalanceTotal__c, Balance_Working_Hard__c, Balance_Being_Special__c, OwnerId FROM BuxBalance__c WHERE OwnerId = :argId ORDER BY LastModifiedDate LIMIT 1];
        // Add BuxIn
        for (BuxBalance__c bb : tempListMostRecentBuxBalance) {
            bb.BalanceTotal__c += argWorkingHard;
            bb.BalanceTotal__c += argImSpecial;          
            // check if BuxBuxIn is for current month
            if (argDate.month() == Date.today().month() ) {
                bb.Balance_Working_Hard__c += argWorkingHard;
                bb.Balance_Being_Special__c += argImSpecial;
            }
            // bb.Id = null;
        }
        // insert list (1 record)
        update tempListMostRecentBuxBalance;
    }
    
    
    
    public static void subtractBoxOut(Decimal argLifeOrDeath, Decimal argYOLO, Id argId, Date argDate) {
        checkForNullRecord(argId);
        checkForNewMonth(argId);
        // select most recent record for BuxBalance (returns 1 record)
        List<BuxBalance__c> tempListMostRecentBuxBalance = [SELECT Id, BoxYolo__c, BoxLiveOrDie__c, Balance_Life_Or_Death__c, Balance_YOLO__c, BalanceTotal__c, Balance_Working_Hard__c, Balance_Being_Special__c, OwnerId FROM BuxBalance__c WHERE OwnerId = :argId ORDER BY LastModifiedDate LIMIT 1];
        // subtract BuxOut
        for (BuxBalance__c bb : tempListMostRecentBuxBalance) {
            bb.BalanceTotal__c -= argLifeOrDeath;
            bb.BalanceTotal__c -= argYOLO;
            // check if BuxBuxOut is for current month
            if (argDate.month() == Date.today().month() ) {
                bb.Balance_Life_Or_Death__c -= argLifeOrDeath;
                bb.Balance_YOLO__c -= argYOLO;
            }
            //bb.Id = null;
        }
        // insert list (1 record)
        update tempListMostRecentBuxBalance;
    }
    
    
    
    public static void setNewBoxSize (Decimal argBoxLifeOrDeath, Decimal argBoxYOLO, Id argId) {
        checkForNullRecord(argId);
        checkForNewMonth(argId);
        // select most recent record for BuxBalance (returns 1 record)
        List<BuxBalance__c> tempListMostRecentBuxBalance = [SELECT Id, BoxYolo__c, BoxLiveOrDie__c, Balance_Life_Or_Death__c, Balance_YOLO__c, BalanceTotal__c, Balance_Working_Hard__c, Balance_Being_Special__c, OwnerId FROM BuxBalance__c WHERE OwnerId = :argId ORDER BY LastModifiedDate LIMIT 1];
        for (BuxBalance__c bb : tempListMostRecentBuxBalance) {
            // calculate using balances for budget boxes
            Decimal changeInSizeBoxLifeOrDeath = argBoxLifeOrDeath - bb.boxLiveOrDie__c;
            Decimal changeInSizeBoxYOLO = argBoxYOLO - bb.BoxYOLO__c;
            bb.Balance_Life_Or_Death__c += changeInSizeBoxLifeOrDeath;
            bb.Balance_YOLO__c += changeInSizeBoxYOLO;
            // set fields to new limits
            bb.BoxLiveOrDie__c = argBoxLifeOrDeath;
            bb.BoxYOLO__c = argBoxYOLO;
            //bb.Id = null;            
        }
        // insert list (1 record)
         update tempListMostRecentBuxBalance;
         
        //delete old BuxBox records 
        // List<BuxBox__c> tempListMostRecentBuxBox = [SELECT Id FROM BuxBox__c WHERE OwnerId = :argId ORDER BY LastModifiedDate];
        // delete tempListMostRecentBuxBox;
        
    }            
}