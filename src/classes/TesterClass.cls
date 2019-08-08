@isTest
public class TesterClass {
    
    static testMethod void TestInsertBuxIn() {
        BuxIn__c aaa = new BuxIn__c();
        aaa.Working_Hard__c = -5000;
        aaa.Im_Special__c = -500;
        aaa.Date__c = date.today()+65000;
        
        Test.startTest();
        insert aaa;
        Test.stopTest();
        
        BuxIn__c zzz = [SELECT Working_Hard__c, Im_Special__c, Date__c FROM BuxIn__c];
        System.assertEquals(aaa.Im_Special__c, zzz.Im_Special__c);
    }
    
    
    
    static testMethod void TestInsertBuxOut() {
        BuxOut__c aaa = new BuxOut__c();
        aaa.LifeOrDeath__c = -5000;
        aaa.YOLO__c = -500;
        aaa.Date__c = date.today()+65000;
        
        Test.startTest();
        insert aaa;
        Test.stopTest();
        
        BuxOut__c zzz = [SELECT LifeOrDeath__c, YOLO__c, Date__c FROM BuxOut__c];
        System.assertEquals(aaa.YOLO__C, zzz.YOLO__c);
    }
    
    
    
    static testMethod void TestInsertBuxBox() {
        BuxBox__c aaa = new BuxBox__c();
        aaa.BudgetLifeOrDeath__c = -5000;
        aaa.BudgetYOLO__c = -500;
     
        Test.startTest();
        insert aaa;
        Test.stopTest();
        
        BuxBox__c zzz = [SELECT BudgetLifeOrDeath__c, BudgetYOLO__c FROM BuxBox__c];
        System.assertEquals(aaa.BudgetLifeOrDeath__c, zzz.budgetYOLO__c);
    }
    
    
}