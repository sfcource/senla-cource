public class DealManager {
    
    public static String fields = 
       'Id, Amount__c, Customer__c, Lease_End_Date__c, Lease_Start_Date__c, Number_of_Months_Lease__c, \n' +
       'RecordTypeId, OwnerId, Property__c, Property_Adress__c,  Seller__c, Selling_Property__c';


       public class DealWrapper {
        public String name {get; set;}
        public Double amount {get; set;}
        public Date leaseEndDate {get; set;}
        public Date leaseStartDate {get; set;}
        public Integer numberOfMonthsLease {get; set;}
        public String customer {get; set;}
        public String seller {get; set;}
        
    }

    public static Deal__c createDeal(DealWrapper wrapper, Boolean serialize) {
        Deal__c deal = new Deal__c();
        deal.Name = wrapper.name;
        deal.Amount__c = wrapper.amount;
        deal.Lease_End_Date__c = wrapper.leaseEndDate;
        deal.Lease_Start_Date__c = wrapper.leaseStartDate;
        deal.Number_of_Months_Lease__c = wrapper.numberOfMonthsLease;
        deal.Customer__c = wrapper.customer;
        deal.Seller__c = wrapper.seller;


 
        if (serialize) insert deal;
 
        return deal;
    }
 
 

    public static List<Deal__c> getDealsByIds(List<Id> ids, String fields){

        String query = 'select ' + fields + ' from Deal__c where Id in :ids';
        List<Deal__c> deals = Database.query(query);
        return deals;
    } 
    
    public static Deal__c getDealById(Id dealId, String fields){

        String query = 'select ' + fields + ' from Deal__c where Id=:dealId';
        Deal__c deal = Database.query(query);
        return deal;
    }
    
    public static List<Deal__c> getDealsByAmount(String amount){

        String query = 'select ' + fields + ' from Deal__c where Amount__c=:amount';
        List<Deal__c> deals = Database.query(query);
        return deals;
    } 
   
    
}
