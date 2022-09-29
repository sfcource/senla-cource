@isTest
public class DealManager_Test {    
    
        @isTest static void createDealTest() {
            DealManager.DealWrapper testWrapper = new DealWrapper();
            testWrapper.name = 'testName';
            testWrapper.customer = 'testCustomer';
            testWrapper.seller = 'testSeller';
            testWrapper.amount = 550.0;
            testWrapper.numberOfMonthsLease = 30;            
    
            return DealManager.createDeal(testWrapper, true);    
        }       
       
        @isTest static void getDealsByIdTest(){
    
            Id testId = '005i0000085G3VAAU';
            List<Deal__c> deals = DealManager.getDealById(testId, 'testName');
        }
    
        @isTest static void getDealsByIdsTest(){
    
            List<Id> testIds = new List<Id>();
    
            testIds.add('005i0000085G3VAAU');
            testIds.add('005i0000085G3gAAE');
            testIds.add('005i0000085G3VAAE');
    
            List<Deal__c> deals = DealManager.getDealsById(testIds, 'testName');
        }
    
        @isTest static void getDealsByAmountTest(){
           
            List<Deal__c> deals = DealManager.getDealsByAmount(450,0);
        }
    
}
