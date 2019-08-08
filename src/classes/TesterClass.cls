@isTest
public class TesterClass {
    
    @testSetup
    static void testsetup () {
        
        system.debug('testing');
        
        BuxBalance__c zzz111 = new BuxBalance__c();
        zzz111.BalanceTotal__c = 0;
        zzz111.Balance_Life_Or_Death__c = 0;
        zzz111.Balance_Life_Or_Death__c = 0;
        zzz111.Balance_Working_Hard__c = 0;
        zzz111.Balance_Being_Special__c = 0;
        zzz111.BoxLiveOrDie__c = 0;
        zzz111.BoxYOLO__c = 0;
        insert zzz111;
        
        BuxBox__c zzz112 = new Buxbox__c();
        zzz112.BudgetLifeOrDeath__c = 0;
        zzz112.BudgetYOLO__c = 0;
        insert zzz112;
        
        BuxIn__c zzz113 = new BuxIn__c();
        zzz113.Working_Hard__c = 0;
        zzz113.Im_Special__c = 0;
        insert zzz113;
        
        BuxOut__c zzz114 = new BuxOut__c();
        zzz114.LifeOrDeath__c = 0;
        zzz114.YOLO__c = 0;
        insert zzz114;
    }
    
    
    
    @isTest
    static void TestInsertBuxIn() {
        
        system.debug('testing');
        
        BuxIn__c aaa = new BuxIn__c();
        aaa.Working_Hard__c = 1000;
        aaa.Im_Special__c =1000;
        aaa.Date__c = date.today();
        
        insert aaa;
        
            List<BuxBalance__c> zzzList = [SELECT BalanceTotal__c, 
                                           Balance_Life_Or_Death__c, 
                                           Balance_Yolo__c,
                                           Balance_Working_Hard__c, 
                                           Balance_Being_Special__c, 
                                           BoxLiveOrDie__c, 
                                           BoxYOLO__c
                                           FROM BuxBalance__c 
                                           LIMIT 1];
            for (BuxBalance__c zzz : zzzList) {
                System.assertEquals(2000, zzz.BalanceTotal__c);
            }
    }
    
    
    
    @isTest
    static void TestInsertBuxOut() {
        BuxOut__c aaa = new BuxOut__c();
        aaa.LifeOrDeath__c = 1000;
        aaa.YOLO__c = 1000;
        aaa.Date__c = date.today();
        
        insert aaa;
        
            List<BuxBalance__c> zzzList = [SELECT BalanceTotal__c, 
                                           Balance_Life_Or_Death__c, 
                                           Balance_Yolo__c,
                                           Balance_Working_Hard__c, 
                                           Balance_Being_Special__c, 
                                           BoxLiveOrDie__c, 
                                           BoxYOLO__c
                                           FROM BuxBalance__c 
                                           LIMIT 1];
            for (BuxBalance__c zzz : zzzList) {
                System.assertEquals(-2000, zzz.BalanceTotal__c);
            }
    }
    
    
    
    @isTest
    static void TestInsertBuxBox() {
        BuxBox__c aaa = new BuxBox__c();
        aaa.BudgetLifeOrDeath__c = 1000;
        aaa.BudgetYOLO__c = 1000;
        
        insert aaa;
        
            List<BuxBalance__c> zzzList = [SELECT BalanceTotal__c, 
                                           Balance_Life_Or_Death__c, 
                                           Balance_Yolo__c,
                                           Balance_Working_Hard__c, 
                                           Balance_Being_Special__c, 
                                           BoxLiveOrDie__c, 
                                           BoxYOLO__c
                                           FROM BuxBalance__c 
                                           LIMIT 1];
            for (BuxBalance__c zzz : zzzList) {
                System.assertEquals(0, zzz.BoxYOLO__c);
            }
    }
    
    
    /*    
@isTest
static void TestUpdateBuxIn() {
BuxIn__c aaa = [SELECT Working_Hard__c, Im_Special__c, Date__c FROM BuxIn__c];
aaa.Working_Hard__c = 1000;
aaa.Im_Special__c = 1000;
aaa.Date__c = date.today();

update aaa;

BuxIn__c zzz = [SELECT Working_Hard__c, Im_Special__c, Date__c FROM BuxIn__c];
System.assertEquals(aaa.Im_Special__c, zzz.Im_Special__c);
}



@isTest
static void TestUpdateBuxOut() {
BuxOut__c aaa = [SELECT LifeOrDeath__c, YOLO__c, Date__c FROM BuxOut__c];
aaa.LifeOrDeath__c = 1000;
aaa.YOLO__c = 1000;
aaa.Date__c = date.today();

update aaa;

BuxOut__c zzz = [SELECT LifeOrDeath__c, YOLO__c, Date__c FROM BuxOut__c];
System.assertEquals(aaa.YOLO__C, zzz.YOLO__c);
}



@isTest
static void TestUpdateBuxBox() {
BuxBox__c aaa = [SELECT BudgetLifeOrDeath__c, BudgetYOLO__c FROM BuxBox__c];
aaa.BudgetLifeOrDeath__c = 2000;
aaa.BudgetYOLO__c = 1000;

Test.startTest();
update aaa;
Test.stopTest();

BuxBox__c zzz = [SELECT BudgetLifeOrDeath__c, BudgetYOLO__c FROM BuxBox__c];
System.assertEquals(aaa.BudgetLifeOrDeath__c, zzz.budgetYOLO__c);
}
*/    
    
