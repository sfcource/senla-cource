@isTest
public  class PropertyManager_Test {
    
    @isTest static void createPropertyTest() {
       
        PropertyManager.PropertyWrapper testWrapper = new PropertyWrapper();
        testWrapper.name = 'testName';
        testWrapper.address = 'testAddress';
        testWrapper.leasePrice = 500.0;
        testWrapper.salePrice = 1000.0;        

        return PropertyManager.createProperty(testWrapper, true);
    }
   
   
    @isTest static void getPropertyByIdTest(){

        Id testId = '015i00000UUvnKAAT';
        List<Property__c> properties = PropertyManager.getPropertyById(testId, 'testName');
    }

    @isTest static void getPropertiesByIdsTest(){

        List<Id> testIds = new List<Id>();

        testIds.add('015i00000UUvnKAAT');
        testIds.add('015i00000UUvnAAAT');
        testIds.add('015i00000UUvnUAAT');

        List<Property__c> properties = PropertyManager.getPropertiesByIds(testIds, 'testName');
    }

    @isTest static void getPropertiesByAdressTest(){
       
        List<Property__c> propertiess = PropertyManager.getPropertiesByAdress('testAddress');

    }
}
