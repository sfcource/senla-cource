@IsTest
public class TestDataFactory {
    public static Contact createContact(String lastName, String phone) {
        Contact c = new Contact(LastName = lastName, Phone = phone);
        insert c;
        return c;
    }

    public static List<Contact> createContacts(Integer num) {
        List<Contact> contacts = new List<Contact>(num);
        for (Integer i = 0; i < num; i++) {
            contacts[i] = new Contact(LastName = 'Test' + i, Phone = '+375-29-1234567');
        }
        insert contacts;
        return contacts;
    }

    public static Deal__c createDeal(Property__c property, String customer) {
        Deal__c deal = new Deal__c(Property__c = property, PropertyId__c = property.Id, Customer__c = customer);
        insert deal;
        return deal;
    }

    public static Property__c createProperty(Contact contact, Double salePrice, String address) {
        Property__c property = new Property__c(Contact = contact, ContactId = contact.Id, Sale_Price__c = salePrice);
        insert property;
        return property;
    }



}
