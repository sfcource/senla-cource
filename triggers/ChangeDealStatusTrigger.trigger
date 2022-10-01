Trigger ChangeDealStatusTrigger on Deal__c (after update) {
    
    List<Deal__c> dealForUpdate = new List<Deal__c>();
    List<Id> ids = new List<Id>();
    Id recortTypeId = SObjectType.Deal__c.getRecordTypeInfosByDeveloperName().get('Sale').getRecordTypeId();
    for (Deal__c deal : Trigger.New){
        
        Deal__c oldDeal = Trigger.oldMap.get(deal.Id);
        
        Boolean oldDealIsWon = oldDeal.Status__c.equals('Closed Won');
        Boolean newDealIsWon = deal.Status__c.equals('Closed Won');
        
        
        if (!oldDealIsWon && newDealIsWon && deal.RecordTypeId == recortTypeId) {
            
          ids.add(deal.Id);
    }
}        
        
    List<Property__c> propertiesWhithDeals = [SELECT id, (SELECT Id, Status__c FROM Deals__r 
                                      WHERE Status__c != 'Closed Won' 
                                      AND Status__c != 'Closed Lost'                                                          
                                      AND Id IN:ids) FROM Property__c]; 
    
    
    for (Property__c property : propertiesWhithDeals){
        
        dealForUpdate.add(property.Deals__r);
  
    }
    
    for(Deal__c deal : dealForUpdate){
        
        deal.Status__c = 'Closed Lost';
    }

    
    if (dealForUpdate.size() > 0) {
        update dealForUpdate;
    }
    
}