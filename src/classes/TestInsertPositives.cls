@isTest
public class TestInsertPositives {
    
    /*    
@isTest
static void testsetup () {
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
*/    
    
    
    @isTest
    static void TestInsertBuxIn() {
        BuxIn__c aaa = new BuxIn__c();
        aaa.Working_Hard__c = 1000;
        aaa.Im_Special__c = 1000;
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
        aaa.BudgetLifeOrDeath__c = 2000;
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
            System.assertEquals(1000, zzz.BoxYOLO__c);
        }
    }
}