public class RevuStaticBuxBoxes {
    
    private static Decimal buxBoxBalance;
    private static Decimal buxBoxLifeOrDeath;
    private static Decimal buxBoxYouOnlyLiveOnce;
    
    static {
        
		buxBoxLifeOrDeath = [select RevuLifeOrDeathBucketAmount__c from RevuBucket__c order by lastmodifieddate desc limit 1].RevuLifeOrDeathBucketAmount__c;
        
        if (buxBoxBalance == null) {
            buxBoxBalance = 0;
        }
        
        if (buxBoxLifeOrDeath == null) {
            buxBoxLifeOrDeath = 2500;
        }
        
        if (buxBoxYouOnlyLiveOnce == null) {
            buxBoxYouOnlyLiveOnce = 500;
        }
        
        system.debug('buxBoxBalance:  ' + buxBoxBalance);
        system.debug('buxBoxLifeOrDeath:  ' + buxBoxLifeOrDeath);
        system.debug('buxBoxYouOnlyLiveOnce:  ' + buxBoxYouOnlyLiveOnce);
       
    }
    
    public static void printBoxes () {     
        system.debug('buxBoxBalance:  ' + buxBoxBalance);
        system.debug('buxBoxLifeOrDeath:  ' + buxBoxLifeOrDeath);
        system.debug('buxBoxYouOnlyLiveOnce:  ' + buxBoxYouOnlyLiveOnce);
    }

    public static void setBuxBoxBalance (Decimal arg) {
        buxBoxBalance = arg;
        system.debug('buxBoxBalance:  ' + buxBoxBalance);
    }
    
   	public static void setBuxBoxLifeOrDeath (Decimal arg) {
        buxBoxLifeOrDeath = arg;
        system.debug('buxBoxLifeOrDeath:  ' + buxBoxLifeOrDeath);
    }
    
  	public static void setBuxBoxYouOnlyLiveOnce (Decimal arg) {
        buxBoxYouOnlyLiveOnce = arg;
        system.debug('buxBoxYouOnlyLiveOnce:  ' + buxBoxYouOnlyLiveOnce);
    }
    
    public static Decimal addToBuxBoxBalance (Decimal arg) {
        buxBoxBalance += arg;
        system.debug('buxBoxBalance:  ' + buxBoxBalance);
        return buxBoxBalance;
    }
    

}