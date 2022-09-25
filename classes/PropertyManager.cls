public class PropertyManager {
    
    public static final Integer MIN_SALE_PRICE = '1500';
    public static final Integer MIN_LEASE_PRICE = '100';
    
    public static String fields = 
       'Id, Address__c, Lease_Price_per_Month__c, Property_Owner__c, RecordTypeId, Sale_Price__c, \n' +
       '(select id, Amount__c, Number_of_Months_Lease__c, Property_Adress__c, RecordTypeId from Deal__r)';


       public class PropertyWrapper {
        public String name {get; set;}
        public String address {get; set;}
        public Double leasePrice {get; set;}
        public Double salePrice {get; set;}
        
    }

    public static Property__c createProperty(PropertyWrapper wrapper, Boolean serialize) {
        Property__c property = new Property__c();
        property.Name = wrapper.name;
        property.Address__c = wrapper.address;
        property.Lease_Price_per_Month__c = wrapper.leasePrice;
        property.Sale_Price__c = wrapper.salePrice;

 
        if (serialize) insert property;
 
        return property;
    }
 
 

    public static List<Property__c> getPropertiesByIds(List<Id> ids, String fields){

        String query = 'select ' + fields + ' from Property__c where Id in :ids';
        List<Property__c> properties = Database.query(query);
        return properties;
    } 
    
    public static Property__c getPropertyById(Id propertyId, String fields){

        String query = 'select ' + fields + ' from Property__c where Id=:propertyId';
        Property__c property = Database.query(query);
        return property;
    }
    
    public static List<Property__c> getPropertiesByAdress(String address){

        String query = 'select ' + fields + ' from Property__c where Adress__c=:address';
        List<Property__c> properties = Database.query(query);
        return properties;
    } 
   
    
 
}
 
 
 

    

