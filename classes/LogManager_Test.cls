@isTest
public class LogManager_Test {
    @isTest static void createLogTest() {
        LogManager.LogWrapper testWrapper = new LogWrapper();
        testWrapper.name = 'testName';
        testWrapper.message = 'testMessage';
        testWrapper.type = 'testType';        

        return LogManager.createLog(testWrapper, true);

    }
   
   
    @isTest static void getLogByIdTest(){

        Id testId = '015i00000UUvnKAAT';
        List<Log__c> logs = LogManager.getLogByIdTest(testId, 'testName');
    }

    @isTest static void getLogsByIdsTest(){

        List<Id> testIds = new List<Id>();

        testIds.add('015i00000UUvnKAAT');
        testIds.add('015i00000UUvnAAAT');
        testIds.add('015i00000UUvnUAAT');

        List<Log__c> logs = LogManager.getLogsByIds(testIds, 'testName');
    }

    @isTest static void getLogsByMessageTest(){
       
        List<Log__c> logs = LogManager.getLogsByMessage('testMessage');

    }

    @isTest static void ggetLogsByTypeTest(){
       
        List<Log__c> logs = LogManager.getLogsByType('testType');

    }
}
