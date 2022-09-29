@isTest
public class ContactManager_Test {
    
    @isTest static void createContactTest() {
        ContactManager.ContactWrapper testWrapper = new ContactWrapper();
        testWrapper.name = 'testName';
        testWrapper.phone = '123-3123123';
        testWrapper.email = 'testEmail@gmail.com';
        testWrapper.homePhone = '445-1234';
        testWrapper.brokerPercentageOfDeal = 12.4;

        return ContactManager.createContact(testWrapper, true);
    }   
   
    @isTest static void getContactByIdTest(){
        
        Id testId = '0035i00000CMKcqAAH';
        List<Contact> cts = ContactManager.getContactById(testId, 'testName');
    }

    @isTest static void getContactsByIdsTest(){

        List<Id> testIds = new List<Id>();

        testIds.add('0035i00000CMKcqAAH');
        testIds.add('0035i00000CMKklAAH');
        testIds.add('0035i00000CMKcWAAX');

        List<Contact> cts = ContactManager.getContactById(testIds, 'testName');
    }

    @isTest static void getContactsByEmailTest(){
       
        List<Contact> cts = ContactManager.getContactsByEmail('testEmail@gmail.com');
    }

    @isTest static void getContactsByEmailsTest(){
       
        List<String> testEmails = new List<String>();
        testEmails.add('testEmails@gmail.com');
        testEmails.add('testEmails2@gmail.com');
        testEmails.add('testEmails3@gmail.com');

        List<Contact> cts = ContactManager.getContactsByEmails(testEmails);
    }
}

