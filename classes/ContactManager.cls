public class ContactManager {
    public static String fields = 
       'Id, Name, Phone, HomePhone, Email, Total_Property_Price__c, Broker_Percentage_of_Deal__c';
       


       public class ContactWrapper {
        public String name {get; set;}
        public String phone {get; set;}
        public String homePhone {get; set;}
        public String email  {get; set;}
        public Double brokerPercentageOfDeal {get; set;}
                
    }

    public static Contact createContact(ContactWrapper wrapper, Boolean serialize) {
        Contact contact = new Contact();
        contact.Name = wrapper.name;
        contact.Phone = wrapper.phone;
        contact.HomePhone = wrapper.homePhone;
        contact.Email = wrapper.email;
        contact.Broker_Percentage_of_Deal__c = brokerPercentageOfDeal;


 
        if (serialize) insert contact;
 
        return contact;
    }
 
 

    public static List<Contact> getContactsByIds(List<Id> ids, String fields){

        String query = 'select ' + fields + ' from Contact where Id in :ids';
        List<Contact> contacts = Database.query(query);
        return contacts;
    } 
    
    public static Contact getContactById(Id contactId, String fields){

        String query = 'select ' + fields + ' from Contact where Id=:contactId';
        Contact contact = Database.query(query);
        return contact;
    }
    
    public static List<Contact> getContactsByEmail(String email){

        if (email == null) return new List<Contact>();
        
        String query = 'select ' + fields + ' from Contact where Email=:email';
        List<Contact> contacts = Database.query(query);
        return contacts;
    } 

    public static List<Contact> getContactsByEmails(List<String> emails){

        if (email.isEmpty()) return new List<Contact>();
        
        String query = 'select ' + fields + ' from Contact where Email=:emails';
        List<Contact> contacts = Database.query(query);
        return contacts;
    } 

    public static List<Contact> updateContactsPhoneByIds(String newPhone, List<Id> ids, Boolean serialize) {
        String query = 'select ' + fields + ' from Contact where Id in :ids';
        List<Contact> newContacts = Database.query(query);
        for(Contact contact : newContacts) {
            contact.Phone = newPhone;
        }

        if (serialize) update newContacts;

        return newContacts;
    }

    public static void deleteContactsByEmails(List<String> emails) {
        delete [SELECT Id FROM Contact WHERE Email IN :emails];
    }   
    
}
