trigger RevuBuxActionTrigger on RevuBuxAction__c (before insert) {
    
    for (RevuBuxAction__c rbAction : trigger.new) {
        if (rbAction.payday__c == true && rbAction.YouDontWantToKnowHowMuch__c > 0) {
            rbAction.RevuBuxBalance__c = RevuBuckets.addToBuxBalance (rbAction.YouDontWantToKnowHowMuch__c);
        }
    }

}