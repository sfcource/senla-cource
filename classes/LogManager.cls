public class LogManager {
    public static String fields = 
       'Id, Name, Message__c, Type__c';
       


       public class LogWrapper {
        public String name {get; set;}
        public String message {get; set;}
        public String type {get; set;}
        
                
    }

    public static Log__c createLog(LogWrapper wrapper, Boolean serialize) {
        Log__c log = new Log__c();
        log.Name = wrapper.name;
        log.Message__c = wrapper.message;
        log.Type__c = wrapper.type;


 
        if (serialize) insert log;
 
        return log;
    }
 
 

    public static List<Log__c> getLogsByIds(List<Id> ids, String fields){

        String query = 'select ' + fields + ' from Log__c where Id in :ids';
        List<Log__c> logs = Database.query(query);
        return logs;
    } 
    
    public static Log__c getLogById(Id logId, String fields){

        String query = 'select ' + fields + ' from Log__c where Id=:logId';
        Log__c log = Database.query(query);
        return log;
    }
    
    public static List<Log__c> getLogsByMessage(String message){

        String query = 'select ' + fields + ' from Log__c where Message__c=:message';
        List<Log__c> logs = Database.query(query);
        return logs;
    } 
    public static List<Log__c> getLogsByType(String type){

        String query = 'select ' + fields + ' from Log__c where Type__c=:type';
        List<Log__c> logs = Database.query(query);
        return logs;
    } 
   
    
}