    @isTest
    static void TestUpdateBuxIn() {
        List<BuxIn__c> aaaList = [SELECT Working_Hard__c, Im_Special__c, Date__c FROM BuxIn__c LIMIT 1];
        for (BuxIn__c aaa: aaaList) {
            
            aaa.Working_Hard__c = 1000;
            aaa.Im_Special__c = 1000;
            aaa.Date__c = date.today();
            
            update aaa;
            
            List<BuxBalance__c> zzzList = [SELECT BalanceTotal__c, 
                                           Balance_Life_Or_Death__c, 
                                           Balance_Yolo__c,
                                           Balance_Working_Hard__c, 
                                           Balance_Being_Special__c, 
                                           BoxLiveOrDie__c, 
                                           BoxYOLO__c
                                           FROM BuxBalance__c 
                                           LIMIT 1];
            for (BuxBalance__c zzz : zzzList) {
                System.assertEquals(2000, zzz.BalanceTotal__c);
            }
        }
    }
    
    
    
    @isTest
    static void TestUpdateBuxOut() {
        List<BuxOut__c> aaaList = [SELECT LifeOrDeath__c, YOLO__c, Date__c FROM BuxOut__c LIMIT 1];
        for (BuxOut__c aaa : aaaList) {
            aaa.LifeOrDeath__c = 1000;
            aaa.YOLO__c = 1000;
            aaa.Date__c = date.today();  
            
            update aaa;
            
            List<BuxBalance__c> zzzList = [SELECT BalanceTotal__c, 
                                           Balance_Life_Or_Death__c, 
                                           Balance_Yolo__c,
                                           Balance_Working_Hard__c, 
                                           Balance_Being_Special__c, 
                                           BoxLiveOrDie__c, 
                                           BoxYOLO__c
                                           FROM BuxBalance__c 
                                           LIMIT 1];
            for (BuxBalance__c zzz : zzzList) {
                System.assertEquals(-2000, zzz.BalanceTotal__c);
            }
        }
    }
    
    
/*    
    @isTest
    static void TestUpdateBuxBox() {
        List<BuxBox__c> aaaList = [SELECT BudgetLifeOrDeath__c, BudgetYOLO__c FROM BuxBox__c LIMIT 1];
        for (BuxBox__c aaa : aaaList) {
            aaa.BudgetLifeOrDeath__c = 2000;
            aaa.BudgetYOLO__c = 1000;
            
            update aaa;
            
            List<BuxBalance__c> zzzList = [SELECT BalanceTotal__c, 
                                           Balance_Life_Or_Death__c, 
                                           Balance_Yolo__c,
                                           Balance_Working_Hard__c, 
                                           Balance_Being_Special__c, 
                                           BoxLiveOrDie__c, 
                                           BoxYOLO__c
                                           FROM BuxBalance__c 
                                           LIMIT 1];
            for (BuxBalance__c zzz : zzzList) {
                System.assertEquals(1000, zzz.BoxYOLO__c);
            }
        }
    }
*/    

}