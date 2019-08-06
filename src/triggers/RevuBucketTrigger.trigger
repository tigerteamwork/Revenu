trigger RevuBucketTrigger on RevuBucket__c (before insert) { 
    
    	for (RevuBucket__c argBucket : trigger.new) {
            
            if (argBucket.revuLifeOrDeathBucketAmount__c != null) {
                RevuStaticBuxBoxes.setBuxBoxLifeOrDeath (argbucket.revuLifeOrDeathBucketAmount__c);
            }
            
            if (argbucket.revuYouOnlyLiveOnceBucketAmount__c != null) {
                RevuStaticBuxBoxes.setBuxBoxYouOnlyLiveOnce (argbucket.revuYouOnlyLiveOnceBucketAmount__c);
            }
  		}
      
}